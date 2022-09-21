import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom-button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(kMainImage))),
          width: double.infinity,
          height: 600,
        ),
        Container(
          height: 600,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                  stops: [0.6, 1],
                  colors: [Colors.transparent, Colors.black])),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButtonWidget(title: "My List", icon: Icons.add),
                _playButton(),
                CustomButtonWidget(icon: Icons.info, title: "Info")
              ],
            ),
          ),
        )
      ],
    );
  }
}

TextButton _playButton() {
  return TextButton.icon(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(kWhiteColor)),
      onPressed: () {},
      icon: const Icon(
        CupertinoIcons.play_arrow_solid,
        size: 25,
        color: kBlackColor,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          "Play",
          style: TextStyle(fontSize: 20, color: kBlackColor),
        ),
      ));
}
