import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymui/app_route.dart';
import 'package:gymui/model/GetContectModel.dart';
import 'package:gymui/model/get_gymdata_model.dart';
import 'package:gymui/model/socialmedialmodel.dart';
import 'package:gymui/services/api_service.dart';
import 'package:gymui/utils/app_preferences.dart';
import 'package:gymui/utils/dates.dart';
import 'package:image_picker/image_picker.dart';

class GetGymDataController extends GetxController {
  final nameController = TextEditingController();
  final descController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final fbController = TextEditingController();
  final instaController = TextEditingController();
  final twitterController = TextEditingController();
  final wappController = TextEditingController();
  final secondPhoneController = TextEditingController();
  final newPhoneController = TextEditingController();

  FocusNode nameFocusNode = FocusNode();
  FocusNode descFocusNode = FocusNode();
  FocusNode addressFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode secondPhoneFocusNode = FocusNode();
  FocusNode newPhoneFocusNode = FocusNode();
  FocusNode fbFocusNode = FocusNode();
  FocusNode instaFocusNode = FocusNode();
  FocusNode twitterFocusNode = FocusNode();
  FocusNode wappFocusNode = FocusNode();

  final picker = ImagePicker();
  List<String> banners = [
    'https://images.pexels.com/photos/2247179/pexels-photo-2247179.jpeg?auto=compress&cs=tinysrgb&w=800',
    'https://images.pexels.com/photos/897064/pexels-photo-897064.jpeg?auto=compress&cs=tinysrgb&w=800'
  ];
  List<List<Dates>> dates = [];
  List<int> dateIds = [];
  Rx<SocialMediaDataModel> socialMediaDataModel =
      Rx<SocialMediaDataModel>(SocialMediaDataModel());
  Rx<GetContectModel> getContectModel = Rx<GetContectModel>(GetContectModel());
  Rx<GetGymDataModel> getGymDataModel = Rx<GetGymDataModel>(GetGymDataModel());
  Future<void> apiCallForGetGymData() async {
    try {
      final response = await ApiService.makeApiCall(
          "partners/${AppPref().partner_id}/", ApiMethodType.get,
          doShowLoader: true);

      if (response != null) {
        getGymDataModel.value = GetGymDataModel.fromJson(response);
        print(getGymDataModel);

        Get.toNamed(AppRouter.changeGymData);
      }
    } catch (e) {
      return;
    }
  }

  Future<void> apiCallForUpdateGymData() async {
    Map<String, dynamic> paras = {
      "name": nameController.text,
      "category": 11,
      "sports": [1, 4, 5, 6],
      "description": descController.text,
      "age_group": "young",
      "subscribed_plan": "gold",
      "postal_code": "34752",
      "city": "Whitehorse",
      "address_line1": addressController.text,
      "address_line2": "",
      "long": "",
      "lat": ""
    };

    try {
      final response = await ApiService.makeApiCall(
          "partners/${AppPref().partner_id}/social-media/", ApiMethodType.put,
          doShowLoader: true, params: paras);

      if (response != null) {
        getGymDataModel.value = GetGymDataModel.fromJson(response);
        print(getGymDataModel);
        print("-------------------$getGymDataModel");
      }
    } catch (e) {
      return;
    }
  }

  Future<void> apiCallForUploadImage(String imageUrl, XFile element) async {
    print(imageUrl);

    Map<String, dynamic> paras = {
      "image": imageUrl,
    };
    print(paras);
    try {
      final response = await ApiService.makeApiCall(
          "partners/${AppPref().partner_id}/partner-images/",
          ApiMethodType.post,
          doShowLoader: true,
          params: paras);

      if (response != null) {
        getGymDataModel.value.images!.add(Images(image: element.path));
        update();
        print(response);
      }
    } catch (e) {
      return;
    }
  }

  Future<void> apiCallForUploadLogo(String imageUrl) async {
    print(imageUrl);

    Map<String, dynamic> paras = {
      "logo": imageUrl,
    };
        print(paras);
    try {
      final response = await ApiService.makeApiCall(
          "partners/${AppPref().partner_id}/", ApiMethodType.patch,
          doShowLoader: true, params: paras);

      if (response != null) {
        // getGymDataModel.value.images!.add(Images(image: element.path));
        update();
        print(response);
      }
    } catch (e) {
      return;
    }
  }

  Future<void> apiCallForGetSocialMediaData() async {
    try {
      final response = await ApiService.makeApiCall(
          "partners/${AppPref().partner_id}/social-media/", ApiMethodType.get,
          doShowLoader: true);

      if (response != null) {
        socialMediaDataModel.value = SocialMediaDataModel.fromJson(response);
        print(socialMediaDataModel);
        print(response);
        // Get.toNamed(AppRouter.changeGymData);
      }
    } catch (e) {
      return;
    }
  }

  Future<void> apiCallForPutSocialMediaData() async {
    Map<String, dynamic> paras = {
      "facebook": fbController.text,
      "instagram": instaController.text,
      "twitter": twitterController.text,
      "whatsapp": wappController.text,
    };

    try {
      final response = await ApiService.makeApiCall(
          "partners/${AppPref().partner_id}/social-media/", ApiMethodType.put,
          doShowLoader: true, params: paras);

      if (response != null) {
        socialMediaDataModel.value = SocialMediaDataModel.fromJson(response);
        print(socialMediaDataModel);
        print("-------------------$socialMediaDataModel");
      }
    } catch (e) {
      return;
    }
  }

  Future<void> apiCallForContactInformation() async {
    try {
      final response = await ApiService.makeApiCall(
          "partners/${AppPref().partner_id}/contact-information//",
          ApiMethodType.get,
          doShowLoader: true);

      if (response != null) {
        getContectModel.value = GetContectModel.fromJson(response);
        print(getContectModel);
        print(response);
        // Get.toNamed(AppRouter.changeGymData);
      }
    } catch (e) {
      return;
    }
  }
    Future<void> apiCallForPostContactInformation() async {
        Map<String, dynamic> paras = {
      "email": emailController.text,
      "phone_numbers": [phoneController.text, secondPhoneController.text],

    };

    try {
      final response = await ApiService.makeApiCall(
          "partners/${AppPref().partner_id}/contact-information//",
          ApiMethodType.put,params: paras,
          doShowLoader: true);

      if (response != null) {
        
  
        print(response);
        // Get.toNamed(AppRouter.changeGymData);
      }
    } catch (e) {
      return;
    }
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // apiCallForUploadImage();
    });
    super.onInit();
  }
}
