import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/core/debouncer/debouncer.dart';
import 'package:netflix/presentation/search/search_idle.dart';
import 'package:netflix/presentation/search/search_result.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});
  final _debouncer = Debouncer(milliseconds: 1 * 1000);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Intialize());
    });
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              backgroundColor: Colors.grey.withOpacity(.4),
              prefixIcon: Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.white,
              ),
              style: TextStyle(color: Colors.grey),
              onChanged: ((value) {
                if (value.isEmpty) {
                  return;
                }
                _debouncer.run(() {
                  BlocProvider.of<SearchBloc>(context)
                      .add(SearchMovie(movieQuery: value));
                });
              }),
            ),
            kHeight,
            // Expanded(child: SearchIdleScreen()),
            Expanded(child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state.searchResultList.isEmpty) {
                  return SearchIdleScreen();
                } else {
                  return SearchResult();
                }
              },
            )),
          ],
        ),
      )),
    );
  }
}
