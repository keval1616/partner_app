// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:gymui/app_route.dart';
import 'package:gymui/services/logger/pretty_dio_logger.dart';
import 'package:gymui/utils/app_loader.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:gymui/utils/app_preferences.dart';

class ApiMethodType {
  static const String post = "POST";
  static const String patch = "PATCH";
  static const String get = "GET";
  static const String put = "PUT";
  static const String delete = "DELETE";
}

class ApiService {
  static Future makeApiCall(String endPoint, String method,
      {Object? params, bool doShowLoader = true}) async {
    late Dio dio;
    Response? response;

    //SET BASE URL
    dio = Dio(
      BaseOptions(
          connectTimeout: 60000,
          receiveTimeout: 60000,
          baseUrl: "https://stage.srv.apicalfitness.com/api/"),
    );

    //SET TOKEN
    dio.interceptors.add(InterceptorsWrapper(
      onRequest:
          (RequestOptions option, RequestInterceptorHandler handler) async {
        var customHeaders = {
          'Accept': 'application/json',
          if (AppPref().token.isNotEmpty)
            'Authorization': "Bearer " + AppPref().token,
          //  https://stage.srv.apicalfitness.com/api/ auth/token/
          // 'Authorization':
          //     "Bearer eyJhbGciOiJIUzI1NiIsInRaa5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY5MzgyMzUwLCJpYXQiOjE2Njg3Nzc1NTAsImp0aSI6IjQ0MGU4YjdlMTgyNjQxMjZiZDQwODMzMmVlZjgyMzE3IiwidXNlcl9pZCI6MX0.bvdkrifbx3sTg8_kWXvx2cYuQJ8-UhueZbDG9Mr1BBQ"
        };
        option.headers.addAll(customHeaders);
        handler.next(option);
      },
      onError: (error, handler) async {
        print(error.requestOptions.uri);

        if (error.response?.statusCode == 403 ||
            error.response?.statusCode == 401) {
          // isrefreshApiCall = true;
          await refreshToken();
          if (doShowLoader) dismissLoader();
          return makeApiCall(endPoint, method, params: {
            params,
          });
        }
        if (doShowLoader) dismissLoader();

        return error.response?.data;
      },
    ));

    /// PreDioLogger to print api log in DEBUG mode
    if (!foundation.kReleaseMode) {
      var logger = PrettyDioLogger(
        maxWidth: 232,
        requestHeader: true,
        requestBody: true,
      );
      dio.interceptors.add(logger);
    }
    //CHECK INTERNET AVAILABLE OR NOT

    if (doShowLoader) showLoader(isCancelable: false);
    try {
      if (method == ApiMethodType.post) {
        response = await dio.post(endPoint, data: params);
      } else if (method == ApiMethodType.get) {
        response = await dio.get(endPoint);
      } else if (method == ApiMethodType.put) {
        response = await dio.put(endPoint, data: params);
      } else if (method == ApiMethodType.patch) {
        response = await dio.patch(endPoint, data: params);
      } else if (method == ApiMethodType.delete) {
        response = await dio.delete(endPoint);
      }
      String message = "";
      String success = "";
      message = response?.data['message'] ?? "";
      success = response?.data['success'] ?? "";
      if (doShowLoader) dismissLoader();
      return response?.data ?? "";
    } on DioError catch (dioError) {
      if (doShowLoader) dismissLoader();
      debugPrint("callApi :: DioError -> $dioError");
      onResponseError(dioError);
      rethrow;
    } catch (error) {
      if (doShowLoader) dismissLoader();
      debugPrint("callApi :: Error -> $error");
      rethrow;
    }
  }

  static onResponseError(onError) {
    debugPrint(
        "onResponseError:onError ${onError.toString()} || ${onError.response.statusCode}");
    if (onError is DioError) {
      switch (onError.response?.statusCode) {
        case 205:
        case 400:

        case 401:
          // showAppToast('Login expires. Please re-login with Phone number.');
          // AppPref().clear();
          // AppPref().isFirstTime = false;
          // Get.offAndToNamed(AppRouter.loginOption);
          break;
        case 403:
        case 404:
          break;
        case 406:
          var json = onError.response?.data;
          showErrorSheet(
              json.toString().replaceAll('[', '').replaceAll(']', ''));
          break;
        case 408:
        case 409:
        case 422:
        case 423:
        case 426:
          break;
        case 500:
          showErrorSheet('Internal Server Error');
          break;
        default:
          break;
      }
    }
  }

  /// to show error
  static void showErrorSheet(String errorText, {Function()? onTap}) {
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      builder: (context) => Container(
        padding: const EdgeInsetsDirectional.only(
            start: 24, end: 24, top: 18, bottom: 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Center(child: AppText.semiBold(S.of(context).error, color: context.textTheme.titleLarge?.color, size: 24, textAlign: TextAlign.start)),
            // const Gap(16),
            for (var data in errorText.split(',')) ...{
              Container(
                margin: const EdgeInsets.only(bottom: 4),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(top: 4),
                      child: CircleAvatar(
                          backgroundColor: context.textTheme.titleLarge?.color,
                          radius: 5),
                    ),
                    // const Gap(8),
                    // Expanded(child: AppText.medium(data.trim().capitalizeFirst, color: context.textTheme.titleLarge?.color, size: 14, textAlign: TextAlign.start)),
                  ],
                ),
              ),
            },
            // const Gap(16),
            // AppButton.fix(S.of(context).okay, onPressed: onTap ?? () => Get.back())
          ],
        ),
      ),
    );
  }

  static Future<void> refreshToken() async {
    final refreshToken = AppPref().refreshToken;

    final response = await Dio()
        .post("https://stage.srv.apicalfitness.com/api/auth/token/refresh/",
            data: {
              "refresh": refreshToken,
            },
            options: Options(
              validateStatus: (status) => true,
              contentType: "application/json",
            ));
    print(response);
    if (response.statusCode == 200) {
      AppPref().token = response.data['access'];
      AppPref().refreshToken = response.data['refresh'];
      return response.data;
    } else {
      return Future.error(
          "This is the error", StackTrace.fromString("This is its trace"));
    }
    // final response = await ApiService.makeApiCall(
    //     "https://srv.apicalfitness.com/api/auth/token/refresh/",
    //     ApiMethodType.post,
    //     doShowLoader: false,
    //     params: {'refresh': refreshToken});

    // if (response.statusCode == 200) {
    // AppPref().token = response['access'];
    // AppPref().refreshToken = response['refresh'];
    // }
    // return response;
  }
}
