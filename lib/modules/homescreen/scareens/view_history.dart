import 'package:flutter/material.dart';
import 'package:gymui/gyms.dart';
import 'package:gymui/scareens/gym_details.dart';
import 'package:gymui/utils.dart';
import 'package:gymui/widgets/height_spacer.dart';

class ViewHistory extends StatefulWidget {
  final String name;
  const ViewHistory({super.key, required this.name});

  @override
  State<ViewHistory> createState() => _ViewHistoryState();
}

class _ViewHistoryState extends State<ViewHistory> {
  Widget gymCard(Gyms gyms) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 100,
                child: Image.network(
                  gyms.image,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    gyms.name,
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  const HeightSpacer(height: 10.0),
                  const Text(
                    'Visited:',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    gyms.date,
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w400),
                  )
                ],
              )
            ],
          ),
          const HeightSpacer(height: 10.0),
          Text(
            gyms.address,
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Client History',
          style: TextStyle(color: Colors.black),
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: <TextSpan>[
                const TextSpan(
                    text: "View which gyms ",
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600)),
                TextSpan(
                  text: widget.name,
                  style: TextStyle(
                      fontSize: 17.0,
                      color: Utlis.green,
                      fontWeight: FontWeight.w600),
                ),
                const TextSpan(
                    text: " has visited",
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600)),
              ]),
            ),
            const HeightSpacer(height: 20.0),
            Expanded(
                child: ListView.builder(
                    itemCount: Utlis.gyms.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    GymDetails(gyms: Utlis.gyms[index])));
                          },
                          child: gymCard(Utlis.gyms[index]));
                    }))
          ],
        ),
      ),
    );
  }
}
