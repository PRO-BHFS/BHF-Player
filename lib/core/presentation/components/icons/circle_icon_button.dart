import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;
  final Color? circleColor;

  const CircleIconButton({
    super.key,
    required this.onPressed,
     this.circleColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      backgroundColor:circleColor,
      radius: 45.r / 2,
      child: IconButton(onPressed: onPressed, icon: icon),
    );
  }
}
