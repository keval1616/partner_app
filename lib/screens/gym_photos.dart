import 'package:flutter/material.dart';
import 'package:gymui/utils.dart';
import 'package:gymui/widgets/height_spacer.dart';

class GymPhotos extends StatefulWidget {
  final List<String> photos;
  final String name;
  const GymPhotos({super.key, required this.name, required this.photos});

  @override
  State<GymPhotos> createState() => _GymPhotosState();
}

class _GymPhotosState extends State<GymPhotos> {
  List<String> sports = [
    'ACROBATIC SPORTS',
    'WATER SPORTS',
    'ACROBATIC SPORTS',
    'WATER SPORTS'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20.0,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: widget.photos.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 20,
                      height: 200.0,
                      child: Stack(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 20,
                            height: 200.0,
                            child: Image.network(
                              widget.photos[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                              right: 10.0,
                              bottom: 10.0,
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 3.0, color: Utlis.green)),
                                child: Center(
                                  child: Icon(
                                    Icons.favorite,
                                    color: Utlis.green,
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                    const HeightSpacer(height: 10.0),
                    SizedBox(
                      height: 25.0,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          itemCount: sports.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 10.0),
                              margin: const EdgeInsets.only(right: 10.0),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20.0)),
                                  border: Border.all(
                                      width: 1.0, color: Utlis.green)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.sports_gymnastics,
                                    color: Utlis.green,
                                    size: 15.0,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                    sports[index].toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 12.0, color: Utlis.green),
                                  )
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
