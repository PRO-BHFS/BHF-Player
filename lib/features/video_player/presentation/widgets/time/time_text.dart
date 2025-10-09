import 'package:bhf_player/core/utils/extensions/export/all_extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TimeText extends StatelessWidget {
  const TimeText({super.key, required this.listenable, this.isSlash = false});

  final ValueListenable<Duration> listenable;
  final bool isSlash;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Duration>(
      valueListenable: listenable,
      builder: (_, time, _) {
        final label = time.formattedVideoDuration;

        return Text(
          label,
          style: context.textTheme.displaySmall?.copyWith(color: Colors.white,
          fontSize: 9
          
          ),
        );
      },
    );
  }
}
