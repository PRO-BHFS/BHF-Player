import 'package:flutter/material.dart';

class BuildTextButton extends StatelessWidget {
  final Widget? child;
  final String? text;
  final VoidCallback onPress;

  const BuildTextButton({
    super.key,
    this.child,
    this.text,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPress, child: child ?? Text(text!));
  }
}
