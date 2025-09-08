class AppConsts {
  AppConsts._();

  static const appVersion = "1.0";
  static const contactPhone = "776793111";

  static const maxCacheSizeBytes = 100 * 1024 * 1024; // 100 ميجابايت
  static const sizeMegaOfChunk = 5;
  static const sizeBytesOfChunk = 1024 * 1024 * sizeMegaOfChunk;
  static const sizeMegaInBytes = 1024 * 1024;
  static const encryptionCodeMaxLength =32;

  static const dateFormat = "yyyy/MM/dd";

  static const encryptedDataStart = 16;
  static const derivenKey = 's52%H&W2vc8d+Kne0_o-IMwjV+Yv0Rck';
  static const loadingDuration = Duration(milliseconds: 600);

  static const fileExtension = "bhf";
}
