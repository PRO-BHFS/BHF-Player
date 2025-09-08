import 'package:flutter/material.dart';

class BuildPrimaryButton extends StatelessWidget {
  final Widget? child;
  final String? text;
  final VoidCallback? onPress;

  const BuildPrimaryButton({
    super.key,
    this.child,
    this.text,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPress, child: child ?? Text(text!));
  }
}
