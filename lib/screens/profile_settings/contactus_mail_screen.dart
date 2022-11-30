import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymui/app_route.dart';
import 'package:gymui/components/commonappbutton.dart';
import 'package:gymui/components/input_field.dart';
import 'package:gymui/controllers/contect_us_mail_controller.dart';
import 'package:gymui/schema/appcolor.dart';
import 'package:gymui/schema/text_style.dart';

class ContactUsMailScreen extends StatefulWidget {
  const ContactUsMailScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsMailScreen> createState() => _ContactUsMailScreenState();
}

class _ContactUsMailScreenState extends State<ContactUsMailScreen> {
  final contectUsController = Get.put(ContectUsController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // FocusManager.instance.primaryFocus!.unfocus();
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name",style: TextStyle(color: Colors.black).normal16w500),
              SizedBox(height: 10,),
              InputField(
                maxLine: 1,
                controller: contectUsController.nameControler,
                focusNode: contectUsController.nameFocusNode,
                hint: "name",
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 30,),
             Text("Email",style: TextStyle(color: Colors.black).normal16w500),
              SizedBox(height: 10,),
              InputField(
                maxLine: 1,
                controller: contectUsController.emailController,
                focusNode: contectUsController.emailFocusNode,
                hint: "email",
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 30,),
              Text("Massage",style: TextStyle(color: Colors.black).normal16w500),
              SizedBox(height: 10,),
              InputField(
                maxLine: 5,

                controller: contectUsController.massageController,
                focusNode: contectUsController.massageFocusNode,
                hint: "massage",
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 30,),
           GestureDetector(
             onTap: (){
             contectUsController.apiCallForContactUs();
             },
             child: Container(
              height: 50,
              width: context.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColor.buttoncolor,
                  border: Border.all(color: Colors.green)),
              child: Center(
                  child: Text(
                    "Send",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: 'inter', color: Colors.white)
                        .normal14w500,
                  )),
          ),
           ),

            ],
          ),
        ),
      ),
    );
  }
}



