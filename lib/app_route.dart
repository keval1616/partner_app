import 'package:get/get.dart';
import 'package:partner_app/modules/login/login_screen.dart';

class AppRouter {
  static const loginscreen = '/loginscreen';


  static List<GetPage> getPages = [
    GetPage(
      name: loginscreen,
      page: () => const LoginScreen(),
    ),

  ];
}