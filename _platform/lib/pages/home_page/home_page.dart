import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_thousand_and_one_designs/data_sources/models/api_models.dart';
import 'package:one_thousand_and_one_designs/main.dart';
import 'package:flutter/material.dart';
import 'package:zoomable_interactive_viewer/zoomable_interactive_viewer.dart';
import 'cubits/home_page_cubit.dart';
import 'package:web/web.dart' as web;

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

  @override
  void initState() {
    context.read<HomePageCubit>().loadPage(widget.pageIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        if (state.fetchingDesigns) {
          return _buildBodyLoadingState();
        } else if (state.fetchingFailed) {
          return _buildBodyErrorState();
        }
        return _buildBodyDefaultState(state.designs[state.selectedDesignIndex - 1]);
      },
    );
  }

  Widget _buildBodyLoadingState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Loading...",
          style: TextStyle(fontSize: 35),
        ),
        Text("It won't take long", style: TextStyle(fontSize: 22)),
      ],
    );
  }

  Widget _buildBodyErrorState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          ":( Some went wrong",
          style: TextStyle(fontSize: 35),
        ),
        Text("Please try again", style: TextStyle(fontSize: 22)),
      ],
    );
  }

  Widget _buildBodyDefaultState(DesignModel design) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: EdgeInsets.only(left: 64, top: 20),
          child: _buildTitle(design.count, design.name),
        ),
        SizedBox(
          height: 16,
        ),
        Expanded(
          child: ZoomableInteractiveViewer(
            boundaryMargin: EdgeInsets.all(500),
            constrained: true,
            panEnabled: true,
            maxScale: 4,
            minScale: 0.1,
            enableAnimation: false,
            scaleEnabled: true,
            child: Padding(
              padding: EdgeInsets.only(left: 100, right: 100, bottom: 100),
              // FIXME
              child: design.folder.startsWith('Swara')
                  ? _SVGPreviewWidget(url: '$_assetsBaseUrl/${design.folder}/vector.svg')
                  : SvgPicture.network('$_assetsBaseUrl/${design.folder}/vector.svg'),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(int count, String name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "#$count",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 45, color: Colors.black),
        ),
        Text(name),
      ],
    );
  }
}

class _SVGPreviewWidget extends StatefulWidget {
  final String url;

  const _SVGPreviewWidget({required this.url});

  @override
  State<_SVGPreviewWidget> createState() => _SVGPreviewWidgetState();
}

class _SVGPreviewWidgetState extends State<_SVGPreviewWidget> {
  @override
  Widget build(BuildContext context) {
    return HtmlElementView.fromTagName(
      tagName: 'img',
      onElementCreated: (Object img) {
        img as web.HTMLImageElement;
        img.src = widget.url;
        img.style.width = '100%';
        img.style.height = '100%';
      },
    );
  }
}
