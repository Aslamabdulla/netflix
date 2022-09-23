// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';

import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/widgets/app_bar._widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final _widgetList = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context).add(
        const DownloadsEvent.getDownloadsImages(),
      );
    });
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              title: "Downloads",
            )),
        body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) => _widgetList[index],
            separatorBuilder: (context, index) => const SizedBox(
                  height: 22,
                ),
            itemCount: _widgetList.length));
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kWhiteColor, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
          "We will download a personalized selection of\nmovies and shows for you, so there's\nalways something to watch on your\ndevice",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 15),
        ),
        kHeight,
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            if (state.downloads.isEmpty) {
              return Center(
                child: CupertinoActivityIndicator(),
              );
            }
            return SizedBox(
              width: size.width,
              height: size.width,
              child: state.IsLoading
                  ? const Center(
                      child: CupertinoActivityIndicator(
                        color: kWhiteColor,
                        radius: 30,
                      ),
                    )
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(.5),
                          radius: size.width * .38,
                        ),
                        DownloadsimageWidget(
                          imageList:
                              '$imageAppendurl${state.downloads[0].posterPath}',
                          margin: const EdgeInsets.only(left: 170, top: 50),
                          angle: 25,
                          size: Size(size.width * .35, size.width * .55),
                        ),
                        DownloadsimageWidget(
                          imageList:
                              '$imageAppendurl${state.downloads[1].posterPath}',
                          margin: const EdgeInsets.only(right: 170, top: 50),
                          angle: -25,
                          size: Size(size.width * .35, size.width * .55),
                        ),
                        DownloadsimageWidget(
                          imageList:
                              '$imageAppendurl${state.downloads[2].posterPath}',
                          margin: const EdgeInsets.only(bottom: 40, top: 50),
                          size: Size(size.width * .4, size.width * .6),
                          radius: 10,
                        ),
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 250,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: buttonColorBlue,
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Set up",
                style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: kWhiteColor,
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "See what you can download",
              style: TextStyle(
                  color: kBlackColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kWidth,
        Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        kWidth,
        Text("Smart Downloads")
      ],
    );
  }
}

class DownloadsimageWidget extends StatelessWidget {
  const DownloadsimageWidget(
      {Key? key,
      required this.imageList,
      this.angle = 0,
      required this.margin,
      required this.size,
      this.radius = 10})
      : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(imageList))),
          ),
        ),
      ),
    );
  }
}
