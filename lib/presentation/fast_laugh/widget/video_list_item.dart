// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';

import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/downloads/models/downloads_file.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;
  const VideoListItemInheritedWidget(
      {Key? key, required this.widget, required this.movieData})
      : super(key: key, child: widget);

  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final videoUrl = dummyvideoUrl[index % dummyvideoUrl.length];
    final posterPath =
        VideoListItemInheritedWidget.of(context)?.movieData.posterPath;
    return Stack(
      children: [
        FastLaughVideoPlayer(
          videoUrrl: videoUrl,
          onStateChanged: (bool) {},
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(.5),
                    radius: 30,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.volume_off,
                          color: kWhiteColor,
                        ))),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: posterPath == null
                            ? null
                            : NetworkImage('$imageAppendurl$posterPath'),
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: likedVideosIdsNotifier,
                      builder: (BuildContext context,
                          Set<int> newLikedVideosIds, _) {
                        final _index = index;
                        if (newLikedVideosIds.contains(_index)) {
                          return GestureDetector(
                            onTap: () {
                              likedVideosIdsNotifier.value.remove(index);
                              likedVideosIdsNotifier.notifyListeners();
                            },
                            child: VideoActionsWidget(
                              icon: Icons.emoji_emotions_rounded,
                              title: 'Liked',
                            ),
                          );
                        } else {
                          return GestureDetector(
                            onTap: () {
                              likedVideosIdsNotifier.value.add(index);
                              likedVideosIdsNotifier.notifyListeners();
                            },
                            child: VideoActionsWidget(
                                icon: Icons.emoji_emotions_outlined,
                                title: 'LOL'),
                          );
                        }
                      },
                    ),
                    VideoActionsWidget(icon: Icons.add, title: 'My List'),
                    GestureDetector(
                        onTap: () {
                          final movieName =
                              VideoListItemInheritedWidget.of(context)
                                  ?.movieData
                                  .posterPath;
                          final movie = '$imageAppendurl$movieName';
                          if (movieName != null) {
                            Share.share(movie);
                          }
                        },
                        child: VideoActionsWidget(
                            icon: Icons.share, title: 'Share')),
                    VideoActionsWidget(icon: Icons.play_arrow, title: 'Play')
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionsWidget({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: kWhiteColor,
            size: 30,
          ),
          Text(
            title,
            style: TextStyle(color: kWhiteColor, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrrl;
  final void Function(bool isPlaying) onStateChanged;
  FastLaughVideoPlayer(
      {Key? key, required this.videoUrrl, required this.onStateChanged})
      : super(key: key);

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {
        _videoPlayerController.play();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: _videoPlayerController.value.isInitialized
            ? AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController),
              )
            : Center(
                child: CupertinoActivityIndicator(
                  radius: 30,
                  color: kWhiteColor,
                ),
              ));
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
