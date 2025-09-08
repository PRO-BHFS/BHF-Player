import 'package:bhf_player/bhf_studio/lib/core/utils/extensions/extensions.dart';
import 'package:bhf_player/bhf_studio/lib/core/utils/helpers_functions/helpers_exports.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/domain/entity/video.dart';
import 'package:bhf_player/bhf_studio/lib/features/encryption_video/presentation/controllers/encryption_process/encryption_process_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoInfoCard extends StatelessWidget {
  final Video video;
  const VideoInfoCard({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    final labelSmall = context.textTheme.labelSmall;
    return Dismissible(
      key: ValueKey(video.nameWithExtension),
      direction: DismissDirection.horizontal,
      onDismissed: (direction) {
        context.read<EncryptionProcessCubit>().removeVideo(video);

        Notifications.showFlushbar(
          message: 'تم حذف ${video.nameWithoutExtension}',
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 7),
          child: ListTile(
            title: Text(
              video.nameWithoutExtension,
              maxLines: 1,
              style: labelSmall,
            ),
            trailing: Text(
              video.fileExtension.toUpperCase(),
              style: labelSmall,
            ),
            
            subtitle: Text(
              '${video.sizeInMegaFormatted} MB',
              style: labelSmall,
            ),
          ),
        ),
      ),
    );
  }
}
