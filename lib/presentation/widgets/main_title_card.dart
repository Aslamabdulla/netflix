// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/main_card.dart';
import 'package:netflix/presentation/widgets/maintitle.dart';

class MainTitleCard extends StatelessWidget {
  final String title;
  final String image;
  const MainTitleCard({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitle(title: title),
          kHeight,
          LimitedBox(
            maxHeight: 200,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  10,
                  (index) => MainCard(image: image),
                )),
          )
        ],
      ),
    );
  }
}
