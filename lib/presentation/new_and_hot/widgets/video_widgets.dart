// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:netflix/core/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(.5),
              radius: 22,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.volume_off,
                    color: kWhiteColor,
                  ))),
        ),
      ],
    );
  }
}
