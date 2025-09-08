import 'package:bhf_player/bhf_studio/lib/core/utils/helpers_functions/file_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:path/path.dart' as p;

class Video extends Equatable {
  final String filePath;
  final int bytesSize;
  static int totalVideosBytes = 0;

  const Video({required this.filePath, required this.bytesSize});

  String get nameWithoutExtension => p.basenameWithoutExtension(filePath);
  String get nameWithExtension => p.basename(filePath);
  String get fileExtension => p.extension(filePath).replaceAll('.', '');
  String get sizeInMegaFormatted => fromBytesToMegaFormatted(bytesSize);

  @override
  List<Object?> get props => [filePath, bytesSize];
}
