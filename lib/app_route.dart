import 'package:get/get.dart';
import 'package:gymui/auth_screens/forgotpassword/check_mail.dart';
import 'package:gymui/auth_screens/forgotpassword/forgotpasswprd_screen.dart';
import 'package:gymui/auth_screens/forgotpassword/newpassword_screen.dart';
import 'package:gymui/auth_screens/forgotpassword/successfullychangepassword_screen.dart';
import 'package:gymui/auth_screens/login_screen.dart';
import 'package:gymui/screens/contact_us.dart';
import 'package:gymui/screens/gym_details.dart';
import 'package:gymui/screens/home_screen.dart';
import 'package:gymui/screens/privacy_policy.dart';
import 'package:gymui/screens/view_client.dart';
import 'package:gymui/screens/view_history.dart';
import 'package:gymui/splashscreen.dart';

import 'screens/gym_photos.dart';
import 'screens/notification_screen.dart';
import 'screens/profile_settings/change_gym_data.dart';
import 'screens/profile_settings/changeemail/changeemail_screen.dart';
import 'screens/profile_settings/changeemail/checkmailforgotmail_Screen.dart';
import 'screens/profile_settings/changeemail/successfullychangeemail_screen.dart';
import 'screens/profile_settings/changepassword/changepassword_Screen.dart';
import 'screens/profile_settings/contactus_mail_screen.dart';
import 'screens/profile_settings/profile_change_screen.dart';
import 'screens/qr_client_history_screen.dart';
import 'screens/qr_scanner_page.dart';
import 'screens/terms_of_use.dart';

class AppRouter {
  static const loginScreen = '/loginScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const checkMailAddress = '/checkMailAddress';
  static const checkMailForgotScreen = '/checkMailForgotScreen';
  static const changeEmailScreen = '/changeEmailScreen';

  static const newPasswordScreen = '/newPasswordScreen';
  static const successChangePasswordScreen = '/successChangePasswordScreen';
  static const homeScreen = '/homeScreen';
  static const changeProfileScreen = '/changeProfileScreen';
  static const contactUsScreen = '/contactUsScreen';
  static const privacyPolicyPage = '/privacyPolicyPage';
  static const termsOfUser = '/termsOfUser';
  static const changeGymData = '/changeGymData';
  static const changePasswordScreen = '/changePasswordScreen';
  static const successfullyChangeEmailScreen = '/SuccessfullyChangeEmailScreen';
  static const qrSacnnerPage = '/qrSacnnerPage';
  static const contactUsMailScreen = '/contactUsMailScreen';
  static const gymDetails = '/gymDetails';
  static const viewHistory = '/viewHistory';
  static const viewClient = '/viewClient';
  static const qrClientHistoryScreen = '/qrClientHistoryScreen';
  static const notificationScreen = '/notificationScreen';
  static const splashScreen = '/splashScreen';
  List<GetPage> getPages = [
    GetPage(
      name: loginScreen,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: forgotPasswordScreen,
      page: () => const ForgotPasswordScreen(),
    ),
    GetPage(
      name: checkMailAddress,
      page: () => const CheckMailAddress(),
    ),
    GetPage(
      name: checkMailForgotScreen,
      page: () => const CheckMailForgotScreen(),
    ),
    GetPage(
      name: changeEmailScreen,
      page: () => const ChangeEmailScreen(),
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
      name: changeProfileScreen,
      page: () => const ChangeProfileScreen(),
    ),
    GetPage(
      name: contactUsScreen,
      page: () => const ContactUs(),
    ),
    GetPage(
      name: privacyPolicyPage,
      page: () => const PrivacyPolicyPage(),
    ),
    GetPage(
      name: termsOfUser,
      page: () => const TermsOfUser(),
    ),
    GetPage(
      name: changeGymData,
      page: () => ChangeGymData(),
    ),
    GetPage(
      name: changePasswordScreen,
      page: () => const ChangePasswordScreen(),
    ),
    GetPage(
      name: successfullyChangeEmailScreen,
      page: () => const SuccessfullyChangeEmailScreen(),
    ),
    GetPage(
      name: qrSacnnerPage,
      page: () => const QrScannerPage(),
    ),
    GetPage(
      name: gymDetails,
      page: () => const GymDetails(),
    ),
    GetPage(
      name: viewHistory,
      page: () => ViewHistory(),
    ),
    GetPage(
      name: viewClient,
      page: () => ViewClient(),
    ),
    GetPage(
      name: qrClientHistoryScreen,
      page: () => QrClientHistoryScreen(),
    ),
    GetPage(
      name: notificationScreen,
      page: () => NotificationScreen(),
    ),
    GetPage(
      name: contactUsMailScreen,
      page: () => ContactUsMailScreen(),
    ),
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
    ),
  ];
}
