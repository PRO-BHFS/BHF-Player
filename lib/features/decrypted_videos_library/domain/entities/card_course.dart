// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bhf_player/features/decrypt_video/domain/entities/video_entity.dart';
import 'package:equatable/equatable.dart';

import 'package:bhf_player/core/utils/app_constants/keys.dart';
import 'package:bhf_player/features/course/domain/entities/course.dart';

class CardCourse extends Equatable {
  final int courseId;
  final String courseTitle;
  final Set<VideoEntity> videos;

  const CardCourse({
    required this.courseId,
    required this.courseTitle,
    required this.videos,
  });

  factory CardCourse.fromEntityCourse(CourseEntity course) {
    return CardCourse(
      courseId: course.id!,
      courseTitle: course.courseTitle,
      videos: {},
    );
  }

  String? get courseThumbnail => videos.firstOrNull?.thumbnailPath;

  Map<String, dynamic> toMap() {
    return {
      Keys.courseId: courseId,
      Keys.courseTitle: courseTitle,
      Keys.videosLibrary: videos.map((x) => x.toMap()).toList(),
    };
  }

  factory CardCourse.fromMap(Map<String, dynamic> map) {
    final videos = (map[Keys.videosLibrary] as List<dynamic>);

    return CardCourse(
      courseId: map[Keys.courseId] as int,
      courseTitle: map[Keys.courseTitle] as String,
      videos: videos
          .map((e) => VideoEntity.fromMap(e as Map<String, dynamic>))
          .toList().toSet(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CardCourse.fromJson(String source) =>
      CardCourse.fromMap(json.decode(source) as Map<String, dynamic>);

  CardCourse copyWith({
    int? courseId,
    String? courseTitle,
    Set<VideoEntity>? videos,
  }) {
    return CardCourse(
      courseId: courseId ?? this.courseId,
      courseTitle: courseTitle ?? this.courseTitle,
      videos: videos ?? this.videos,
    );
  }

  @override
  List<Object?> get props => [courseId, courseTitle];
}
