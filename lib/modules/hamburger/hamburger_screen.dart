import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_app/schema/test_style.dart';

class HamburgerScreen extends StatefulWidget {
  const HamburgerScreen({Key? key}) : super(key: key);
  @override
  State<HamburgerScreen> createState() => _HamburgerScreenState();
}

class _HamburgerScreenState extends State<HamburgerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Menu",
                    style: TextStyle(fontFamily: 'Oswald').normal30w600,
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: const Icon(Icons.close,size: 30,),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: (){

              },
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Settings",style: TextStyle().normal60w400,),
                    SizedBox(height: 10,),
                    Text("Edit data about your gym and account ",style: TextStyle(color: Colors.grey).normal14w400,),
                    SizedBox(height: 10,),

                  ],
                ),
              ),
            ),
            Divider(
                thickness: 0.5,
                color: Colors.black
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){

              },
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Contact Us",style: TextStyle().normal60w400,),
                    SizedBox(height: 10,),
                    Text("Have a questions? Feel free asking us",style: TextStyle(color: Colors.grey).normal14w400,),
                    SizedBox(height: 10,),

                  ],
                ),
              ),
            ),
            Divider(
                thickness: 0.5,
                color: Colors.black
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){

              },
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Privacy policy",style: TextStyle().normal60w400,),
                    SizedBox(height: 10,),


                  ],
                ),
              ),
            ),
            Divider(
                thickness: 0.5,
                color: Colors.black
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){

              },
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Terms of Use",style: TextStyle().normal60w400,),
                    SizedBox(height: 10,),

                  ],
                ),
              ),
            ),
            Divider(
                thickness: 0.5,
                color: Colors.black
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){

              },
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Log out",style: TextStyle().normal60w400,),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
            Divider(
                thickness: 0.5,
                color: Colors.black
            ),
          ],
        ),
      ),
    );
  }
}
