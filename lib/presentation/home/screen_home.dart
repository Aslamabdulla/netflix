// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/background_card.dart';
import 'package:netflix/presentation/home/widgets/custom-button_widget.dart';
import 'package:netflix/presentation/home/widgets/text_home_nav.dart';
import 'package:netflix/presentation/widgets/main_title_card.dart';
import 'package:netflix/presentation/widgets/maintitle.dart';
import 'package:netflix/presentation/widgets/number_card.dart';
import 'package:netflix/presentation/widgets/number_title_card.dart';

import '../widgets/main_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (BuildContext context, value, child) {
        return NotificationListener<UserScrollNotification>(
          onNotification: ((notification) {
            final ScrollDirection direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          }),
          child: Stack(
            children: [
              ListView(
                children: [
                  BackgroundCard(),
                  kHeight,
                  MainTitleCard(
                      title: "Released in the past year",
                      image:
                          "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/hJfI6AGrmr4uSHRccfJuSsapvOb.jpg"),
                  kHeight,
                  MainTitleCard(
                      title: "Trending Now ",
                      image:
                          "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/xf9wuDcqlUPWABZNeDKPbZUjWx0.jpg"),
                  kHeight,
                  NumberTitleCard(),
                  kHeight,
                  MainTitleCard(
                    title: "Tense Dramas",
                    image:
                        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/nJUHX3XL1jMkk8honUZnUmudFb9.jpg",
                  ),
                  kHeight,
                  MainTitleCard(
                    title: "South Indian Cinema",
                    image:
                        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/7jSWOc6jWSw5hZ78HB8Hw3pJxuk.jpg",
                  ),
                  kHeight
                ],
              ),
              scrollNotifier.value == true
                  ? AnimatedContainer(
                      duration: Duration(milliseconds: 3000),
                      width: double.infinity,
                      height: 100,
                      color: Colors.black.withOpacity(0.3),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.network(
                                "https://pngimg.com/uploads/netflix/netflix_PNG8.png",
                                height: 70,
                                width: 70,
                              ),
                              Spacer(),
                              Icon(
                                Icons.cast,
                                color: Colors.white,
                                size: 30,
                              ),
                              kWidth,
                              Container(
                                width: 30,
                                height: 30,
                                color: Colors.blue,
                              ),
                              kWidth,
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextHomeNav(text: "TV Shows"),
                              TextHomeNav(text: "Movies"),
                              TextHomeNav(text: "Categories"),
                            ],
                          )
                        ],
                      ),
                    )
                  : kHeight,
            ],
          ),
        );
      },
    ));
  }
}
