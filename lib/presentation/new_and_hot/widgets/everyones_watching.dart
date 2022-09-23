// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom-button_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/video_widgets.dart';

class Evoryoneswatchingwidget extends StatelessWidget {
  final String backdropPath;
  final String movieName;
  final String description;
  const Evoryoneswatchingwidget({
    Key? key,
    required this.backdropPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight,
          Text(
            movieName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: kWhiteColor,
            ),
          ),
          kHeight,
          Text(
            description,
            maxLines: 3,
            style: TextStyle(color: kGreyColor, fontWeight: FontWeight.w500),
          ),
          kHeight50,
          VideoWidget(image: backdropPath),
          kHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              CustomButtonWidget(
                icon: Icons.share,
                title: "Share",
                iconSize: 25,
                textSize: 16,
              ),
              kWidth,
              CustomButtonWidget(
                icon: Icons.add,
                title: "My List",
                iconSize: 25,
                textSize: 16,
              ),
              kWidth,
              CustomButtonWidget(
                icon: CupertinoIcons.play_arrow_solid,
                title: "Play",
                iconSize: 25,
                textSize: 16,
              ),
              kWidth
            ],
          )
        ],
      ),
    );
  }
}
