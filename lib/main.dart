import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_app/app_route.dart';
//keval kevadiya file
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRouter.loginscreen,
      getPages: AppRouter.getPages,
      debugShowCheckedModeBanner: false,


    );
  }
}





