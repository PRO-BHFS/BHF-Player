import 'package:bhf_player/core/utils/app_constants/constants_exports.dart';
import 'package:bhf_player/features/course/domain/entities/sub_entity/course_password.dart';
import 'package:equatable/equatable.dart';

class CourseEntity extends Equatable {
  final int? id;
  final String courseTitle;
  final CoursePassword password;

  const CourseEntity({
    this.id,
    required this.courseTitle,
    required this.password,
  });

  factory CourseEntity.empty(int courseId) {
    return CourseEntity(
      id: courseId,
      courseTitle: "",
      password: CoursePassword(""),
    );
  }

  CourseEntity copyWith({
    int? id,
    String? courseTitle,
    CoursePassword? password,
  }) => CourseEntity(
    id: id ?? this.id,
    courseTitle: courseTitle ?? this.courseTitle,
    password: password ?? this.password,
  );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      DbColumns.courseTitle: courseTitle,
      ...password.toJson(),
    };

    if (id != null) {
      data[DbColumns.id] = id;
    }

    return data;
  }

  factory CourseEntity.fromJson(Map<String, dynamic> json) {
    return CourseEntity(
      id: json[DbColumns.id],
      courseTitle: json[DbColumns.courseTitle],
      password: CoursePassword.fromJson(json),
    );
  }

  @override
  String toString() {
    return """
    ID: $id
    Title: $courseTitle
    """;
  }

  @override
  List<Object?> get props => [id];
}
