import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:gymui/app_route.dart';
import 'package:gymui/model/viewhistorymodel.dart';
import 'package:gymui/services/api_service.dart';
import 'package:gymui/utils/app_loader.dart';
import 'package:gymui/utils/app_preferences.dart';

class ViewHistoryController extends GetxController {
  // ViewHistoryModel viewHistoryModel = ViewHistoryModel();
  RxList<ViewHistoryModel> viewHistoryModel = <ViewHistoryModel>[].obs;

  //make a list
  // Future<void> apiCallForviewClientHistory() async {
  //   try {
  //     final response = await ApiService.makeApiCall("users/${AppPref().clientId}/visits/", ApiMethodType.get,
  //         doShowLoader: true,);

  //     if (response != null) {
  //       print(response);
  //       // for(int i=0;i<response.length;i++){
  //       //  list.add(
  //       //      ViewHistoryModel.fromJson(response)
  //       //  )
  //       // }
  //       // viewHistoryModel = ViewHistoryModel.fromJson(response);
  //       print("++++++++$response");
  //       // Get.toNamed(AppRouter.viewHistory);
  //     }
  //   } catch (e) {
  //     return;
  //   }
  // }
  Future apiCallForviewClientHistory() async {
    viewHistoryModel.value.clear();
    showLoader(isCancelable: false);
    try {
      final response = await Dio().get(
          "https://stage.srv.apicalfitness.com/api/users/${AppPref().clientId}/visits/",
    
          options: Options(
              validateStatus: (status) => true,
              contentType: "application/json",
              headers: {
                'Authorization': "Bearer " + AppPref().token,
              
              })
              );
      dismissLoader();
      if (response.statusCode == 200) {
        print(response.data);
        for (int i = 0; i < response.data.length; i++) {
          viewHistoryModel.add(ViewHistoryModel.fromJson(response.data[i]));
        }
        Get.toNamed(AppRouter.viewHistory);

        // viewHistoryModel = ViewHistoryModel.fromJson(response.data);
      } else {}
    } catch (error) {
      print(error);
      
    }
  }

 
  
 
}
