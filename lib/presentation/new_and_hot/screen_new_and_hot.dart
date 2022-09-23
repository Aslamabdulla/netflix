import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/application/hot_and_new_bloc/hot_and_new_bloc.dart';
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
                const Icon(
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
                  labelStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                      borderRadius: kRadius30, color: kWhiteColor),
                  tabs: [
                    const Tab(
                      height: 35,
                      text: "🍿 Coming Soon",
                    ),
                    const Tab(
                      height: 35,
                      text: "👀 Everyone's watching",
                    )
                  ]),
            ),
          ),
          body: TabBarView(children: [
            ComingSoonlist(key: Key("coming_soon")),
            EveryOnesWatchingWidget(
              key: Key("Every_one"),
            )
          ])),
    );
  }
}

// Widget _buildComingSoon() {
//   return ListView.builder(
//     itemCount: 10,
//     itemBuilder: (BuildContext context, index) {
//       return ComingSoonWidget();
//     },
//   );
// }

// Widget _buildeveryonesWatching() {
//   return ListView.builder(
//     itemCount: 10,
//     itemBuilder: (context, index) {
//       return

//     },
//   );
// }

class ComingSoonlist extends StatelessWidget {
  const ComingSoonlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingsoon());
    });
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CupertinoActivityIndicator(color: kWhiteColor, radius: 30),
          );
        } else if (state.hasError) {
          return const Center(
            child: Text("Error"),
          );
        } else if (state.comingSoonList.isEmpty) {
          return const Center(
            child: Text("No Result"),
          );
        } else {
          return ListView.builder(
            itemCount: state.comingSoonList.length,
            itemBuilder: (BuildContext context, index) {
              final movie = state.comingSoonList[index];
              if (movie.id == null) {
                return const SizedBox();
              }

              return ComingSoonWidget(
                id: movie.id.toString(),
                month: 'MAR',
                backdropPath: "$imageAppendurl${movie.backdropPath}",
                posterPath: "$imageAppendurl${movie.posterPath}",
                movieName: movie.originalTitle ?? 'No Title',
                description: movie.overview ?? "NO Descriptiob",
                day: "11",
              );
            },
          );
        }
      },
    );
  }
}

class EveryOnesWatchingWidget extends StatelessWidget {
  const EveryOnesWatchingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingsoon());
    });
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
      if (state.isLoading) {
        return const Center(
          child: CupertinoActivityIndicator(color: kWhiteColor, radius: 30),
        );
      } else if (state.hasError) {
        return const Center(
          child: Text("Error"),
        );
      } else if (state.comingSoonList.isEmpty) {
        return const Center(
          child: Text("No Result"),
        );
      } else {
        return ListView.builder(
          itemCount: state.comingSoonList.length,
          itemBuilder: (BuildContext context, index) {
            final movie = state.comingSoonList[index];
            if (movie.id == null) {
              return const SizedBox();
            }
            return Evoryoneswatchingwidget(
              backdropPath: "$imageAppendurl${movie.backdropPath}",
              movieName: movie.originalTitle ?? 'No Title',
              description: movie.overview ?? "NO Descriptiob",
            );
          },
        );
      }
    });
  }
}
