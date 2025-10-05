import 'package:intl/intl.dart';

String todayFormatedDate() {
  final now = DateTime.now();

  return DateFormat.yMMMd('en_US').format(now);
}
