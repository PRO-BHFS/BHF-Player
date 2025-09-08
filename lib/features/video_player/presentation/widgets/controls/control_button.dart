import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ControlButton<T> extends StatelessWidget {
  final ValueListenable<T> listenable;
  final Widget Function(T value) iconBuilder;
  final VoidCallback onPressed;

  const ControlButton({super.key, 
    required this.listenable,
    required this.iconBuilder,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<T>(
      valueListenable: listenable,
      builder: (context, value, _) {
        return IconButton(icon: iconBuilder(value), onPressed: onPressed);
      },
    );
  }
}
