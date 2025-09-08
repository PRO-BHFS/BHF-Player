import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TimeText extends StatelessWidget {
  final ValueListenable<Duration> listenable;

  const TimeText({super.key, required this.listenable});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Duration>(
      valueListenable: listenable,
      builder: (_, value, _) {
        final text = Text(
          value.formattedVideoDuration,
          style: const TextStyle(color: Colors.white),
        );

        return Container(
          padding: const EdgeInsets.all(2),
          color: const Color(0x2B000000),
          child: text,
        );
      },
    );
  }
}
