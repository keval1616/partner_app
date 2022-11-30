import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymui/app_route.dart';
import 'package:gymui/controllers/home_screen_controller.dart';
import 'package:gymui/services/api_service.dart';
import 'package:gymui/utils/app_preferences.dart';

class ChangeEmailController extends GetxController {
  RxString emailString = "".obs;
  TextEditingController emailAddressController = TextEditingController();
  FocusNode emailAddressFocusNode = FocusNode();
  Future<void> apiCallForChangeEmail() async {
    Map<String, dynamic> paras = {
      "email": emailAddressController.text,
    };
    try {
      final response = await ApiService.makeApiCall(
          "users/${AppPref().userId}/change-email/", ApiMethodType.post,
          params: paras);

      Get.toNamed(AppRouter.checkMailForgotScreen);
    } catch (e) {
      return;
    }
  }
}
