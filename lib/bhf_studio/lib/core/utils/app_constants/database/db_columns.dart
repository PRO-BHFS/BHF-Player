class DbColumns {
  DbColumns._();
  static const String id = "id";
  static const String idType =
      "${ColumnsType.integer} ${ColumnsType.primaryKey}";

  static const String courseTitle = "courseTitle";
  static const String courseTitleType = ColumnsType.textNotNullable;

  static const String encryptionCode = "encryptionCode";
  static const String encryptionCodeType = ColumnsType.textNotNullable;
}

class ColumnsType {
  ColumnsType._();
  static const String integer = "INTEGER";
  static const String textNotNullable = "TEXT NOT NULL";
  static const String textNullable = "TEXT NULL";
  static const String primaryKey = "PRIMARY KEY AUTOINCREMENT";
}
