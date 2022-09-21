// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextHomeNav extends StatelessWidget {
  final String text;
  const TextHomeNav({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    );
  }
}
