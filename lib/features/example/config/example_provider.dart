import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/example_cubit.dart';

/// ต้องไปเพิ่มใน app_provider.dart
class ExampleProvider {
  final List<BlocProvider> providers = [
    BlocProvider<ExampleCubit>(
      create: (BuildContext context) => ExampleCubit(),
    ),
  ];
}
