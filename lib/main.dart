import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gymui/app_route.dart';
import 'package:gymui/auth_screens/login_screen.dart';
import 'package:gymui/screens/home_screen.dart';

import 'utils/app_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPref().isPreferenceReady;
  // await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // String looged = "";
  // var pref = GetStorage();
  @override
  void initState() {
    super.initState();
    print(AppPref().token);
    // looged =  AppPref().token ;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Partner App',
      debugShowCheckedModeBanner: false,
      getPages: AppRouter().getPages,

      // builder: EasyLoading.init(),
      home:
          AppPref().token.isNotEmpty ? const HomeScreen() : const LoginScreen(),
    );
  }
}
