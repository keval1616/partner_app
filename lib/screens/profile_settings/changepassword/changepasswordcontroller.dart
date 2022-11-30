

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymui/services/api_service.dart';
import 'package:gymui/utils/app_preferences.dart';

class ChangePasswordController extends GetxController {
  TextEditingController oldpasswordController = TextEditingController();
  FocusNode oldpasswordFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode confirmPasswordFocusNode = FocusNode();
  RxBool showPass = false.obs;
  RxBool showConfirmPass = false.obs;
  RxString userPasswordString = "".obs;
  RxString oldPasswordString = "".obs;
  RxString passwordString = "".obs;
  RxString confirmPasswordString = "".obs;

  Future<void> apiCallForChangePassword() async {
    Map<String, dynamic> paras = {
      "password": passwordController.text,
      "password_confirmation": confirmPasswordController.text
    };

    try {
      final response = await ApiService.makeApiCall("users/${AppPref().userId}/change-password/", ApiMethodType.post,
          doShowLoader: true,params: paras);

      if (response != null) {
        print("++++++++$response");


      }
    } catch (e) {
      return;
    }
  }
}