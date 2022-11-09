import 'package:get/get.dart';
import 'package:partner_app/modules/forgotpassword/forgotmail_screen.dart';
import 'package:partner_app/modules/forgotpassword/forgotpasswprd_screen.dart';
import 'package:partner_app/modules/forgotpassword/newpassword_screen.dart';
import 'package:partner_app/modules/forgotpassword/successfullychangepassword_screen.dart';
import 'package:partner_app/modules/hamburger/hamburger_screen.dart';
import 'package:partner_app/modules/homescreen/home_screen.dart';
import 'package:partner_app/modules/login/login_screen.dart';

class AppRouter {
  static const loginscreen = '/loginscreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const forgotMailScreen = '/forgotMailScreen';
  static const newPasswordScreen = '/newPasswordScreen';
  static const successChangePasswordScreen = '/successChangePasswordScreen';
  static const homeScreen = '/homeScreen';
  static const hamburgerScreen = '/hamburgerScreen';


  static List<GetPage> getPages = [
    GetPage(
      name: loginscreen,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: forgotPasswordScreen,
      page: () => const ForgotPasswordScreen(),
    ),
    GetPage(
      name: forgotMailScreen,
      page: () => const ForgotMailScreen(),
    ),
    GetPage(
      name: newPasswordScreen,
      page: () => const NewPasswordScreen(),
    ),
    GetPage(
      name: successChangePasswordScreen,
      page: () => const SuccessChangePasswordScreen(),
    ),
    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: hamburgerScreen,
      page: () => const HamburgerScreen(),
    ),
  ];
}