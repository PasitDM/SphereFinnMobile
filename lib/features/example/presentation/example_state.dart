part of 'example_cubit.dart';

class ExampleState extends Equatable {
  final ExampleAction action;

  const ExampleState({
    this.action = ExampleAction.none,
  });

  ExampleState copyWith({
    ExampleAction? action,
  }) {
    return ExampleState(
      action: action ?? this.action,
    );
  }

  @override
  List<Object?> get props => [action];
}

enum ExampleAction {
  none,
  loading,
  loaded,
  error,
}
