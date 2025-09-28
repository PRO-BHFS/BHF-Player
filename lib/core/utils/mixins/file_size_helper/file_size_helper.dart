mixin FileSizeHelper {
  String toMB(int bytes) => "${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB";

  String toGB(int bytes) =>
      "${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB";

  /// ✅ يختار الوحدة المناسبة تلقائياً
  String formatBytes(int? bytesSize) {
    final bytes = bytesSize ?? 0;
    if (bytes < (1024 * 1024 * 1024)) return toMB(bytes);
    return toGB(bytes);
  }
}
