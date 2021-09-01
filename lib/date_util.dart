import 'package:intl/intl.dart';

class DateUtil {
  static const DATE_FORMAT = 'MM/yy';
  String formattedDate(DateTime dateTime) {
    // print('dateTime ($dateTime)');
    return DateFormat(DATE_FORMAT).format(dateTime);
  }
}
