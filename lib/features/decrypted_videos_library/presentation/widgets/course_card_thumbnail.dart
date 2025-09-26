import 'dart:io';

import 'package:bhf_player/core/utils/app_constants/app_assests/app_images_assests.dart';
import 'package:flutter/material.dart';

class CourseCardThumbnail extends StatelessWidget {
  const CourseCardThumbnail({super.key, this.thumbnailPath});

  final String? thumbnailPath;

  @override
  Widget build(BuildContext context) {
    final ImageProvider image = thumbnailPath != null
        ? FileImage(File(thumbnailPath!))
        : const AssetImage(AppImagesAssests.error);
    return Container(
      width: 60,
      decoration: BoxDecoration(
        image: DecorationImage(image: image, fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
