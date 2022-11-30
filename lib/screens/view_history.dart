import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymui/controllers/gym_detail_controller.dart';
import 'package:gymui/controllers/view_history_controller.dart';
import 'package:gymui/controllers/viewclientcontroller.dart';
import 'package:gymui/utils/gyms.dart';
import 'package:gymui/screens/gym_details.dart';
import 'package:gymui/utils.dart';
import 'package:gymui/widgets/common_function.dart';
import 'package:gymui/widgets/height_spacer.dart';

class ViewHistory extends StatefulWidget {
  ViewHistory({super.key});

  @override
  State<ViewHistory> createState() => _ViewHistoryState();
}

class _ViewHistoryState extends State<ViewHistory> {
  final viewHistoryController = Get.put(ViewHistoryController());
  final gymDetailController = Get.put(GymDetailController());
  final ViewClientController viewClientController =
  Get.put(ViewClientController());
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
                TextSpan(
                    text: "View which gyms ",
                    style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600)),
                TextSpan(
                  text: "",
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
                    itemCount:
                        viewHistoryController.viewHistoryModel.value.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            gymDetailController.apiCallFoGymdata();
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) =>
                            //         GymDetails()));
                          },
                          child: gymCard(index));
                    }))
          ],
        ),
      ),
    );
  }

  Widget gymCard(int index) {
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
                child: imageFromBase64String(
                  viewHistoryController
                          .viewHistoryModel.value[index].partner!.logo ??
                      "",
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
                    viewHistoryController
                            .viewHistoryModel.value[index].partner!.name ??
                        "",
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
    viewHistoryController
        .viewHistoryModel.value[index].partner!.createdDate ??
    "",
                    style: const TextStyle(
                        fontSize: 13.0, fontWeight: FontWeight.w400),
                  )
                ],
              )
            ],
          ),
          const HeightSpacer(height: 10.0),
          Text(
            viewHistoryController
                    .viewHistoryModel.value[index].partner!.addressLine1 ??
                "",
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
