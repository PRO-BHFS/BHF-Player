import 'package:bhf_player/bhf_studio/lib/core/utils/app_constants/database/db_columns.dart';
import 'package:equatable/equatable.dart';

class CourseEntity extends Equatable {
  final int? id;
  final String title;
  final String encryptionCode;

  const CourseEntity({
    this.id,
    required this.title,
    required this.encryptionCode,
  });

  CourseEntity copyWith({int? id, String? title, String? encryptionCode}) =>
      CourseEntity(
        id: id ?? this.id,
        encryptionCode: encryptionCode ?? this.encryptionCode,
        title: title ?? this.title,
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      DbColumns.courseTitle: title,
      DbColumns.encryptionCode: encryptionCode,
    };

    if (id != null) data[DbColumns.id] = id;

    return data;
  }

  factory CourseEntity.fromJson(Map<String, dynamic> map) {
    return CourseEntity(
      id: map[DbColumns.id],
      title: map[DbColumns.courseTitle],
      encryptionCode: map[DbColumns.encryptionCode],
    );
  }

  @override
  List<Object?> get props => [id, title, encryptionCode];
}
