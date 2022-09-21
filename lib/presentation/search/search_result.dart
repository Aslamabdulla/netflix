import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/title.dart';

const imageUrl =
    "https://www.themoviedb.org/t/p/original/1HOYvwGFioUFL58UVvDRG6beEDm.jpg";

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(title: "Movies & TV"),
        kHeight,
        Expanded(
            child: GridView.count(
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                shrinkWrap: true,
                crossAxisCount: 3,
                childAspectRatio: 1.1 / 1.4,
                children: List.generate(20, (index) {
                  return MainCard();
                })))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: NetworkImage(imageUrl), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(7)),
    );
  }
}
