import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_thousand_and_one_designs/pages/home_page/cubits/home_page_cubit.dart';
import 'package:one_thousand_and_one_designs/pages/home_page/cubits/side_panel_cubit.dart';

import '../../../widgets/scale_on_hover_container.dart';

class SidePanel extends StatefulWidget {
  SidePanel({super.key});

  @override
  State<SidePanel> createState() => _SidePanelState();
}

class _SidePanelState extends State<SidePanel> {
  final _panel = Colors.deepPurpleAccent;
  final TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScaleOnHoverWidget(
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20, left: 40),
        width: 310,
        height: double.infinity,
        decoration: BoxDecoration(
          color: _panel,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: _panel.withOpacity(0.3),
              offset: Offset(4, 4),
              blurRadius: 33,
              spreadRadius: 10,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 38),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "1001 Designs",
                style:
                    GoogleFonts.montserrat().copyWith(color: Colors.white, fontSize: 27, fontWeight: FontWeight.w900),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: TextField(
                  controller: _editingController,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(width: 2, color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(width: 2, color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(width: 2, color: Colors.white),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.white, fontSize: 12),
                    hintText: "Search by name...",
                    fillColor: Colors.transparent,
                  ),
                ),
              ),
              Expanded(
                child: BlocBuilder<HomePageCubit, HomePageState>(
                  builder: (context, state) => state.designs.isNotEmpty
                      ? BlocProvider(
                          create: (context) => SidePanelCubit(state.designs, _editingController),
                          child: DesignsListView(),
                        )
                      : SizedBox.shrink(),
                ),
              ),
              SizedBox(height: 16),
              Text("By Adrian Antoci", style: TextStyle(fontSize: 12, color: Colors.white)),
              Text("Software Developer", style: TextStyle(fontSize: 12, color: Colors.white)),
            ],
          ),
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
    return Material(
      color: Colors.transparent,
      child: BlocBuilder<HomePageCubit, HomePageState>(
        buildWhen: (previous, current) => current.selectedDesignIndex != previous.selectedDesignIndex,
        builder: (context, homePageState) => BlocBuilder<SidePanelCubit, SidePanelState>(
          builder: (context, sidePanelState) => ListView.separated(
              shrinkWrap: true,
              itemCount: sidePanelState.searchResults.length,
              separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
              itemBuilder: (context, index) {
                final item = sidePanelState.searchResults[index];
                final selected = item.count == homePageState.selectedDesignIndex;
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  onTap: () {
                    context.go('/d/${sidePanelState.searchResults[index].count}');
                  },
                  tileColor: selected ? Colors.white.withOpacity(0.1) : Colors.transparent,
                  leading: AnimatedSize(
                    duration: Duration(milliseconds: 300),
                    child: Container(
                      width: 2,
                      height: selected ? double.infinity : 0,
                      color: selected ? Colors.red : Colors.transparent,
                    ),
                  ),
                  title: Text(
                    "#${sidePanelState.searchResults[index].count}",
                    style: TextStyle(
                        fontWeight: selected ? FontWeight.w900 : FontWeight.normal, color: Colors.white, fontSize: 20),
                  ),
                  subtitle: Text(
                    sidePanelState.searchResults[index].name,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
