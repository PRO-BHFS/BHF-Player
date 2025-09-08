
  import 'dart:io';


import 'package:bhf_player/bhf_studio/lib/core/utils/app_constants/app_constants_exports.dart';
import 'package:path_provider/path_provider.dart';

Future<void> clearCacheIfNeeded() async {
    final cacheDir =
        await getTemporaryCacheDirectory(); // أو getApplicationCacheDirectory()
    if (cacheDir != null && cacheDir.existsSync()) {
      int currentCacheSize = await getCacheSize(cacheDir);
      // print('currentCacheSize = $currentCacheSize');
      if (currentCacheSize > AppConsts.maxCacheSizeBytes) {
        try {
          await cacheDir.delete(recursive: true);
          currentCacheSize = await getCacheSize(cacheDir);
        } catch (e) {
          // print(e);
        }
      }
    }
  }
  

  Future<int> getCacheSize(Directory cacheDir) async {
    int totalSize = 0;
    if (cacheDir.existsSync()) {
      await for (var entity in cacheDir.list(
        recursive: true,
        followLinks: false,
      )) {
        if (entity is File) {
          totalSize += await entity.length();
        }
      }
    }
    return totalSize;
  }



Future<Directory?> getTemporaryCacheDirectory() async {
  if (Platform.isAndroid || Platform.isIOS) {
    return await getTemporaryDirectory();
  }
  return null; // أو مسار افتراضي آخر للأنظمة الأساسية الأخرى
}

Future<Directory?> getApplicationCacheDirectory() async {
  if (Platform.isAndroid || Platform.isIOS) {
    return await getApplicationCacheDirectory();
  }
  return null; // أو مسار افتراضي آخر
}
