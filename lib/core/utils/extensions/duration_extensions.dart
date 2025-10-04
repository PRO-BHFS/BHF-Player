extension VideoDurationFormatting on Duration {
  String _padTwoDigits(int n) => n.toString().padLeft(2, '0');

  String get formattedVideoDuration {
    if (this == Duration.zero) return '--:--';
    final hours = _padTwoDigits(inHours);
    final minutes = _padTwoDigits(inMinutes.remainder(60));
    final seconds = _padTwoDigits(inSeconds.remainder(60));
    return inHours > 0 ? '$hours:$minutes:$seconds' : '$minutes:$seconds';
  }
}
