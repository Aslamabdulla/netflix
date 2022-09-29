import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
    required this.category,
    required this.index,
  }) : super(key: key);

  final List category;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          category[index],
          style: TextStyle(color: Colors.grey),
        ),
        kHeight,
        index == 13
            ? SizedBox()
            : Divider(
                height: 10,
                thickness: .1,
                color: kGreyColor,
              ),
      ],
    );
  }
}
