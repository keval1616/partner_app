import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gymui/utils.dart';
import 'package:marquee/marquee.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeTab extends StatefulWidget {
  const QrCodeTab({super.key});

  @override
  State<QrCodeTab> createState() => _QrCodeTabState();
}

class _QrCodeTabState extends State<QrCodeTab> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 180.0
        : 300.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'QR Code',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              overlay: QrScannerOverlayShape(
                  borderColor: Colors.red,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: scanArea),
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Positioned(top: 100.0, child: textScroll()),
          Positioned(
              bottom: 100.0,
              left: 0.0,
              right: 0.0,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50.0,
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  decoration: BoxDecoration(
                      color: Utlis.green,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30.0))),
                  child: const Center(
                    child: Text(
                      'VIEW CUSTOMER HISTORY',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  Widget textScroll() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      decoration: const BoxDecoration(color: Colors.amberAccent),
      child: Center(
        child: Marquee(
          text: '    Access is allowed    ',
          style: const TextStyle(
              color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
