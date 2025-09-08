import 'package:bhf_player/features/decrypt_video/presentation/controller/video_decryption/video_decryption_state.dart';

class ProcessProgress {
  ProcessProgress._();
  static final _instance = ProcessProgress._();
  factory ProcessProgress() => _instance;

  void Function(VideoDecryptionState)? emit;
  int total = 0;
  int _completed = 0;
  bool _isLoading = false;

  double get progress => total != 0 ? _completed / total : 0;

  bool get isLoading => _isLoading;
  bool get isFinished => total == _completed;

  void incrementCompleted() {
    _completed = (_completed + 1).clamp(0, total);
    emit?.call(VideoDecryptionIncrementProgress(progress));
  }

  void finishProcess() => _isLoading = false;

  void startLoading(int total) {
    _isLoading = true;
    const partInitilization = 1;

    this.total = total + partInitilization;
    _completed = 0;
    emit?.call(VideoDecryptionIncrementProgress(progress));
  }
}
