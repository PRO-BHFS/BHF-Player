import 'package:flutter/material.dart';

extension SeparatedWidgetList on List<Widget> {
  List<Widget> separatedBy(Widget seperator) {
    final result = <Widget>[];
    for (int i = 0; i < length; i++) {
      result.add(this[i]);
      if (i != length - 1) result.add(seperator);
    }
    return result;
  }
}
