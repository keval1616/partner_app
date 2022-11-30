


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymui/app_route.dart';

import '../services/api_service.dart';

class ContectUsController extends GetxController {

  TextEditingController nameControler = TextEditingController();
  FocusNode nameFocusNode = FocusNode();
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  TextEditingController massageController = TextEditingController();
  FocusNode massageFocusNode = FocusNode();
  Future<void> apiCallForContactUs() async {
    Map<String, dynamic> paras = {

        "name": nameControler.text,
        "email": emailController.text,
        "message": massageController.text

    };
    try {
      final response = await ApiService.makeApiCall(
          "contact-us/", ApiMethodType.post,
          params: paras);

      Get.back();
    } catch (e) {
      return;
    }
  }


}