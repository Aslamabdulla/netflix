import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchIdleScreen extends StatelessWidget {
  const SearchIdleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [CupertinoSearchTextField()],
      )),
    );
  }
}
