import 'package:intl/intl.dart';

class DateUtilities {
  static const String kMainSourceFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ";

  static const kSourceFormat = "yyyy-MM-dd'T'HH:mm:ssZ";
  static const specialFormat = "yyyy-MM-dd'T'HH:mm";
  static const demoDateFormat = "yyyy-MM-dd HH:mm:ss.SSSZ";

  static const demo = "EEEE, d MMMM";
  static const String dd_mm_yyyy_hh_mm = "dd-MM-yyyy HH:mm";
  static const String yyyy_dd_mm_hh_mm = "yyyy-MM-dd HH:mm";
  static const String dd_mm_yyyy_hh_mm_a = "dd-MM-yyyy hh:mm a";
  static const String dd_mm_yyyy_hh_mm_ss_a = "dd/MM/yyyy',' hh:mm a";
  static const String dd_mm_yyyy_hh_mm_ss_aa = "dd-MM-yyyy' at 'hh:mm a";
  static const String dd_mm_yyyy_hh_mm_ss = "dd MMM yyyy',' hh:mm a";
  static const String dd_mm_yyyy_n_mm_ss_a = "dd/MM/yyyy'\n' hh:mm a";
  static const String dd_mm_yyyy = "dd MMM yyyy";
  static const String dd_eee = "dd\nEE";
  static const String mm_yyyy = "MM/yyyy";
  static const String dd = "d";
  static const String mmm = "MMM";
  static const String mmmm = "MMMM";
  static const String yyyy = "yyyy";
  static const String file_name_date = "dd MMM yyyy";
  static const String dd_mm_yyyy_ = "dd-MM-yyyy";
  static const String yyyy_mm_dd = "yyyy-MM-dd";
  static const String yy_mm_dd = "yy.MM.dd";
  static const String mmm_dd_yyyy = "MMM dd,yyyy";

  static const String ddmmyyyy_ = "dd/MM/yyyy";
  static const String ddmmyywithdash = "dd-MM-yyyy";
  static const String hh_mm_ss = "HH:mm:ss";
  static const String hh_mm_a = "hh:mm a";
  static const String hh_mm = "hh:mm";
  static const String h_mm_a = "h:mm a";
  static const String eeee = "EEEE";
  static const String ee = "EE";
  static const String eee_dd_mmm_yyyy = "EEEE, dd MMM yyyy";

  static const String dd_mmm_yy_h_mm_a = "dd MMM''yy 'at' h:mma";

  static const String mmm_yyyy = "MMMM yyyy";

  static String converDateTimeToString({
    required DateTime date,
    String dateFormatter = yyyy_mm_dd,
  }) {
    final DateFormat formatter = DateFormat(dateFormatter);
    return formatter.format(date);
  }

  static String convertServerDateToFormatterString(String dateString,
      {String? formatter}) {
    // if (dateString == "" || dateString == null) return "";
    // DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
    //         DateTime.parse(dateString).millisecondsSinceEpoch)
    //     .toLocal();
    return getFormattedDateString(
      getDateFromString(dateString, formatter: kSourceFormat),
      formatter: formatter!,
    );
  }

  static DateTime getDateFromString(String dateString, {String? formatter}) {
    // ignore: prefer_conditional_assignment
    if (formatter == null) {
      formatter = kMainSourceFormat;
    }
    return DateFormat(formatter).parse(dateString);
  }

  static String getDateFromStringAndReturnStringFormat(String dateString,
      {String? formatter}) {
    // ignore: prefer_conditional_assignment
    if (formatter == null) {
      formatter = kMainSourceFormat;
    }
    String date = DateFormat(formatter).parse(dateString).toString();
    return date.toString();
  }

  static String getFormattedDateString(DateTime date, {String? formatter}) {
    // ignore: prefer_conditional_assignment
    if (formatter == null) {
      formatter = kMainSourceFormat;
    }
    return DateFormat(formatter).format(date);
  }

  int dayInYear(DateTime date) =>
      date.difference(DateTime(date.year, 1, 1)).inDays;

  //Count days between two dates.
  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }
}

class TimeAgo {
  static String timeAgoSinceDate(DateTime dateString,
      {bool numericDates = true}) {
    final date2 = DateTime.now();
    final difference = date2.difference(dateString);

    if (difference.inDays > 8) {
      return DateFormat.yMMMd().format(dateString);
    } else if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1w ago' : 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays}d ago';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1d ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours}hr ago';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1hr ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes}min ago';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1min ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds}sec ago';
    } else {
      return 'Just now';
    }
  }
}
