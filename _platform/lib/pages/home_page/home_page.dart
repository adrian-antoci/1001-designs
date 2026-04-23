import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_thousand_and_one_designs/l10n/app_localizations.dart';
import 'package:one_thousand_and_one_designs/main.dart';

import 'cubits/home_page_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.pageIndex,
  });

  final int pageIndex;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final _assetsBaseUrl = getIt<AppConfig>().apiBaseUrl;
  late final TransformationController _transformationController;

  @override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().loadPage(widget.pageIndex);
    _transformationController = TransformationController(Matrix4.identity()
      ..scale(0.6)
      ..translate(1000.0, 200));
  }

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  void _handleMouseScroll(PointerSignalEvent event) {
    if (event is PointerScrollEvent) {
      final double scaleChange = event.scrollDelta.dy < 0 ? 1.1 : 0.9;
      final Matrix4 transform = _transformationController.value.clone();
      transform.scale(scaleChange, scaleChange);
      _transformationController.value = transform;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        if (state.fetchingDesigns) {
          return _buildBodyLoadingState(context);
        } else if (state.fetchingFailed) {
          return _buildBodyErrorState(context);
        }
        final design = state.designs[state.selectedDesignIndex - 1];

        return Listener(
          onPointerSignal: _handleMouseScroll,
          child: InteractiveViewer(
            transformationController: _transformationController,
            boundaryMargin: const EdgeInsets.all(double.infinity),
            constrained: true,
            panEnabled: true,
            maxScale: 4,
            minScale: 0.1,
            child: SvgPicture.network('$_assetsBaseUrl/${design.folder}/vector.svg'),
          ),
        );
      },
    );
  }

  Widget _buildBodyLoadingState(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          l10n.loading,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          l10n.itWontTakeLong,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }

  Widget _buildBodyErrorState(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          l10n.someWentWrong,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          l10n.pleaseTryAgain,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
