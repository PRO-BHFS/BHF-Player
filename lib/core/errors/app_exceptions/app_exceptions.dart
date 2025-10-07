
abstract class AppException implements Exception {
  final String message;

  AppException(this.message);

  @override
  String toString() => message;
}

class EncryptionException extends AppException {
  EncryptionException(super.message);
}

class DecryptionException extends AppException {
  DecryptionException(super.message);
}

class FileReadException extends AppException {
  FileReadException(super.message);
}

class FileWriteException extends AppException {
  FileWriteException(super.message);
}

class IsolateException extends AppException {
  IsolateException(super.message);
}

class InvalidFileExtensionException extends AppException {
  InvalidFileExtensionException(super.message);
}
