import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom-button_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/video_widgets.dart';

class Evoryoneswatchingwidget extends StatelessWidget {
  const Evoryoneswatchingwidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight,
          Text(
            "Friends",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: kWhiteColor,
            ),
          ),
          kHeight,
          Text(
            "This hit sitcom follows the merry misadventures of six 20 -something pals as they navigate the pitfalls of work,life and love in1990's Manhattan",
            style: TextStyle(color: kGreyColor, fontWeight: FontWeight.w500),
          ),
          kHeight50,
          VideoWidget(
              image:
                  "https://www.themoviedb.org/t/p/original/bI37vIHSH7o4IVkq37P8cfxQGMx.jpg"),
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
