import 'package:intl/intl.dart';

String todayFormatedDate() {
  final now = DateTime.now();

  return DateFormat('dd/MM').format(now);
}
