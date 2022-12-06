import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymui/app_route.dart';
import 'package:gymui/schema/appcolor.dart';
import 'package:gymui/schema/text_style.dart';
import 'package:gymui/widgets/height_spacer.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // FocusManager.instance.primaryFocus!.unfocus();
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text(
            'Contact Us',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
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
        body: Column(
          children: [
            Expanded(
                flex: 4,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Let us answer your question',
                        style: const TextStyle().normal16w500,
                      ),
                      const HeightSpacer(height: 20.0)
                    ],
                  ),
                )),
            Expanded(
                flex: 6,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(color: AppColor.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'If you have any questions or difficulties using the application, write to us on our email and we will help you.',
                        style: const TextStyle(height: 1.5).normal16w400,
                      ),
                      const HeightSpacer(height: 20.0),
                      copyEmailButton(),
                      const HeightSpacer(height: 25.0),
                      orBlock(),
                      const HeightSpacer(height: 20.0),
                      Text(
                        'We also respond and provide support on the \nfollowing social networks',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          height: 1.5,
                        ).normal16w400,
                      ),
                      const HeightSpacer(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          getIcons('assets/images/phone.png'),
                          const SizedBox(
                            width: 20.0,
                          ),
                          getIcons('assets/images/insta.png'),
                          const SizedBox(
                            width: 20.0,
                          ),
                          getIcons('assets/images/facebook.png'),
                          const SizedBox(
                            width: 20.0,
                          ),
                          getIcons('assets/images/send.png'),
                          const SizedBox(
                            width: 20.0,
                          ),
                          getIcons('assets/images/whatsapp.png')
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget getIcons(String data) {
    return ImageIcon(
      AssetImage(data),
      color: AppColor.buttoncolor,
      size: 20.0,
    );
  }

  Widget copyEmailButton() {
    return GestureDetector(
      onTap: () {
        Future<void> emailLaunchUri() async {
          final Uri launchUri = Uri(
            scheme: 'mailto',
            path: 'support@ischoolwallet.com',
          );
          await launchUrl(launchUri);
        }
        // Get.toNamed(AppRouter.contactUsMailScreen);
      },
      child: Container(
        height: 50,
        //width: context.width,
        decoration: BoxDecoration(
          color: AppColor.buttoncolor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.email,
              color: AppColor.white,
            ),
            const SizedBox(
              width: 15.0,
            ),
            Text(
              "COPY OUR EMAIL",
              textAlign: TextAlign.center,
              style: const TextStyle(fontFamily: 'inter', color: Colors.white)
                  .normal16w500,
            ),
          ],
        )),
      ),
    );
  }

  Widget orBlock() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: 1.0,
            decoration: const BoxDecoration(color: AppColor.grey),
          ),
          Text(
            "OR",
            textAlign: TextAlign.center,
            style: const TextStyle(
                    fontFamily: TxtFontFamily.oswald, color: AppColor.grey)
                .normal16w500,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: 1.0,
            decoration: const BoxDecoration(color: AppColor.grey),
          )
        ],
      ),
    );
  }
}
