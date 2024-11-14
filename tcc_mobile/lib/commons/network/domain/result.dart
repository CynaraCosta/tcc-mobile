import 'package:equatable/equatable.dart';

class Result<T> extends Equatable {
  const Result({
    required this.loading,
    this.content,
    this.error,
  });

  final T? content;
  final bool loading;
  final Object? error;

  @override
  List<Object?> get props => [
        content,
        loading,
        error,
      ];
}
