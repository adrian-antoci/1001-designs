import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_thousand_and_one_designs/pages/home_page/widgets/background.dart';
import 'package:one_thousand_and_one_designs/pages/home_page/widgets/rounded_card.dart';
import 'package:one_thousand_and_one_designs/pages/home_page/widgets/side_panel.dart';
import 'package:flutter/material.dart';
import 'package:zoomable_interactive_viewer/zoomable_interactive_viewer.dart';

import 'home_page_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Stack(
        children: [
          RoundedCard(
            child: HomePageView(),
          ),
          SidePanel(),
        ],
      ),
    );
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {
        if (state.fetchingDesigns) {
          return _buildBodyLoadingState();
        } else if (state.fetchingFailed) {
          return _buildBodyErrorState();
        }
        return _buildBodyDefaultState();
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

  Widget _buildBodyDefaultState() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.only(left: 64, top: 20),
            child: _buildTitle(),
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
                  child: SvgPicture.network(
                    'assets/vector.svg',
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "#21",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 45, color: Colors.black),
        ),
        Text("Contractors Timesheet"),
      ],
    );
  }
}
