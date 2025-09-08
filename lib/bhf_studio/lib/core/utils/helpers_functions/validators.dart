String? checkFieldEmpty(String? value) {
  if (value == null || value.isEmpty) {
    return "لايمكن ان يكون الحقل فارغا";
  } else if (value.trim().isEmpty) {
    return "لا يمكن ان يحتوي الحقل على مسافات فقط";
  }
  return null;
}
