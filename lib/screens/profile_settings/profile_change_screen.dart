import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymui/app_route.dart';
import 'package:gymui/controllers/get_gymdata_controller.dart';
import 'package:gymui/schema/appcolor.dart';
import 'package:gymui/schema/text_style.dart';
import 'package:gymui/screens/profile_settings/change_gym_data.dart';
import 'package:gymui/screens/profile_settings/changeemail/changeemail_screen.dart';
import 'package:gymui/screens/profile_settings/changepassword/changepassword_Screen.dart';

class ChangeProfileScreen extends StatefulWidget {
  const ChangeProfileScreen({Key? key}) : super(key: key);

  @override
  State<ChangeProfileScreen> createState() => _ChangeProfileScreenState();
}

class _ChangeProfileScreenState extends State<ChangeProfileScreen> {
  final GetGymDataController getGymDataController =
  Get.put<GetGymDataController>(GetGymDataController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // FocusManager.instance.primaryFocus!.unfocus();
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColor.lightgray,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20.0,
            ),
          ),
            ),
        body: Stack(
          children: [
            Container(
              height: 50,
              color: AppColor.lightgray,
            ),
            const SizedBox(
              height: 75,
            ),
            Column(
              children: [
                Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Image.asset(
                    'assets/images/appIcon.png',
                    width: 122,
                    height: 122,
                  ),
                )),
                const SizedBox(
                  height: 30,
                ),
                Text("SETTINGS",
                    style: const TextStyle(
                      fontFamily: TxtFontFamily.oswald,
                    ).normal25w600),
                const SizedBox(
                  height: 10,
                ),
                Text("Partner’s number",
                    style: const TextStyle(
                      fontFamily: TxtFontFamily.inter,
                    ).normal16w600),
                const SizedBox(
                  height: 5,
                ),
                Text("4598 5985",
                    style: const TextStyle(
                            fontFamily: TxtFontFamily.inter, color: AppColor.grey)
                        .normal14w600),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
getGymDataController. apiCallForGetGymData();
getGymDataController.apiCallForContactInformation();
getGymDataController.apiCallForGetSocialMediaData();

},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22.0, right: 22),
                    child: Container(
                      height: 50,
                      width: context.width,
                      decoration: BoxDecoration(
                        color: AppColor.lightgray,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: Row(
                          children: [
                            Text(
                              "Change data about gym ",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                      fontFamily: TxtFontFamily.roboto,
                                      color: Colors.black)
                                  .normal16w400,
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                            )
                          ],
                        ),
                      )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRouter.changeEmailScreen);

                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22.0, right: 22),
                    child: Container(
                      height: 50,
                      width: context.width,
                      decoration: BoxDecoration(
                        color: AppColor.lightgray,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: Row(
                          children: [
                            Text(
                              "Change email address",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                      fontFamily: TxtFontFamily.roboto,
                                      color: Colors.black)
                                  .normal16w400,
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                            )
                          ],
                        ),
                      )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {

                    Get.toNamed(AppRouter.changePasswordScreen);

                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22.0, right: 22),
                    child: Container(
                      height: 50,
                      width: context.width,
                      decoration: BoxDecoration(
                        color: AppColor.lightgray,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: Row(
                          children: [
                            Text(
                              "Change password ",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                      fontFamily: TxtFontFamily.roboto,
                                      color: Colors.black)
                                  .normal16w400,
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 18,
                            )
                          ],
                        ),
                      )),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
