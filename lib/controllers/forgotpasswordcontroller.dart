import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymui/app_route.dart';

import 'package:gymui/services/api_service.dart';

class ForgotPasswordScreenController extends GetxController {
  RxString emailString = "".obs;
  TextEditingController emailAddressController = TextEditingController(text: "harkhenterprise@gmail.com");
  FocusNode emailAddressFocusNode = FocusNode();

  Future<void> apiCallForForgotPassword() async {
    Map<String, dynamic> paras = {
      "email": emailAddressController.text,
    };
    try {
      final response = await ApiService.makeApiCall(
          "auth/forget-password/", ApiMethodType.post,
          params: paras);

      Get.toNamed(AppRouter.checkMailAddress);
    } catch (e) {
      return;
    }
  }

}
