import 'package:flutter/material.dart';

class BuildAppTextButton extends StatelessWidget {
  final VoidCallback? onPress;
  final Widget? child;
  final String? text;

  const BuildAppTextButton({
    super.key,
    required this.onPress,
    this.child,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPress, child: child ?? Text(text!));
  }
}
