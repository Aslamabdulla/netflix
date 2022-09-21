import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/title.dart';

const imageUrl =
    "https://www.themoviedb.org/t/p/w250_and_h141_face/xfNHRI2f5kHGvogxLd0C5sB90L7.jpg";

class SearchIdleScreen extends StatelessWidget {
  const SearchIdleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(
          title: "Top Searches",
        ),
        kHeight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => TopSearchItemTile(),
              separatorBuilder: (context, index) => kHeight20,
              itemCount: 10),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * .35,
          height: 65,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageUrl))),
        ),
        Expanded(
            child: Text(
          "Movie Name",
          style: TextStyle(
              color: kWhiteColor, fontWeight: FontWeight.bold, fontSize: 16),
        )),
        const CircleAvatar(
          backgroundColor: kBlackColor,
          radius: 30,
          child: Icon(
            CupertinoIcons.play_circle,
            color: kWhiteColor,
            size: 45,
          ),
        )
      ],
    );
  }
}
