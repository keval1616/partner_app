import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:gymui/schema/appcolor.dart';

int noOfCallRunning = 0;

showLoader({bool isCancelable = false}) {
  if (!(Get.isDialogOpen ?? false)) noOfCallRunning = 0;
  noOfCallRunning++;
  if (noOfCallRunning == 1) _showLoadingDialog(isCancelable);
}

 dismissLoader() {
  if (noOfCallRunning == 1) Get.back();
  noOfCallRunning--;
}

void _showLoadingDialog(bool isCancelable) {
  Get.dialog(
    WillPopScope(
      onWillPop: () => Future.value(isCancelable),
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: (Get.width - 240) / 2),
          height: 120,
          child: const SpinKitCubeGrid(color: Colors.green, size: 45),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: AppColor.white),
        ),
      ),
    ),
    barrierDismissible: isCancelable,
  );
}
