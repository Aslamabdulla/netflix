// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/title.dart';

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
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoding) {
                return const Center(
                  child: CupertinoActivityIndicator(
                    radius: 30,
                    color: kWhiteColor,
                  ),
                );
              } else if (state.isError) {
                return const Center(
                  child: Text("Search Movies"),
                );
              } else if (state.idleList.isEmpty) {
                return Center(
                  child: Text("No Movies"),
                );
              }
              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final movie = state.idleList[index];
                    return TopSearchItemTile(
                        title: movie.title ?? "No Title",
                        imageUrl: '$imageAppendurl${movie.backdropPath}');
                  },
                  separatorBuilder: (context, index) => kHeight20,
                  itemCount: state.idleList.length);
            },
          ),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearchItemTile({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

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
        kWidth,
        Expanded(
            child: Text(
          title,
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
