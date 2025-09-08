import 'package:bhf_player/features/decrypt_video/presentation/controller/video_decryption/video_decryption_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildProgressLoading extends StatelessWidget {
  const BuildProgressLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 500),
      tween: Tween<double>(
        begin: 0.0,
        end: context.watch<VideoDecryptionCubit>().progressValue,
      ),
      builder: (_, value, _) => LinearProgressIndicator(value: value),
    );
  }
}
