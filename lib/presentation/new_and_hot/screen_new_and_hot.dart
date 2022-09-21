import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom-button_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/coming_soon.dart';
import 'package:netflix/presentation/new_and_hot/widgets/everyones_watching.dart';
import 'package:netflix/presentation/new_and_hot/widgets/video_widgets.dart';
import 'package:netflix/presentation/widgets/app_bar._widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text(
                "New & Hot",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
              actions: [
                Icon(
                  Icons.cast,
                  color: Colors.white,
                  size: 30,
                ),
                kWidth,
                Container(
                  width: 30,
                  height: 30,
                  color: Colors.blue,
                ),
              ],
              bottom: TabBar(
                  isScrollable: true,
                  unselectedLabelColor: kWhiteColor,
                  labelColor: kBlackColor,
                  labelStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                      borderRadius: kRadius30, color: kWhiteColor),
                  tabs: [
                    Tab(
                      height: 35,
                      text: "🍿 Coming Soon",
                    ),
                    Tab(
                      height: 35,
                      text: "👀 Everyone's watching",
                    )
                  ]),
            ),
          ),
          body: TabBarView(
              children: [_buildComingSoon(), _buildeveryonesWatching()])),
    );
  }
}

Widget _buildComingSoon() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (BuildContext context, index) {
      return ComingSoonWidget();
    },
  );
}

Widget _buildeveryonesWatching() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) {
      return Evoryoneswatchingwidget();
    },
  );
}
