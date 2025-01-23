import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'scale_on_hover_container.dart';

class SidePanel extends StatelessWidget {
  final _panel = Colors.deepPurpleAccent;

  SidePanel({super.key});

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
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              Expanded(
                child: DesignsListView(),
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
  const DesignsListView({super.key});

  @override
  State<DesignsListView> createState() => _DesignsListViewState();
}

class _DesignsListViewState extends State<DesignsListView> with SingleTickerProviderStateMixin {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 100,
        separatorBuilder: (context, index) => SizedBox(
          height: 10,
        ),
        itemBuilder: (context, index) => ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () {
            setState(() {
              _selected = index;
            });
          },
          tileColor: index == _selected ? Colors.white.withOpacity(0.1) : Colors.transparent,
          leading: AnimatedSize(
            duration: Duration(milliseconds: 300),
            child: Container(
              width: 2,
              height: index == _selected ? double.infinity : 0,
              color: index == _selected ? Colors.red : Colors.transparent,
            ),
          ),
          title: Text(
            "#$index",
            style: TextStyle(
                fontWeight: index == _selected ? FontWeight.w900 : FontWeight.normal,
                color: Colors.white,
                fontSize: 20),
          ),
          subtitle: Text(
            "Super Design Mega",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
