import 'db_columns.dart';
import 'db_constants.dart';

class Queries {
  Queries._();

  static const createTableCourses =
      '''
    CREATE TABLE ${DbConstants.tableName} (
        ${DbColumns.id} ${DbColumns.idType},
        ${DbColumns.courseTitle} ${DbColumns.courseTitleType},
        ${DbColumns.fullPassword} ${DbColumns.fullPasswordType}
      )
  ''';

  static String resetTable(String tableName) =>
      "DELETE FROM sqlite_sequence WHERE name = '$tableName'";
}
