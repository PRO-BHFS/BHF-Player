import 'package:flutter/material.dart';

class WarningIcon extends StatelessWidget {
  const WarningIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.warning_amber_outlined,
      color: Color(0xFFF20D0D),
      size: 80,
    );
  }
}
