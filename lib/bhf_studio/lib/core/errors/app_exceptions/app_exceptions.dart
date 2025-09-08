
/// الأساس لجميع استثناءات المشروع.
abstract class AppException implements Exception {
  final String message;

  AppException(this.message);

  @override
  String toString() => message;
}

/// خطأ أثناء عملية التشفير.
class EncryptionException extends AppException {
  EncryptionException(super.message);
}

/// خطأ أثناء عملية فك التشفير.
class DecryptionException extends AppException {
  DecryptionException(super.message);
}

/// خطأ أثناء قراءة ملف.
class FileReadException extends AppException {
  FileReadException(super.message);
}

/// خطأ أثناء كتابة ملف.
class FileWriteException extends AppException {
  FileWriteException(super.message);
}

/// خطأ عام متعلق بالـ Isolate
class IsolateException extends AppException {
  IsolateException(super.message);
}
