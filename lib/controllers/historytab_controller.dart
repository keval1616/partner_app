import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymui/app_route.dart';
import 'package:gymui/controllers/home_screen_controller.dart';
import 'package:gymui/model/client_history_model.dart';
import 'package:gymui/model/me_profile_model.dart';
import 'package:gymui/services/api_service.dart';
import 'package:gymui/utils/app_preferences.dart';

class HistoryTabController extends GetxController {
  ProfileModel profileModel = ProfileModel();
  ClientHistoryModel clientHistoryModel = ClientHistoryModel();
  Future<void> apiCallFoHistoryData(String startDate,String endDate) async {
    clientHistoryModel = ClientHistoryModel();
    try {
      final response = await ApiService.makeApiCall(
          "partners/${AppPref().partner_id}/history/?start_date=$startDate&end_date=$endDate",
          ApiMethodType.get,
          doShowLoader: true);

      if (response != null) {
        clientHistoryModel = ClientHistoryModel.fromJson(response);
        print(response["user_visits"][0]["id"]);
         AppPref().clientId = response["user_visits"][0]["id"].toString();

         print("@@@@@@@@@@@@@@@@@@@@@@@@${AppPref().clientId.toString()}");
        // print(clientHistoryModel);
        // print(response);
        update();
      }
    } catch (e) {
      return;
    }
  }
  // Future<void> apiCallForFilterHistoryData() async {
  //   clientHistoryModel = ClientHistoryModel();
  //   try {
  //     final response = await ApiService.makeApiCall(
  //         "partners/${AppPref().partner_id}/history/?start_date=2022-02-13&end_date=2022-12-20",
  //         ApiMethodType.get,
  //         doShowLoader: true);

  //     if (response != null) {
  //       clientHistoryModel = ClientHistoryModel.fromJson(response);
  //       print(response["user_visits"][0]["id"]);
  //        AppPref().clientId = response["user_visits"][0]["id"].toString();

  //        print("@@@@@@@@@@@@@@@@@@@@@@@@${AppPref().clientId.toString()}");
  //       // print(clientHistoryModel);
  //       // print(response);
  //       update();
  //     }
  //   } catch (e) {
  //     return;
  //   }
  // }
  @override
  void onInit() async {
    // TODO: implement onInit
   
    super.onInit();
  }
}
