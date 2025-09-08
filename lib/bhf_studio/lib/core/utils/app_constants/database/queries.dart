import 'package:bhf_player/bhf_studio/lib/core/utils/app_constants/app_constants_exports.dart';

class Queries {
  Queries._();

  static const createTableCourses =
      '''
    CREATE TABLE ${DbConstants.tableName} (
        ${DbColumns.id} ${DbColumns.idType},
        ${DbColumns.courseTitle} ${DbColumns.courseTitleType},
        ${DbColumns.encryptionCode} ${DbColumns.encryptionCodeType}
      )
  ''';

  
  static String resetTable(String tableName) =>
      "DELETE FROM sqlite_sequence WHERE name = '$tableName'";
}
