// ignore_for_file: unnecessary_nullable_for_final_variable_declarations

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gymui/components/commonappbutton.dart';
import 'package:gymui/components/input_field.dart';
import 'package:gymui/controllers/get_gymdata_controller.dart';
import 'package:gymui/model/get_gymdata_model.dart';
import 'package:gymui/schema/appcolor.dart';
import 'package:gymui/schema/text_style.dart';
import 'package:gymui/utils/dates.dart';
import 'package:gymui/widgets/common_function.dart';
import 'package:gymui/widgets/height_spacer.dart';
import 'package:gymui/widgets/sub_titles.dart';
import 'package:gymui/widgets/titles.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ChangeGymData extends StatefulWidget {
  const ChangeGymData({super.key});

  @override
  State<ChangeGymData> createState() => _ChangeGymDataState();
}

class _ChangeGymDataState extends State<ChangeGymData> {
  late GoogleMapController mapController;
  final GetGymDataController getGymDataController =
      Get.put<GetGymDataController>(GetGymDataController());
  List<Widget> imageList = [];
  @override
  void initState() {
    super.initState();
    loadData();
  }

  File? _image;
  final picker = ImagePicker();
//this is method made for getgallery image from gallery...
  Future getGalleryImage() async {
    final pickedFile = await picker
        .pickImage(source: ImageSource.gallery)
        .then((value1) async {
      // print(pickedFile);
      Uint8List imagebytes = await value1!.readAsBytes(); //convert to bytes
      String base64string = base64.encode(imagebytes);
      log(base64string);
      getGymDataController
          .apiCallForUploadLogo(
        base64string,
      )
          .then((value) {
        setState(() {
          _image = File(value1.path);
        });
      });
      // setState(() {
      //   if (value.path.isNotEmpty) {
      //     print("image selected");
      //     _image = File(value.path);
      //   } else {
      //     print('No Image Selected');
      //   }
      // });
    });
    // if (_image != null) {
    //   for (var element in pickedFile) {
    // Uint8List imagebytes = await element.readAsBytes(); //convert to bytes
    // String base64string = base64.encode(imagebytes);
    //     log("_+_+_+__+_+___+${base64string}");
    //     // element.readAsBytes().then((value) {
    //     //   print(value);
    //     // });
    //     // print(element.readAsBytes());
    //     getGymDataController.apiCallForUploadLogo(base64string, element);
    //     // setState(() {
    //     // getGymDataController.getGymDataModel.images!
    //     //     .add(Images(image: element.path));
    //     // });
    //   }
    // }
  }

  loadData() {
    getGymDataController.instaController.text =
        getGymDataController.socialMediaDataModel.value.instagram??"";
    getGymDataController.fbController.text =
        getGymDataController.socialMediaDataModel.value.facebook ?? "";
    getGymDataController.twitterController.text =
        getGymDataController.socialMediaDataModel.value.twitter??"";
    getGymDataController.wappController.text =
        getGymDataController.socialMediaDataModel.value.whatsapp??"";
    getGymDataController.descController.text =
        getGymDataController.getGymDataModel.value.description??"";
    getGymDataController.nameController.text =
        getGymDataController.getGymDataModel.value.name??"";
    getGymDataController.addressController.text =
        getGymDataController.getGymDataModel.value.addressLine1??"";
    getGymDataController.emailController.text =
        getGymDataController.getContectModel.value.email??"";
    getGymDataController.phoneController.text =
        getGymDataController.getContectModel.value.phoneNumbers?.length == 1
            ? getGymDataController.getContectModel.value.phoneNumbers![0]
            : "";
    getGymDataController.secondPhoneController.text =
        getGymDataController.getContectModel.value.phoneNumbers?.length == 2
            ? getGymDataController.getContectModel.value.phoneNumbers![1]
            : "";
    // Future.delayed(const Duration(seconds: 1), () {
    //   _getImages();
    // });

    // Dates sa = const Dates(1, 'SA', '12:00 AM', '09:00 PM', 1);
    // Dates su = const Dates(2, 'SU', '', '', 0);
    // Dates mo = const Dates(3, 'MO', '06:00 AM', '11:00 PM', 1);
    // Dates tu = const Dates(4, 'TU', '06:00 AM', '11:00 PM', 1);
    // Dates we = const Dates(5, 'WE', '06:00 AM', '11:00 PM', 1);
    // Dates th = const Dates(6, 'TH', '06:00 AM', '11:00 PM', 1);
    // Dates fr = const Dates(7, 'FR', '06:00 AM', '11:00 PM', 1);

    //List<Dates> temp = [sa, su, mo, tu, we, th, fr];
    //generateList(temp);
  }

  generateList(List temp) {
    List<int> ids = [];

    for (var element in temp) {
      List<Dates> selected = [];
      if (!ids.contains(element.id)) {
        selected.add(element);
        ids.add(element.id);
        for (var e in temp) {
          if (element.start == e.start &&
              element.end == e.end &&
              e.status == element.status &&
              !ids.contains(e.id)) {
            selected.add(e);
            ids.add(e.id);
          }
        }
        if (selected.isNotEmpty) {
          getGymDataController.dates.add(selected);
          selected.clear();
        }
      }
    }
    setState(() {});
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  _buildTypeList() {
    List<Widget> choices = [];
    List types = ['Judo', 'Body Building'];
    for (var item in types) {
      choices.add(Container(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        margin: const EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: AppColor.grey),
            borderRadius: const BorderRadius.all(Radius.circular(30.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              item,
              style: const TextStyle().normal14w400,
            ),
            const SizedBox(
              width: 10.0,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(3.0),
                decoration: const BoxDecoration(
                    color: AppColor.grey,
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                child: const Icon(
                  Icons.close_rounded,
                  size: 12.0,
                  color: AppColor.white,
                ),
              ),
            )
          ],
        ),
      ));
    }
    return choices;
  }

  _getImages() {
    for (var element in getGymDataController.banners) {
      setState(() {
        imageList.add(SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 200.0,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 200.0,
            margin: const EdgeInsets.only(right: 10.0),
            child: Image.network(
              element,
              fit: BoxFit.cover,
            ),
          ),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text(
            'Chnage Data',
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
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                const HeightSpacer(height: 25.0),
                const MyTitle(title: 'General information'),
                const HeightSpacer(height: 20.0),
                const MySubTitle(title: 'Gym Name'),
                const HeightSpacer(height: 10.0),
                commonTextField(getGymDataController.nameController,
                    getGymDataController.nameFocusNode, 'Gym Name'),
                const HeightSpacer(height: 20.0),
                descTextField(),
                const HeightSpacer(height: 20.0),
                const MySubTitle(title: 'Type of activities'),
                const HeightSpacer(height: 20.0),
                activityTypeBlock(),
                const HeightSpacer(height: 20.0),
                saveChnageButton(),
                const HeightSpacer(height: 20.0),
                const MyTitle(title: 'Pictures of facility'),
                const HeightSpacer(height: 20.0),
                GetBuilder<GetGymDataController>(
                  init: getGymDataController,
                  builder: (controller) => picturesBlock(),
                ),
                const HeightSpacer(height: 20.0),
                GestureDetector(
                    onTap: () async {
                      await pickImage();
                    },
                    child: commonButton('UPLOAD NEW PHOTOS')),
                const HeightSpacer(height: 20.0),

                uploadImageButton(),
                const HeightSpacer(height: 20.0),
                const MyTitle(title: 'Location'),
                const HeightSpacer(height: 20.0),
                commonTextField(getGymDataController.addressController,
                    getGymDataController.addressFocusNode, 'Gym Location'),
                const HeightSpacer(height: 20.0),
                commonButton('+ ADD GYM ADDRESS'),
                const HeightSpacer(height: 20.0),
                mapView(),
                const HeightSpacer(height: 40.0),
                const MyTitle(title: 'Working Schedule'),
                const HeightSpacer(height: 40.0),
                scheduleBlock(),
                const HeightSpacer(height: 20.0),
                commonButton('+ ADD WORK SCHEDULE'),
                const HeightSpacer(height: 20.0),
                const MyTitle(title: 'Contact information'),
                const HeightSpacer(height: 20.0),
                const MySubTitle(title: 'Email Address'),
                const HeightSpacer(height: 15.0),
                commonTextField(getGymDataController.emailController,
                    getGymDataController.emailFocusNode, 'Email Address'),
                const HeightSpacer(height: 20.0),
                const MySubTitle(title: 'Phone Number'),
                const HeightSpacer(height: 15.0),
                commonTextField(getGymDataController.phoneController,
                    getGymDataController.phoneFocusNode, 'Phone Number'),
                const HeightSpacer(height: 20.0),
                const MySubTitle(title: 'Second Phone Number'),
                const HeightSpacer(height: 15.0),
                commonTextField(
                    getGymDataController.secondPhoneController,
                    getGymDataController.secondPhoneFocusNode,
                    'Second Phone Number'),
                const HeightSpacer(height: 20.0),
                addContactbutton(),
                // addPhoneNumber(),
                const HeightSpacer(height: 20.0),
                const MyTitle(title: 'Logo'),
                Center(child: logoBlock()),
                const HeightSpacer(height: 20.0),
                uploadLogoButton(),
                const HeightSpacer(height: 30.0),
                const MyTitle(title: 'Social media accounts'),
                const HeightSpacer(height: 20.0),
                mediaAccounts(),
                SocialMediaButton(),
                const HeightSpacer(height: 30.0),
                // CommonAppButton(
                //   onTap: (){
                //     getGymDataController.apiCallForSocialMediaData();
                //   },
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'This data is displayed in the\napplication for LIfetime users',
            textAlign: TextAlign.center,
            style: const TextStyle().normal17w500,
          ),
          const HeightSpacer(height: 15.0),
          Text(
            'SEE PUBLIC VIEW',
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppColor.buttoncolor).normal17w500,
          ),
        ],
      ),
    );
  }

  Widget commonTextField(TextEditingController c, FocusNode f, String hint) {
    return InputField(
      maxLine: 1,
      controller: c,
      focusNode: f,
      hint: hint,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget descTextField() {
    return TextFormField(
      controller: getGymDataController.descController,
      focusNode: getGymDataController.descFocusNode,
      maxLines: 15,
      decoration: InputDecoration(
        hintText: 'Write something about gym',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: AppColor.grey.withOpacity(0.2),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: AppColor.grey.withOpacity(0.2),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            color: AppColor.black,
          ),
        ),
      ),
    );
  }

  Widget activityTypeBlock() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: AppColor.black),
          borderRadius: const BorderRadius.all(Radius.circular(30.0))),
      child: Wrap(
        children: _buildTypeList(),
      ),
    );
  }

  Widget saveChnageButton() {
    return GestureDetector(
      onTap: () {
        getGymDataController.apiCallForUpdateGymData();
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColor.buttoncolor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
            child: Text(
          "SAVE CHANGES",
          textAlign: TextAlign.center,
          style: const TextStyle(fontFamily: 'inter', color: Colors.white)
              .normal16w500,
        )),
      ),
    );
  }

  Widget uploadImageButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColor.buttoncolor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
            child: Text(
          "Upload Image",
          textAlign: TextAlign.center,
          style: const TextStyle(fontFamily: 'inter', color: Colors.white)
              .normal16w500,
        )),
      ),
    );
  }

  Widget uploadLogoButton() {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return SafeArea(
                child: Container(
                  child: Wrap(
                    children: <Widget>[
                      ListTile(
                          leading: Icon(Icons.photo_library),
                          title: Text('Gallery'),
                          onTap: () async {
                            Get.back();
                            await getGalleryImage();
                          }),
                      // ListTile(
                      //   leading: Icon(Icons.photo_camera),
                      //   title: Text('Camera'),
                      //   onTap: () async {
                      //     Get.back();
                      //   },
                      // ),
                    ],
                  ),
                ),
              );
            });
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColor.buttoncolor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
            child: Text(
          "Upload Logo",
          textAlign: TextAlign.center,
          style: const TextStyle(fontFamily: 'inter', color: Colors.white)
              .normal16w500,
        )),
      ),
    );
  }

  Widget addContactbutton() {
    return GestureDetector(
      onTap: () {
        getGymDataController.apiCallForPostContactInformation();
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColor.buttoncolor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
            child: Text(
          "Update Contacts ",
          textAlign: TextAlign.center,
          style: const TextStyle(fontFamily: 'inter', color: Colors.white)
              .normal16w500,
        )),
      ),
    );
  }

  Widget SocialMediaButton() {
    return GestureDetector(
      onTap: () {
        getGymDataController.apiCallForPutSocialMediaData();
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColor.buttoncolor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
            child: Text(
          "Upload SocialMedia Details ",
          textAlign: TextAlign.center,
          style: const TextStyle(fontFamily: 'inter', color: Colors.white)
              .normal16w500,
        )),
      ),
    );
  }

  Future pickImage() async {
    if (await Permission.storage.request().isGranted) {
      final List<XFile>? images =
          await getGymDataController.picker.pickMultiImage(
        imageQuality: 60,
      );
      if (images != null) {
        for (var element in images) {
          Uint8List imagebytes = await element.readAsBytes(); //convert to bytes
          String base64string = base64.encode(imagebytes);
          log("_+_+_+__+_+___+${base64string}");
          // element.readAsBytes().then((value) {
          //   print(value);
          // });
          // print(element.readAsBytes());
          getGymDataController.apiCallForUploadImage(base64string, element);
          // setState(() {
          // getGymDataController.getGymDataModel.images!
          //     .add(Images(image: element.path));
          // });
        }
      }
    } else {
      await Permission.storage.request();
    }
  }

  Widget picturesBlock() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 40.0,
      height: 200.0,
      child: !isNullEmptyOrFalse(
              getGymDataController.getGymDataModel.value.images)
          ? ListView.builder(
              itemCount:
                  getGymDataController.getGymDataModel.value.images?.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                print(getGymDataController
                    .getGymDataModel.value.images![index].image!
                    .contains("https"));
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 200.0,
                  child: Stack(
                    children: [
                      getGymDataController
                              .getGymDataModel.value.images![index].image!
                              .contains("https")
                          ? getImageView(
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 200.0,
                              finalUrl: getGymDataController.getGymDataModel
                                      .value.images?[index].image ??
                                  '',
                            )
                          : Image.file(
                              File(getGymDataController.getGymDataModel.value
                                      .images?[index].image! ??
                                  ""),
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                      Positioned(
                          right: 20.0,
                          top: 10.0,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                getGymDataController
                                    .getGymDataModel.value.images
                                    ?.removeAt(index);
                                // imageList.remove(imageList[index]);
                              });
                            },
                            child: Container(
                              width: 30.0,
                              height: 30.0,
                              decoration: const BoxDecoration(
                                  color: AppColor.buttoncolor,
                                  shape: BoxShape.circle),
                              child: const Center(
                                child: Icon(
                                  Icons.close_rounded,
                                  color: AppColor.white,
                                  size: 18.0,
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                );
              })
          : Center(
              child: Text(
                'No Picture Found!',
                style: const TextStyle(color: AppColor.grey).normal14w400,
              ),
            ),
    );
  }

  Widget commonButton(String title) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: AppColor.buttoncolor),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
          child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(color: AppColor.buttoncolor).normal16w500,
      )),
    );
  }

  Widget commonButtonimage(String title) {
    return GestureDetector(
      onTap: () {
        // getGymDataController.apiCallForUploadImage();
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: AppColor.buttoncolor),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
            child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(color: AppColor.buttoncolor).normal16w500,
        )),
      ),
    );
  }

  Widget mapView() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 20,
      height: 180.0,
      child: GoogleMap(
        initialCameraPosition: const CameraPosition(
            target: LatLng(38.35822, -106.1275), zoom: 11.5),
        zoomControlsEnabled: false,
        myLocationEnabled: false,
        markers: {
          Marker(
            markerId: const MarkerId('marker'),
            infoWindow: const InfoWindow(title: 'Location'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            position: const LatLng(38.35822, -106.1275),
          )
        },
        onMapCreated: (controller) => mapController = controller,
      ),
    );
  }

  Widget scheduleBlock() {
    // return ListView.builder(
    //     shrinkWrap: true,
    //     itemCount: dates.length,
    //     physics: const NeverScrollableScrollPhysics(),
    //     itemBuilder: (context, index) {
    //       String dayName = '';
    //       String time = '';
    //       List<Dates> temp = dates[index];
    //       if (temp.length > 1) {
    //         dayName = temp[0].name + temp[temp.length - 1].name;
    //         time = temp[0].status == 0
    //             ? 'Close'
    //             : '${temp[0].start} - ${temp[0].end}';
    //       } else {
    //         dayName = temp[0].name;
    //         time = temp[0].status == 0
    //             ? 'Close'
    //             : '${temp[0].start} - ${temp[0].end}';
    //       }

    //       return Container(
    //         margin: const EdgeInsets.only(bottom: 20.0),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             RichText(
    //               textAlign: TextAlign.center,
    //               text: TextSpan(children: <TextSpan>[
    //                 TextSpan(
    //                     text: dayName,
    //                     style: const TextStyle(color: AppColor.black)
    //                         .normal16w500),
    //                 TextSpan(
    //                   text: time,
    //                   style:
    //                       const TextStyle(color: AppColor.black).normal16w400,
    //                 ),
    //               ]),
    //             ),
    //             Container(
    //               width: 25.0,
    //               height: 25.0,
    //               decoration: const BoxDecoration(
    //                   color: AppColor.buttoncolor, shape: BoxShape.circle),
    //               child: const Center(
    //                 child: Icon(
    //                   Icons.close_rounded,
    //                   color: AppColor.white,
    //                   size: 18.0,
    //                 ),
    //               ),
    //             )
    //           ],
    //         ),
    //       );
    //     });
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: "Mon - Fr:",
                    style: const TextStyle(color: AppColor.black).normal16w500),
                TextSpan(
                  text: ' 06:00 AM - 11:00 PM',
                  style: const TextStyle(color: AppColor.black).normal16w400,
                ),
              ]),
            ),
            Container(
              width: 25.0,
              height: 25.0,
              decoration: const BoxDecoration(
                  color: AppColor.buttoncolor, shape: BoxShape.circle),
              child: const Center(
                child: Icon(
                  Icons.close_rounded,
                  color: AppColor.white,
                  size: 18.0,
                ),
              ),
            )
          ],
        ),
        const HeightSpacer(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: "Sa:",
                    style: const TextStyle(color: AppColor.black).normal16w500),
                TextSpan(
                  text: ' 12:00 AM - 09:00 PM',
                  style: const TextStyle(color: AppColor.black).normal16w400,
                ),
              ]),
            ),
            Container(
              width: 25.0,
              height: 25.0,
              decoration: const BoxDecoration(
                  color: AppColor.buttoncolor, shape: BoxShape.circle),
              child: const Center(
                child: Icon(
                  Icons.close_rounded,
                  color: AppColor.white,
                  size: 18.0,
                ),
              ),
            )
          ],
        ),
        const HeightSpacer(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: "Su:",
                    style: const TextStyle(color: AppColor.black).normal16w500),
                TextSpan(
                  text: ' Closed',
                  style: const TextStyle(color: AppColor.black).normal16w400,
                ),
              ]),
            ),
            Container(
              width: 25.0,
              height: 25.0,
              decoration: const BoxDecoration(
                  color: AppColor.buttoncolor, shape: BoxShape.circle),
              child: const Center(
                child: Icon(
                  Icons.close_rounded,
                  color: AppColor.white,
                  size: 18.0,
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget addPhoneNumber() {
    return DottedBorder(
        borderType: BorderType.RRect,
        color: Colors.purple,
        strokeWidth: 1,
        dashPattern: const [8],
        radius: const Radius.circular(12),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeightSpacer(height: 20.0),
            commonButton('+ ADD PHONE NUMBER'),
            const HeightSpacer(height: 20.0),
            const MySubTitle(title: 'Add New Number'),
            const HeightSpacer(height: 20.0),
            commonTextField(getGymDataController.newPhoneController,
                getGymDataController.newPhoneFocusNode, 'Add new number')
          ],
        ));
  }

  Widget logoBlock() {
    return Container(
      width: 200.0,
      height: 140.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      // decoration: BoxDecoration(
      //     color: Colors.green,
      //     // shape: BoxShape.circle,
      //     borderRadius: BorderRadius.circular(150)
      //     // image: DecorationImage(
      //     //   image:,
      //     //   // :const AssetImage("assets/profile.jpg"),
      //     //   fit: BoxFit.cover,
      //     // ),
      //     ),
      child: (!isNullEmptyOrFalse(imageFromBase64String(
                  getGymDataController.getGymDataModel.value.logo ?? ""))
              ? (_image != null)
                  ? Image.file(_image!,
                      height: 140, width: 200, fit: BoxFit.fill)
                  : (imageFromBase64String(
                      getGymDataController.getGymDataModel.value.logo ?? ""))
              // : getImageView(
              //     //this function call for network image with loader...
              //     finalUrl: (_image != null)
              //         ? Image.file(_image!).toString()
              //         : imageFromBase64String(
              //         getGymDataController.getGymDataModel.value.logo ?? ""),
              //     width: 140.0,
              //     height: 140.0,
              //     fit: BoxFit.fill)
              : (_image != null)
                  ? Image.file(
                      _image!,
                      height: 140,
                      width: 200,
                      fit: BoxFit.fill,
                    )
                  : Image.asset(
                      "assets/gallery.jpg",
                      width: 140.0,
                      height: 200.0,
                    )

          // Container(
          // width: 122,
          // height: 122,
          // child: Center(
          //   child: imageFromBase64String(getGymDataController.getGymDataModel.logo??" ",

          // Image.network(
          //   getGymDataController.getGymDataModel.logo??" ",
          //   width: 122,
          //   height: 122,
          ),
    );
  }

  Widget mediaAccounts() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Facebook Link',
          style: const TextStyle().normal16w500,
        ),
        const HeightSpacer(height: 20.0),
        commonTextField(getGymDataController.fbController,
            getGymDataController.fbFocusNode, 'Facebook link'),
        const HeightSpacer(height: 20.0),
        Text(
          'Instagram Link',
          style: const TextStyle().normal16w500,
        ),
        const HeightSpacer(height: 20.0),
        commonTextField(getGymDataController.instaController,
            getGymDataController.instaFocusNode, 'Instagram link'),
        const HeightSpacer(height: 20.0),
        Text(
          'Twitter Link',
          style: const TextStyle().normal16w500,
        ),
        const HeightSpacer(height: 20.0),
        commonTextField(getGymDataController.twitterController,
            getGymDataController.twitterFocusNode, 'Twitter link'),
        const HeightSpacer(height: 20.0),
        Text(
          'WhatsApp Link',
          style: const TextStyle().normal16w500,
        ),
        const HeightSpacer(height: 20.0),
        commonTextField(getGymDataController.wappController,
            getGymDataController.wappFocusNode, 'WhatsApp link'),
        const HeightSpacer(height: 20.0),
      ],
    );
  }

  showScheduleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
          content: StatefulBuilder(builder: ((context, setState) {
            return SizedBox(
              width: 300,
              height: 200,
              //padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              ),
            );
          })),
        );
      },
    );
  }
}
