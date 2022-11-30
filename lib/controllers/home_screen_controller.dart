import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gymui/controllers/get_gymdata_controller.dart';
import 'package:gymui/model/me_profile_model.dart';
import 'package:gymui/services/api_service.dart';
import 'package:gymui/utils/app_preferences.dart';

class HomeScreenController extends GetxController {
  ProfileModel profileModel = ProfileModel();
  Future<void> apiCallFoHomeScreen() async {
    try {
      final response = await ApiService.makeApiCall("me/", ApiMethodType.get,
          doShowLoader: false);

      if (response != null) {
        print(response);
        AppPref().userId = response['id'].toString();
        AppPref().partner_id = response['partner_id'].toString();
        print(AppPref().userId);
        print("======00000000--${AppPref().partner_id}");
      }
    } catch (e) {
      return;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    apiCallFoHomeScreen();


    super.onInit();
  }
}
