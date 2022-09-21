// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:netflix/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 150,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: kRadius10,
          image:
              DecorationImage(fit: BoxFit.cover, image: NetworkImage(image))),
    );
  }
}
