import 'package:bhf_player/core/utils/app_constants/keys.dart';
import 'package:bhf_player/core/utils/enums/enums.dart';
import 'package:bhf_player/core/utils/extensions/export/all_extensions.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class LanguageCubit extends HydratedCubit<Language> {
  LanguageCubit() : super(Language.ar);

  Language get language => state;

  void selectLanguage(Language? newLanguage) {
    if (newLanguage == state || newLanguage == null) return;

    emit(newLanguage);
  }

  @override
  Language? fromJson(Map<String, dynamic> json) {
    final languageCode = json[Keys.lastLanguage] as String?;
    return languageCode.toLanguage();
  }

  @override
  Map<String, dynamic>? toJson(Language state) => {
    Keys.lastLanguage: state.name,
  };
}
