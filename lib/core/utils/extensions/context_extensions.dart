import 'package:flutter/material.dart';
import 'package:bhf_player/core/utils/styles/app_sizes/app_sizes.dart';

extension PageRoute on BuildContext {
  Future<T?> pushRoute<T>(Widget pageRoute) async =>
      await Navigator.push(this, MaterialPageRoute(builder: (_) => pageRoute));
  void pushReplacementRoute(Widget pageRoute) => Navigator.pushReplacement(
    this,
    MaterialPageRoute(builder: (_) => pageRoute),
  );
  void popRoute<T>([T? result]) => Navigator.pop(this, result);
}

extension Themes on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  ThemeData get theme => Theme.of(this);
}

extension Layout on BuildContext {
  MediaQueryData get _mq => MediaQuery.of(this);

  double get screenWidth => _mq.size.width;
  double get devicePixelRatio => _mq.devicePixelRatio;
  double get screenHeight => _mq.size.height;
  double get widthExceptPadding => screenWidth - AppSizes.mainPadding;
  EdgeInsets get mediaViewInsets => _mq.viewInsets;
}
