import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymui/controllers/gym_detail_controller.dart';
import 'package:gymui/controllers/qrcoderesultcontroller.dart';
import 'package:gymui/widgets/common_function.dart';
import 'package:gymui/widgets/height_spacer.dart';

class QrClientHistoryScreen extends StatelessWidget {
  QrClientHistoryScreen({super.key});
  final QrCodeController _qrCodeController = Get.find<QrCodeController>();
  final GymDetailController gymDetailController =
      Get.put(GymDetailController());

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
      body: Column(
        children: [
          Obx(
            () => GestureDetector(
              onTap: () {
                gymDetailController.apiCallFoGymdata();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
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
                            _qrCodeController
                                    .viewHistoryModel.value.partner!.logo ??
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
                              _qrCodeController
                                      .viewHistoryModel.value.partner!.name ??
                                  "",
                              style: const TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            const HeightSpacer(height: 10.0),
                            const Text(
                              'Visited:',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              " ",
                              style: const TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.w400),
                            )
                          ],
                        )
                      ],
                    ),
                    const HeightSpacer(height: 10.0),
                    Text(
                      _qrCodeController
                              .viewHistoryModel.value.partner!.addressLine1 ??
                          "",
                      style: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
