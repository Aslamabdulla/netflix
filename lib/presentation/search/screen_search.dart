import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          CupertinoSearchTextField(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
          )
        ],
      )),
    );
  }
}
