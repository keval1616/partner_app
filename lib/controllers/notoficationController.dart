import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymui/model/notificationmodel.dart';
import 'package:gymui/services/api_service.dart';
import 'package:gymui/utils/app_loader.dart';
import 'package:gymui/utils/app_preferences.dart';

class NotificationController extends GetxController {
  // RxList <notification>posts = [].obs;
  // List <NotificationModel> notification = [];
  RxList<NotificationModel> notificationModel = <NotificationModel>[].obs;

  // Rx<NotificationModel> notificationModel = Rx<NotificationModel>(
  //     NotificationModel());
  // NotificationModel notificationModel = NotificationModel();

  // Future<void> apiCallForNotification() async {
  //   notificationModel.value.clear();
  //   try {
  //     final response = await ApiService.makeApiCall(
  //         "users/${AppPref().userId}/notifications/", ApiMethodType.get,
  //         doShowLoader: true);

  //     if (response != null) {
  //       for (int i = 0; i < response.length; i++) {
  //         notificationModel.add(NotificationModel.fromJson(response[i]));
  //       }
  //       // notification.add(NotificationModel.fromJson(response));
  //       print(notificationModel);
  //     }

  //     // notificationModel.value = NotificationModel.fromJson(response);

  //   } catch (e) {
  //     return;
  //   }
  Future apiCallForNotification() async {
    notificationModel.value.clear();
    showLoader(isCancelable: false);
    try {
      final response = await Dio().get(
          "https://stage.srv.apicalfitness.com/api/users/${AppPref().userId}/notifications/",
          options: Options(
              validateStatus: (status) => true,
              contentType: "application/json",
              headers: {
                'Authorization': "Bearer " + AppPref().token,
              }));
      dismissLoader();
      if (response.statusCode == 200) {
        print(response.data);
        for (int i = 0; i < response.data.length; i++) {
          notificationModel.add(NotificationModel.fromJson(response.data[i]));
        }
      } else {}
    } catch (error) {
      print(error);
    }
  }

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      apiCallForNotification();
    });
    // TODO: implement onInit
    super.onInit();
  }
}
