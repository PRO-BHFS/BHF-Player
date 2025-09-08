abstract class GenerateSmartPasswordState {}

class GenerateSmartPasswordInitial extends GenerateSmartPasswordState {}

class GenerateSmartPasswordSuccessfully extends GenerateSmartPasswordState {
  final String smartPassword;
  final String message;

  GenerateSmartPasswordSuccessfully({
    required this.message,
    required this.smartPassword,
  });
}

class GenerateSmartPasswordError extends GenerateSmartPasswordState {
  final String message;

  GenerateSmartPasswordError(this.message);
}
