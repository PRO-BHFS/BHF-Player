import 'package:bhf_player/features/video_player/presentation/controllers/video_player/video_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaybackSpeedDropdown extends StatelessWidget {
  final VideoPlayerCubit playerCubit;
  const PlaybackSpeedDropdown({super.key, required this.playerCubit});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: playerCubit.playerService.playbackSpeed,
      builder: (context, rateValue, child) {
        return DropdownMenu<double>(
          initialSelection: rateValue,
          onSelected: (newSpeed) {
            if (newSpeed == null) return;
            context.read<VideoPlayerCubit>().changePlaybackSpeed(newSpeed);
          },

          requestFocusOnTap: false,
          inputDecorationTheme: const InputDecorationTheme(
            border: InputBorder.none,
            fillColor: Colors.amber,
          ),

          dropdownMenuEntries: [
            const DropdownMenuEntry(value: 0.5, label: '0.5x'),
            const DropdownMenuEntry(value: 1.0, label: '1.0x'),
            const DropdownMenuEntry(value: 1.5, label: '1.5x'),
            const DropdownMenuEntry(value: 2.0, label: '2.0x'),
          ],
        );
      },
    );
  }
}
