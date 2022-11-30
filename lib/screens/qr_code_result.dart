import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymui/controllers/qrcoderesultcontroller.dart';
import 'package:gymui/controllers/view_history_controller.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeResult extends StatefulWidget {
  final Barcode result;
  const QrCodeResult({super.key, required this.result});

  @override
  State<QrCodeResult> createState() => _QrCodeResultState();
}

class _QrCodeResultState extends State<QrCodeResult> {
  final viewHistoryController = Get.put(ViewHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'QR Code Result',
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
              onTap: (){
                // viewHistoryController.apiCallFoQrcodedata();
              },
              child: Text(widget.result.code!)),

        ),
      ),
    );
  }
}
