
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  TextEditingController userEmailController = TextEditingController();
  FocusNode userEmailFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  RxString userEmailString = "".obs;
  RxString userPasswordString = "".obs;
  RxBool showPass = false.obs;


}


