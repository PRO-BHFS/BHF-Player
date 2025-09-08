import 'package:flutter/foundation.dart';

class VideoProgressTracker {
  VideoProgressTracker({required this.totalVideos});
  final int totalVideos;

  final isEncrypting = ValueNotifier(false);

  final overallProgress = ValueNotifier(.0);
  final currentVideoProgress = ValueNotifier(.0);

  final _currentVideoName = ValueNotifier("");
  final completedParts = ValueNotifier(0);
  final _partsPerVideo = ValueNotifier(0);

  final completedVideos = ValueNotifier(0);

  ValueNotifier<String> get currentVideoTitle => _currentVideoName;
  ValueNotifier<int> get partsPerCurrentVideo => _partsPerVideo;

  void startEncryptionProgress() {
    isEncrypting.value = true;
    completedParts.value = 0;
    completedVideos.value = 0;
  }

  Future<void> _finishEncryptionProgress() async {
    await Future.delayed(
      const Duration(milliseconds: 300),
      () => isEncrypting.value = false,
    );
  }

  set partsPerVideo(int parts) {
    if (parts <= 0) throw ArgumentError('parts must be greater than 0');
    const partInitilization = 1;
    _partsPerVideo.value = parts + partInitilization;
    completedParts.value = 0;
    _updateProgress();
  }

  set currentVideoName(String videoName) {
    _currentVideoName.value = videoName;
  }

  Future<void> incrementCompletedParts() async {
    if (_partsPerVideo.value <= 0) {
      throw StateError("عدد الأجزاء للفيديو غير مضبوط.");
    }

    if (completedParts.value + 1 <= _partsPerVideo.value) {
      completedParts.value++;
    }

    if (completedParts.value == _partsPerVideo.value) {
      currentVideoProgress.value = 1.0;
      await Future.delayed(
        const Duration(milliseconds: 300),
        () async => await _completeCurrentVideo(),
      );
    }

    _updateProgress();
  }

  Future<void> _completeCurrentVideo() async {
    completedVideos.value++;
    _updateProgress();

    if (completedVideos.value != totalVideos) return;

    overallProgress.value = 1.0;
    await _finishEncryptionProgress();
  }

  void _updateProgress() {
    final newOverallProgress = completedVideos.value / totalVideos;
    overallProgress.value = newOverallProgress.clamp(0.0, 1.0);

    final newCurrentVideoProgress = completedParts.value / _partsPerVideo.value;
    currentVideoProgress.value = newCurrentVideoProgress.clamp(0.0, 1.0);
  }
}
