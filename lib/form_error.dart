class FormError {
  final Map<String, String> _errors = {};

  void setError(String field, String message) {
    _errors[field] = message;
  }

  void clearError(String field) {
    _errors.remove(field);
  }

  void clearAll() {
    _errors.clear();
  }

  String? get(String field) => _errors[field];

  bool hasError(String field) => _errors.containsKey(field);

  bool get hasAnyError => _errors.isNotEmpty;

  Map<String, String> get all => _errors;
}
