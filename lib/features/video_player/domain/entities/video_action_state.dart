import 'package:equatable/equatable.dart';

class VideoActionState extends Equatable {
  final bool isMuted; // حالة أيقونة الصوت
  final bool isSpeedControlActive; // حالة أيقونة السرعة
  final bool isDarkModeActive; // حالة أيقونة الوضع الليلي

  const VideoActionState({
    this.isMuted = false,
    this.isSpeedControlActive = false,
    this.isDarkModeActive = false,
  });

  /// copyWith لتحديث حالة أيقونة واحدة أو أكثر
  VideoActionState copyWith({
    bool? isMuted,
    bool? isSpeedControlActive,
    bool? isDarkModeActive,
  }) {
    return VideoActionState(
      isMuted: isMuted ?? this.isMuted,
      isSpeedControlActive: isSpeedControlActive ?? this.isSpeedControlActive,
      isDarkModeActive: isDarkModeActive ?? this.isDarkModeActive,
    );
  }

  @override
  List<Object?> get props => [
    isMuted,
    isSpeedControlActive,
    isDarkModeActive,
  ];
}
