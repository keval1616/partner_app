import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPasswordController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode confirmPasswordFocusNode = FocusNode();
  RxBool showPass = false.obs;
  RxBool showConfirmPass = false.obs;
  RxString passwordString = "".obs;
  RxString confirmPasswordString = "".obs;
}