// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/category_list.dart';

class CategoriesDrop extends StatelessWidget {
  final String text;
  CategoriesDrop({
    Key? key,
    required this.text,
  }) : super(key: key);
  List category = [
    "Action",
    "Anime",
    "Black Stories",
    "Children & Family",
    "Comedies",
    "Crime",
    "Critically Acclaimed",
    "Critics Choice Award",
    "Documentaries",
    "Dramas",
    "Fantasy",
    "Horror",
    "Independent",
    "International"
  ];

  @override
  Widget build(BuildContext context) {
    final AlignmentGeometry? alignment;
    const AlignmentGeometry center = Alignment(0.0, 0.0);
    return TextButton.icon(
      style: TextButton.styleFrom(
        foregroundColor: kWhiteColor,
      ),
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                actionsAlignment: MainAxisAlignment.center,
                scrollable: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                backgroundColor: Colors.black87.withOpacity(.85),
                content: SizedBox(
                  height: MediaQuery.of(context).size.height - 200,
                  width: MediaQuery.of(context).size.width - 40,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: List.generate(
                        category.length,
                        (index) => GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: CategoryWidget(
                                category: category,
                                index: index,
                              ),
                            )),
                  ),
                )));
      },
      label: const Icon(
        Icons.arrow_drop_down,
        size: 30,
      ),
      icon: Text(
        text,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),

      // text,

      //
    );
  }
}
