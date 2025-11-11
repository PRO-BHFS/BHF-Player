 class AppConsts {
  AppConsts._();

  static const appVersion = "1.0.2";
  static const buildNumber = "2";
  static const contactPhone = "+967776793111";
  static const supportWhatsApp = "+14314458048";

  static const englishCode = 'en';
  static const arabicCode = 'ar';

  static const maxCacheSizeBytes = 100 * 1024 * 1024; // 100 ميجابايت

  static const appName = "BHF Player";
  static const _sizeMegaOfChunk = 5;
  static const sizeBytesOfChunk = 1024 * 1024 * _sizeMegaOfChunk;
  static const encryptedDataStart = 16;
  static const derivenKey = 's52%H&W2vc8d+Kne0_o-IMwjV+Yv0Rck';
  static const decryptedFileName = 'fi7d46jjd4';
  static const originalVideoExtension = 'mp4';

  static const videoControlsDuration = Duration(milliseconds: 1500);
  static const seekStepDuration = Duration(seconds: 10);
  static const fadeInDuration = Duration(milliseconds: 200);
  static const fadeOutDuration = Duration(seconds: 1);

  static const encryptedfileExtension = ".bhf";
  static const imagesFolder = "images";
}
