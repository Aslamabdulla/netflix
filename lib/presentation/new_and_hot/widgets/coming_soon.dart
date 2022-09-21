import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/widgets/custom-button_widget.dart';
import 'package:netflix/presentation/new_and_hot/widgets/video_widgets.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 450,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "FEB",
                  style: kTextStyle18,
                ),
                Text(
                  "11",
                  style: kTextStyle30,
                )
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 50,
            height: 450,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoWidget(
                    image:
                        "https://www.themoviedb.org/t/p/original/j7FnrXS9auRjRPanb4qGa1xiCEP.jpg"),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("TALL GIRL 2",
                        style: GoogleFonts.amaticSc(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        )),
                    Spacer(),
                    Row(
                      children: [
                        CustomButtonWidget(
                          icon: Icons.notifications,
                          title: "Remind me",
                          iconSize: 20,
                          textSize: 12,
                        ),
                        kWidth,
                        CustomButtonWidget(
                          icon: Icons.info,
                          title: "Info",
                          iconSize: 20,
                          textSize: 12,
                        ),
                        kWidth
                      ],
                    ),
                  ],
                ),
                Text(
                  "Coming on Friday",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 50,
                  height: 30,
                  child: Image.network(
                      "https://assets.stickpng.com/images/580b57fcd9996e24bc43c529.png"),
                ),
                Text(
                  "Tall Girl 2",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kWhiteColor,
                  ),
                ),
                kHeight,
                Text(
                  "Landing the lead in the school musical is a dream come true for jodi,until the pressure sends her confidence--and her relationship -- into a tailspin. ",
                  style:
                      TextStyle(color: kGreyColor, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
