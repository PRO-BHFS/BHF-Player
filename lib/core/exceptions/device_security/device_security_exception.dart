import 'package:bhf_player/core/exceptions/app_exceptions/app_exceptions.dart';

abstract class DeviceSecurityException extends AppException {
  DeviceSecurityException(super.message);

  @override
  String toString() => message;
}

class RootedDeviceException extends DeviceSecurityException {
  RootedDeviceException() : super("⚠️ الجهاز مروّت (Rooted).");
}

class JailBrokenDeviceException extends DeviceSecurityException {
  JailBrokenDeviceException() : super("⚠️ الجهاز مكسور الحماية (Jailbroken).");
}

class EmulatorDeviceException extends DeviceSecurityException {
  EmulatorDeviceException() : super("⚠️ التطبيق يعمل على محاكي (Emulator).");
}

class ExternalStorageException extends DeviceSecurityException {
  ExternalStorageException() : super("⚠️ التطبيق مثبت على وحدة تخزين خارجية.");
}

class UsbDebuggingEnabledException extends DeviceSecurityException {
  UsbDebuggingEnabledException() : super("⚠️ وضع تصحيح USB مفعل.");
}

class MockLocationException extends DeviceSecurityException {
  MockLocationException() : super("⚠️ هناك موقع وهمي (Mock Location).");
}
