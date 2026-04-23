import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:one_thousand_and_one_designs/l10n/app_localizations.dart';
import 'package:one_thousand_and_one_designs/pages/home_page/cubits/home_page_cubit.dart';
import 'package:one_thousand_and_one_designs/pages/home_page/cubits/side_panel_cubit.dart';
import 'package:one_thousand_and_one_designs/theme/measurements.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SidePanel extends StatefulWidget {
  const SidePanel({super.key});

  @override
  State<SidePanel> createState() => _SidePanelState();
}

class _SidePanelState extends State<SidePanel> {
  final TextEditingController _editingController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Request focus after the first frame is rendered.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_searchFocusNode);
    });
  }

  @override
  void dispose() {
    _editingController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final panelColor = theme.colorScheme.surfaceContainerHigh;

    return Container(
      margin: const EdgeInsets.only(
        top: AppMeasurements.gapLg,
        bottom: AppMeasurements.gapLg,
        left: AppMeasurements.gapXL,
      ),
      width: 310,
      height: double.infinity,
      decoration: BoxDecoration(
        color: panelColor,
        borderRadius: BorderRadius.circular(AppMeasurements.gapXXL),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: AppMeasurements.vPaddingLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              l10n.appTitle,
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: AppMeasurements.paddingMd,
              child: TextField(
                focusNode: _searchFocusNode,
                controller: _editingController,
                cursorColor: theme.colorScheme.primary,
                style: TextStyle(color: theme.colorScheme.onSurface),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppMeasurements.gapMd),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppMeasurements.gapMd),
                    borderSide: BorderSide(width: 1, color: theme.colorScheme.primary),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppMeasurements.gapMd),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: AppMeasurements.gapSm),
                    child: Icon(
                      Icons.search,
                    ),
                  ),
                  filled: true,
                  hintStyle: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  hintText: l10n.searchByName,
                  fillColor: theme.colorScheme.surface,
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<HomePageCubit, HomePageState>(
                builder: (context, state) => state.designs.isNotEmpty
                    ? Padding(
                        padding: AppMeasurements.hPaddingMd,
                        child: BlocProvider(
                          create: (context) => SidePanelCubit(state.designs, _editingController),
                          child: const DesignsListView(),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ),
            const SizedBox(height: AppMeasurements.gapMd),
            InkWell(
              onTap: () => launchUrlString('https://github.com/adrian-antoci/1001-designs'),
              child: SvgPicture.asset(
                'assets/github.svg',
                // ignore: deprecated_member_use
                color: theme.colorScheme.onSecondaryContainer,
                height: AppMeasurements.gapLg,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DesignsListView extends StatefulWidget {
  const DesignsListView({
    super.key,
  });

  @override
  State<DesignsListView> createState() => _DesignsListViewState();
}

class _DesignsListViewState extends State<DesignsListView> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: BlocBuilder<HomePageCubit, HomePageState>(
        buildWhen: (previous, current) => current.selectedDesignIndex != previous.selectedDesignIndex,
        builder: (context, homePageState) => BlocBuilder<SidePanelCubit, SidePanelState>(
          builder: (context, sidePanelState) => ListView.separated(
            shrinkWrap: true,
            itemCount: sidePanelState.searchResults.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: AppMeasurements.gapSm,
            ),
            itemBuilder: (context, index) {
              final item = sidePanelState.searchResults[index];
              final selected = item.count == homePageState.selectedDesignIndex;
              return ListTile(
                contentPadding: AppMeasurements.hPaddingLg,
                onTap: () {
                  context.go('/d/${sidePanelState.searchResults[index].count}');
                },
                tileColor: selected ? theme.colorScheme.surface : Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppMeasurements.gapSm),
                ),
                title: Text(
                  "#${sidePanelState.searchResults[index].count}",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                    color: selected ? theme.colorScheme.primary : theme.colorScheme.onSurface,
                  ),
                ),
                subtitle: Text(
                  sidePanelState.searchResults[index].name,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: selected ? theme.colorScheme.primary : theme.colorScheme.onSurface,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
