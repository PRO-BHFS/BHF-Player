import 'package:flutter/material.dart';

class BuildIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget icon;

  const BuildIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: icon);
  }
}
