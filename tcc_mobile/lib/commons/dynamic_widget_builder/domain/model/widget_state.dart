enum WidgetState {
  idle,
  loading,
  success,
  error,
  empty,
  hide;

  factory WidgetState.getByName(String? name) => WidgetState.values.firstWhere(
        (e) => e.name == name,
        orElse: () => WidgetState.loading,
      );
}
