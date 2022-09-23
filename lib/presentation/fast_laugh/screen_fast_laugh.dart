import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

import 'package:netflix/presentation/fast_laugh/widget/video_list_item.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
    });
    return Scaffold(
        body: SafeArea(child: BlocBuilder<FastLaughBloc, FastLaughState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CupertinoActivityIndicator(
              radius: 30,
              color: kWhiteColor,
            ),
          );
        } else if (state.isError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Icon(
                  CupertinoIcons.wifi_slash,
                  color: kWhiteColor,
                  size: 50,
                ),
              ),
              kHeight,
              Text("Check internet connection!!")
            ],
          );
        } else if (state.videosList.isEmpty) {
          return const Center(
            child: Text("No Video Found"),
          );
        } else {
          return PageView(
            scrollDirection: Axis.vertical,
            children: List.generate(
                state.videosList.length,
                (index) => VideoListItemInheritedWidget(
                    widget:
                        VideoListItem(key: Key(index.toString()), index: index),
                    movieData: state.videosList[index])),
          );
        }
      },
    )));
  }
}
