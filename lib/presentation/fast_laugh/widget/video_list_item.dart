// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
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
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(
                            "https://www.themoviedb.org/t/p/original/rUwhgbwn4afF7PFBoQE2BBysFIg.jpg"),
                      ),
                    ),
                    VideoActionsWidget(
                        icon: Icons.emoji_emotions, title: 'LOL'),
                    VideoActionsWidget(icon: Icons.add, title: 'My List'),
                    VideoActionsWidget(icon: Icons.share, title: 'Share'),
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
