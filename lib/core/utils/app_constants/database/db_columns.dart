class DbColumns {
  DbColumns._();
  static const id = "id";
  static const idType = "${ColumnsType.integer} ${ColumnsType.primaryKey}";

  static const courseTitle = "course_title";
  static const courseTitleType = ColumnsType.textNotNullable;

  static const fullPassword = "full_password";
  static const fullPasswordType = ColumnsType.textNotNullable;

  static const encryptionCode = "encryption_code";
  static const encryptionCodeType = ColumnsType.textNullable;

  static const passwordInId = "password_in_id";
  static const passwordInIdType = ColumnsType.textNullable;
}

class ColumnsType {
  ColumnsType._();
  static const integer = "INTEGER";
  static const textNotNullable = "TEXT NOT NULL";
  static const textNullable = "TEXT NULL";
  static const primaryKey = "PRIMARY KEY AUTOINCREMENT";
}
