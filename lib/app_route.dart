import 'package:get/get.dart';
import 'package:partner_app/modules/forgotpassword/forgotmail_screen.dart';
import 'package:partner_app/modules/forgotpassword/forgotpasswprd_screen.dart';
import 'package:partner_app/modules/forgotpassword/newpassword_screen.dart';
import 'package:partner_app/modules/forgotpassword/successfullychangepassword_screen.dart';
import 'package:partner_app/modules/hamburger/hamburger_screen.dart';
import 'package:partner_app/modules/homescreen/bottomtabbar/bottomtabbar_screen.dart';
import 'package:partner_app/modules/homescreen/home_screen.dart';
import 'package:partner_app/modules/login/login_screen.dart';

import 'modules/homescreen/bottomtabbar/tabs/qr_code_tab.dart';

class AppRouter {
  static const loginscreen = '/loginscreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const checkmailpassword_screen = '/checkmailpassword_screen';
  static const newPasswordScreen = '/newPasswordScreen';
  static const successChangePasswordScreen = '/successChangePasswordScreen';
  static const homeScreen = '/homeScreen';
  static const hamburgerScreen = '/hamburgerScreen';
  static const bottomTabBar = '/bottomTabBar';
  static const qrCodeTab = '/qrCodeTab';

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
      name: checkmailpassword_screen,
      page: () => const Checkmailpassword_screen(),
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
    GetPage(
      name: bottomTabBar,
      page: () => const   BottomTabBar(),
    ),
    GetPage(
      name: qrCodeTab,
      page: () => const   QrCodeTab(),
    ),
  ];

}