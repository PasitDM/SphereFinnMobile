import 'package:equatable/equatable.dart';

import '../../../core/state/app_cubit.dart';

part 'example_state.dart';

class ExampleCubit extends AppCubit<ExampleState> {
  ExampleCubit() : super(const ExampleState());

  @override
  void init({Object? arguments}) {}

  @override
  void clear() {
    emit(const ExampleState());
  }
}
