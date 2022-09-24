

import 'package:flutter/material.dart';

class CategoriesDrop extends StatelessWidget {
  final String text;
  CategoriesDrop({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(Icons.arrow_downward),
      // text,
      style:
      //  TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    );
  }
}