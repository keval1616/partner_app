import 'package:flutter/material.dart';
import 'package:gymui/schema/text_style.dart';

class MyTitle extends StatelessWidget {
  final String title;
  const MyTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle().normal17w600,
    );
  }
}
