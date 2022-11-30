import 'package:flutter/material.dart';
import 'package:gymui/schema/appcolor.dart';
import 'package:gymui/schema/text_style.dart';

class MySubTitle extends StatelessWidget {
  final String title;
  const MySubTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(color: AppColor.grey).normal12w400,
    );
  }
}
