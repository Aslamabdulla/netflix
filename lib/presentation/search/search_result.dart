// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';

import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/title.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(title: "Movies & TV"),
        kHeight,
        Expanded(child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return GridView.count(
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                shrinkWrap: true,
                crossAxisCount: 3,
                childAspectRatio: 1.1 / 1.4,
                children: List.generate(20, (index) {
                  final movie = state.searchResultList[index];
                  if (movie.posterPath == null) {
                    log(movie.toString());
                    return SizedBox();
                  } else {
                    return MainCard(
                      imageUrl: '$imageAppendurl${movie.posterPath}',
                    );
                  }
                }));
          },
        ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final String imageUrl;
  const MainCard({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(7)),
    );
  }
}
