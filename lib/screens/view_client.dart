import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymui/controllers/historytab_controller.dart';
import 'package:gymui/controllers/view_history_controller.dart';
import 'package:gymui/controllers/viewclientcontroller.dart';
import 'package:gymui/screens/view_history.dart';
import 'package:gymui/utils/date_utils.dart';
import 'package:gymui/utils/users.dart';
import 'package:gymui/utils.dart';
import 'package:gymui/widgets/common_function.dart';
import 'package:gymui/widgets/height_spacer.dart';
import 'package:marquee/marquee.dart';

class ViewClient extends StatefulWidget {
  final int? id;
  const ViewClient({super.key, this.id});

  @override
  State<ViewClient> createState() => _ViewClientState();
}

class _ViewClientState extends State<ViewClient> {
  String lastVisite = '';



  Widget textScroll() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      decoration: const BoxDecoration(color: Colors.amberAccent),
      child: Center(
        child: Marquee(
          text: '    Access is allowed    ',
          style: const TextStyle(
              color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget visiteBlock() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: const BorderRadius.all(Radius.circular(10.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Times visited',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
                ),
                const HeightSpacer(height: 10.0),
                Text(
                  viewClientController.viewClientModel.value.visitedCount
                      .toString(),
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: const BorderRadius.all(Radius.circular(10.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Last visit',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
                ),
                HeightSpacer(height: 10.0),
                Text(
                  DateUtilities.convertServerDateToFormatterString(
                          viewClientController
                              .viewClientModel.value.last_visit_date!,
                          formatter: DateUtilities.file_name_date) +
                      " " +
                      DateUtilities.convertServerDateToFormatterString(
                          viewClientController
                              .viewClientModel.value.last_visit_date!,
                          formatter: DateUtilities.hh_mm_a),
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  final ViewClientController viewClientController =
      Get.put(ViewClientController());
  final viewHistoryController = Get.put(ViewHistoryController());
  final HistoryTabController historyTabController =
  Get.put<HistoryTabController>(HistoryTabController());
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewClientController.apiCallFoHistoryData(widget.id);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          'Client History',
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
      body: Center(
        child: Obx(() => isNullEmptyOrFalse(
                viewClientController.viewClientModel.value.user)
            ? Container(
                child: Text("No Data Found"),
              )
            : Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    top: 130,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 220,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const HeightSpacer(height: 130.0),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              viewClientController
                                      .viewClientModel.value.user?.firstName ??
                                  "",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.getFont(Utlis.fontName,
                                  textStyle: const TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                          ),
                          const HeightSpacer(height: 5.0),
                          Text(
                            viewClientController
                                    .viewClientModel.value.user?.email ??
                                "",
                            style: const TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                          const HeightSpacer(height: 30.0),
                          textScroll(),
                          const HeightSpacer(height: 10.0),
                          visiteBlock(),
                          const HeightSpacer(height: 50.0),
                          GestureDetector(
                            onTap: () {
                              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                                viewHistoryController.apiCallForviewClientHistory();
                              });

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ViewHistory()));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width - 20.0,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              decoration: BoxDecoration(
                                  color: Utlis.green,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30.0))),
                              child: const Center(
                                child: Text(
                                  'VIEW CUSTOMER HISTORY',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(228.0)),
                      child: SizedBox(
                        width: 228.0,
                        height: 228.0,
                        child: imageFromBase64String(viewClientController
                                .viewClientModel.value.user?.image ??
                            ""),
                      ),
                    ),
                  ),
                ],
              )),
      ),
    );
  }
}
