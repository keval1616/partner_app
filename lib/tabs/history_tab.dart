// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gymui/controllers/historytab_controller.dart';
import 'package:gymui/screens/view_client.dart';
import 'package:gymui/schema/text_style.dart';
import 'package:gymui/utils.dart';
import 'package:gymui/utils/date_utils.dart';
import 'package:gymui/widgets/common_function.dart';
import 'package:gymui/widgets/height_spacer.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog_2/month_picker_dialog_2.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class HistoryTab extends StatefulWidget {
  const HistoryTab({super.key});

  @override
  State<HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  String startDate = '12 SEPTEMBER';
  String endDate = '18 SEPTEMBER 2022';
  int selected = 0;

  var weekFormat = DateFormat('dd MMMM');
  var yearFormat = DateFormat('yyyy');
  var monthFormat = DateFormat('MMMM yyyy');
  //var outputFormat = DateFormat('dd/MM/yyyy hh:mm a');
  String dateTitle = '';
  final GlobalKey _key = GlobalKey();
  DateTime selectedDate = DateTime.now();
  final DateRangePickerController _controller = DateRangePickerController();

  @override
  void initState() {
    super.initState();
    loadWeekDate(DateTime.now());
  }

  loadWeekDate(DateTime now) {
    String today = weekFormat.format(now).toString();
    DateTime lastDay = DateTime(now.year, now.month, now.day - 6);

    String weeksLastDate = weekFormat.format(lastDay).toString();
    String year = yearFormat.format(now).toString();
    setState(() {
      dateTitle = '$weeksLastDate - $today  $year';
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      historyTabController.apiCallFoHistoryData(
          DateUtilities.getFormattedDateString(lastDay,
              formatter: DateUtilities.yyyy_mm_dd),
          DateUtilities.getFormattedDateString(now,
              formatter: DateUtilities.yyyy_mm_dd));
    });
  }

  loadMonthDate(DateTime now) {
    String recentMonth = monthFormat.format(now).toString();
    //start date
    print(DateUtilities.getFormattedDateString(now,
        formatter: DateUtilities.yyyy_mm_dd));

// Find the last day of the month.
    var lastDayDateTime = (now.month < 12)
        ? DateTime(now.year, now.month + 1, 0)
        : DateTime(now.year + 1, 1, 0);

    //end date
    print(DateUtilities.getFormattedDateString(lastDayDateTime,
        formatter: DateUtilities.yyyy_mm_dd));
    setState(() {
      dateTitle = recentMonth;
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      historyTabController.apiCallFoHistoryData(
          DateUtilities.getFormattedDateString(now,
              formatter: DateUtilities.yyyy_mm_dd),
          DateUtilities.getFormattedDateString(lastDayDateTime,
              formatter: DateUtilities.yyyy_mm_dd));
    });
  }

  loadYearDate(DateTime now) {
    String recentYear = yearFormat.format(now).toString();
    String year = DateUtilities.getFormattedDateString(now,
        formatter: DateUtilities.yyyy);
    setState(() {
      dateTitle = 'YEAR $recentYear';
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      historyTabController.apiCallFoHistoryData("01/01/$year", "31/12/$year");
    });
  }

  Widget dateRanges() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dateTitle.toUpperCase(),
          style: const TextStyle(fontFamily: 'Oswald').normal25w600,
        ),
      ],
    );
  }

  Widget buttonBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //week, month, year block
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 6,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 0;
                  });
                  loadWeekDate(DateTime.now());
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                    color: selected == 0 ? Utlis.deepGreen : Utlis.green,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(5.0),
                        topLeft: Radius.circular(5.0)),
                  ),
                  child: Center(
                    child: Text(
                      'WEEK',
                      style: GoogleFonts.getFont(Utlis.fontName,
                          textStyle: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                    ),
                  ),
                ),
              ),
              Container(
                width: 1.0,
                height: 39,
                decoration: BoxDecoration(color: Utlis.deepGreen),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 1;
                  });
                  loadMonthDate(DateTime.now());
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                    color: selected == 1 ? Utlis.deepGreen : Utlis.green,
                  ),
                  child: Center(
                    child: Text(
                      'MONTH',
                      style: GoogleFonts.getFont(Utlis.fontName,
                          textStyle: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                    ),
                  ),
                ),
              ),
              Container(
                width: 1.0,
                height: 39,
                decoration: BoxDecoration(color: Utlis.deepGreen),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 2;
                  });
                  loadYearDate(DateTime.now());
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                    color: selected == 2 ? Utlis.deepGreen : Utlis.green,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(5.0),
                        topRight: Radius.circular(5.0)),
                  ),
                  child: Center(
                    child: Text(
                      'YEAR',
                      style: GoogleFonts.getFont(Utlis.fontName,
                          textStyle: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        //date select button
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 6,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                decoration: BoxDecoration(
                  color: Utlis.green,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(5.0),
                      topLeft: Radius.circular(5.0)),
                ),
                child: Center(
                  child: Text(
                    'DATE',
                    style: GoogleFonts.getFont(Utlis.fontName,
                        textStyle: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white)),
                  ),
                ),
              ),
              Container(
                width: 1.0,
                height: 39,
                decoration: BoxDecoration(color: Utlis.deepGreen),
              ),
              GestureDetector(
                onTap: () async {
                  switch (selected) {
                    case 0:
                      await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return pickWeek(context);
                          });
                      break;
                    case 1:
                      pickMonth(context);
                      break;
                    case 2:
                      await pickYear(context);
                      break;
                  }
                },
                child: Container(
                  key: _key,
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                    color: Utlis.green,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(5.0),
                        topRight: Radius.circular(5.0)),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_drop_down,
                      size: 19.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget emptyContainer(Color color) {
    return Container(
      width: MediaQuery.of(context).size.width - 20.0,
      height: 8.0,
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(20.0))),
    );
  }

  Widget incomeBlock() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0.1,
            blurRadius: 5,
            offset: const Offset(0, 0.75),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          emptyContainer(Colors.green.withOpacity(0.6)),
          const HeightSpacer(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        historyTabController.clientHistoryModel.income
                            .toString(),
                        style: const TextStyle(
                          fontSize: 35,
                          fontFamily: 'Oswald',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '\$',
                        style: GoogleFonts.getFont(Utlis.fontName,
                            textStyle: const TextStyle(
                              fontSize: 35.0,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ],
                  ),
                  const Text('Income')
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.2),
                        shape: BoxShape.circle),
                    child: Center(
                      child: Icon(
                        Icons.arrow_upward,
                        color: Colors.green.withOpacity(0.9),
                      ),
                    ),
                  ),
                  const HeightSpacer(height: 10.0),
                  Text(
                    '+106%',
                    style: TextStyle(
                        color: Colors.green.withOpacity(0.8), fontSize: 16.0),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget visiotorBlock() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 241, 203, 203),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0.1,
            blurRadius: 5,
            offset: const Offset(0, 0.75),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          emptyContainer(const Color.fromARGB(255, 132, 40, 34)),
          const HeightSpacer(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    historyTabController.clientHistoryModel.visitedCount
                        .toString(),
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'Oswald',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text('Number of customer visited')
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 239, 159, 150),
                        shape: BoxShape.circle),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_downward,
                        color: Color.fromARGB(255, 111, 54, 54),
                      ),
                    ),
                  ),
                  const HeightSpacer(height: 10.0),
                  Text(
                    '-106%',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 163, 69, 69)
                            .withOpacity(0.8),
                        fontSize: 16.0),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  final HistoryTabController historyTabController =
      Get.put<HistoryTabController>(HistoryTabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Client History',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: GetBuilder<HistoryTabController>(
        init: historyTabController,
        builder: (controller) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            // child: isNullEmptyOrFalse(
            //         historyTabController.clientHistoryModel.userVisits)
            //     ? Container()
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                dateRanges(),
                const HeightSpacer(height: 10.0),
                buttonBlock(),
                const HeightSpacer(height: 20.0),
                incomeBlock(),
                const HeightSpacer(height: 15.0),
                visiotorBlock(),
                const HeightSpacer(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      historyTabController.clientHistoryModel.income.toString(),
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    Text(
                      'User profile',
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                const HeightSpacer(height: 20.0),
                ListView.builder(
                    itemCount: historyTabController
                            .clientHistoryModel.userVisits?.length ??
                        0,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ViewClient(
                                  id: historyTabController.clientHistoryModel
                                      .userVisits?[index].id)));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 50.0,
                                child: Center(
                                  child: Text(
                                    historyTabController.clientHistoryModel
                                        .userVisits![index].id
                                        .toString(),
                                    style: const TextStyle(fontSize: 16.0),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30.0,
                              ),
                              ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(30.0)),
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: imageFromBase64String(
                                      historyTabController.clientHistoryModel
                                          .userVisits![index].image!),
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    historyTabController.clientHistoryModel
                                            .userVisits?[index].firstName ??
                                        " ",
                                    style: const TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    historyTabController.clientHistoryModel
                                            .userVisits?[index].lastName ??
                                        " ",
                                    style: const TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  pickWeek(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      insetPadding: const EdgeInsets.all(0.0),
      child: SingleChildScrollView(
        child: StatefulBuilder(
          builder: (context, setState) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.all(10.0),
              child: SfDateRangePicker(
                controller: _controller,
                view: DateRangePickerView.month,
                toggleDaySelection: true,
                showNavigationArrow: true,
                headerStyle: const DateRangePickerHeaderStyle(
                    textAlign: TextAlign.center),
                selectionMode: DateRangePickerSelectionMode.range,
                onSelectionChanged: selectionChanged,
                monthViewSettings: const DateRangePickerMonthViewSettings(
                    enableSwipeSelection: false),
              ),
            );
          },
        ),
      ),
    );
  }

  pickYear(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(child: Text("Select Year")),
          content: SizedBox(
            width: 300,
            height: 300,
            child: YearPicker(
              currentDate: DateTime.now(),
              firstDate: DateTime(DateTime.now().year - 100),
              lastDate: DateTime(2022),
              initialDate: DateTime.now(),
              selectedDate: selectedDate,
              onChanged: (DateTime dateTime) {
                print('_+++++${dateTime}');
                loadYearDate(dateTime);
                selectedDate = dateTime;
                Navigator.pop(context);
              },
            ),
          ),
        );
      },
    );
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    int firstDayOfWeek = DateTime.sunday % 7;
    int endDayOfWeek = (firstDayOfWeek - 1) % 7;
    endDayOfWeek = endDayOfWeek < 0 ? 7 + endDayOfWeek : endDayOfWeek;
    PickerDateRange ranges = args.value;
    DateTime date1 = DateTime.parse(ranges.startDate.toString());
    DateTime date2 =
        ranges.endDate ?? DateTime.parse(ranges.startDate.toString());
    if (date1.isAfter(date2)) {
      var date = date1;
      date1 = date2;
      date2 = date;
    }
    int day1 = date1.weekday % 7;
    int day2 = date2.weekday % 7;

    DateTime dat1 = date1.add(Duration(days: (firstDayOfWeek - day1)));
    DateTime dat2 = date2.add(Duration(days: (endDayOfWeek - day2)));

    if (!isSameDate(dat1, DateTime.parse(ranges.startDate.toString())) ||
        !isSameDate(dat2, DateTime.parse(ranges.endDate.toString()))) {
      _controller.selectedRange = PickerDateRange(dat1, dat2);
      loadWeekDate(dat2);
      Navigator.pop(context);
    }
  }

  bool isSameDate(DateTime date1, DateTime date2) {
    if (date2 == date1) {
      return true;
    }
    if (date1 == null || date2 == null) {
      return false;
    }
    return date1.month == date2.month &&
        date1.year == date2.year &&
        date1.day == date2.day;
  }

  pickMonth(BuildContext context) {
    showMonthPicker(
      context: context,
      initialDate: selectedDate,
    ).then((date) {
      if (date != null) {
        loadMonthDate(date);
        setState(() {
          selectedDate = date;
        });
      }
    });
  }
}
