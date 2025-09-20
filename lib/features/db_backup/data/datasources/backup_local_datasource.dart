import 'dart:io';
import 'dart:typed_data';
import 'package:bhf_player/core/utils/extensions/extensions.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:bhf_player/core/database/local/cache/database_service.dart';
import 'package:bhf_player/core/utils/app_constants/constants_exports.dart';
import 'package:bhf_player/core/utils/helpers_functions/helpers_exports.dart';

class BackupLocalDataSource {
  final DatabaseService _databaseService;

  BackupLocalDataSource(this._databaseService);

  final key = encrypt.Key.fromUtf8('6E5jFM9Xrmfpe3t6h4pdMtcAly39gRo6');

  Future<String?> backupDatabase() async {
    try {
      await _databaseService.close();

      final databasesPath = await getDatabasesPath();
      final dbPath = join(databasesPath, DbConstants.databaseName);
      final dbFile = File(dbPath);

      final dbBytes = await dbFile.readAsBytes();

      // تشفير باستخدام AES

      final iv = encrypt.IV.fromSecureRandom(16);
      final encrypter = encrypt.Encrypter(encrypt.AES(key));
      final encrypted = encrypter.encryptBytes(dbBytes, iv: iv);

      final encrtptedBytes = Uint8List.fromList(iv.bytes + encrypted.bytes);

      // نحفظ النسخة باسم معين
      final backupPath = await saveFile(bytes: encrtptedBytes);

      return backupPath;
    } catch (e, stack) {
      e.logError(stack: stack);
      rethrow;
    } finally {
      await _databaseService.init();
    }
  }

  Future<bool> restoreDatabase() async {
    final dbPath = await getDatabasesPath();
    final dbFilePath = join(dbPath, DbConstants.databaseName);
    final original = File(dbFilePath);

    final backupPath = await pickFile();

    if (backupPath == null) return false;

    final backupFile = File(backupPath);

    if (!await backupFile.exists()) throw Exception("Backup file not found");

    // 1) نقرأ الملف المشفر
    final backupFileBytes = await backupFile.readAsBytes();

    final ivBytes = backupFileBytes.sublist(0, 16);
    final encryptedBytes = backupFileBytes.sublist(16);
    final iv = encrypt.IV(ivBytes);

    // 2) نفك التشفير
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final decrypted = encrypter.decryptBytes(
      encrypt.Encrypted(encryptedBytes),
      iv: iv,
    );

    await _databaseService.close();

    await original.writeAsBytes(decrypted);

    await _databaseService.init();
    return true;
  }
}
