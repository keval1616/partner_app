import 'package:get/get.dart';
import 'package:gymui/schema/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gymui/widgets/height_spacer.dart';

class TermsOfUser extends StatelessWidget {
  const TermsOfUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              appBarWidget(),
              const HeightSpacer(height: 20.0),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Last updated: 15 September 2022',
                      style: const TextStyle().normal14w400,
                    ),
                    const HeightSpacer(height: 20.0),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam nec sem convallis, gravida arcu feugiat, ultricies felis. Donec molestie congue mattis. Donec at dui mauris. Donec euismod nisl turpis. Pellentesque tempus felis in posuere aliquet. Curabitur elementum, erat et vehicula viverra, est massa congue elit, vitae tristique urna mi in felis. Morbi quis leo nec dolor malesuada elementum. In laoreet justo nec pharetra interdum. Praesent id lacus ac mauris pellentesque posuere. Nullam luctus gravida tempor. Nullam et nisl pellentesque, cursus ipsum eu, tempus dui. Ut purus turpis, scelerisque nec hendrerit quis, consectetur eget urna\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam nec sem convallis, gravida arcu feugiat, ultricies felis. Donec molestie congue mattis. Donec at dui mauris. Donec euismod nisl turpis. Pellentesque tempus felis in posuere aliquet. Curabitur elementum, erat et vehicula viverra, est massa congue elit, vitae tristique urna mi in felis. Morbi quis leo nec dolor malesuada elementum. In laoreet justo nec pharetra interdum. Praesent id lacus ac mauris pellentesque posuere. Nullam luctus gravida tempor. Nullam et nisl pellentesque, cursus ipsum eu, tempus dui. Ut purus turpis, scelerisque nec hendrerit quis, consectetur eget urna\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam nec sem convallis, gravida arcu feugiat, ultricies felis. Donec molestie congue mattis. Donec at dui mauris. Donec euismod nisl turpis. Pellentesque tempus felis in posuere aliquet. Curabitur elementum, erat et vehicula viverra, est massa congue elit, vitae tristique urna mi in felis. Morbi quis leo nec dolor malesuada elementum. In laoreet justo nec pharetra interdum. Praesent id lacus ac mauris pellentesque posuere. Nullam luctus gravida tempor. Nullam et nisl pellentesque, cursus ipsum eu, tempus dui. Ut purus turpis, scelerisque nec hendrerit quis, consectetur eget urna',
                      style: const TextStyle(height: 1.5).normal14w400,
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget appBarWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 15.0,
          ),
        ),
        Text(
          'Terms Of Use',
          style: const TextStyle(
            fontFamily: TxtFontFamily.oswald,
          ).normal25w600,
        )
      ],
    );
  }
}
