import 'package:bhf_player/generated/l10n.dart';

String? checkFieldEmpty(String? value) {
  if (value == null || value.isEmpty) {
    return S.current.field_cannot_be_empty;
  } else if (value.trim().isEmpty) {
    return S.current.field_cannot_contain_only_spaces;
  }
  return null;
}
