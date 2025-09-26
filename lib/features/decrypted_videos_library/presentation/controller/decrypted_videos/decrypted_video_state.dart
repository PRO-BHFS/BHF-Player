// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bhf_player/core/utils/app_constants/keys.dart';
import 'package:equatable/equatable.dart';

import 'package:bhf_player/features/decrypted_videos_library/domain/entities/card_course.dart';

class DecryptedVideoState extends Equatable {
  final Set<CardCourse> courses;

  const DecryptedVideoState(this.courses);
  const DecryptedVideoState.empty() : courses = const {};

  DecryptedVideoState copyWith({Set<CardCourse>? courses}) {
    return DecryptedVideoState(courses ?? this.courses);
  }

  @override
  List<Object?> get props => [courses];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      Keys.coursesList: courses.map((x) => x.toMap()).toList(),
    };
  }

  factory DecryptedVideoState.fromMap(Map<String, dynamic> map) {
    if (map.isEmpty) return const DecryptedVideoState.empty();
    final coursesList = map[Keys.coursesList] as List<Map<String, dynamic>>;
    return DecryptedVideoState(
      coursesList.map((x) => CardCourse.fromMap(x)).toSet(),
    );
  }

  String toJson() => json.encode(toMap());

  factory DecryptedVideoState.fromJson(String source) =>
      DecryptedVideoState.fromMap(json.decode(source) as Map<String, dynamic>);
}
