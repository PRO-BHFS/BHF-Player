import 'package:flutter/material.dart';

class AppDropdownMenuTheme {
  AppDropdownMenuTheme._();
  static DropdownMenuThemeData get dark => const DropdownMenuThemeData(
    menuStyle: MenuStyle(
      padding: WidgetStatePropertyAll(EdgeInsets.all(0)),
      minimumSize: WidgetStatePropertyAll(Size(double.infinity, 80)),
      maximumSize: WidgetStatePropertyAll(Size(double.infinity, 300)),
    ),
  );

  static DropdownMenuThemeData get light => const DropdownMenuThemeData(
    menuStyle: MenuStyle(
      padding: WidgetStatePropertyAll(EdgeInsets.all(0)),
      minimumSize: WidgetStatePropertyAll(Size(double.infinity, 80)),
      maximumSize: WidgetStatePropertyAll(Size(double.infinity, 300)),
    ),
  );
}
