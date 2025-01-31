import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/example/config/example_provider.dart';

class AppProvider {
  final List<BlocProvider> _provider = [];

  AppProvider() {
    _provider
      ..addAll(ExProvider().providers)
      ..addAll(ExampleProvider().providers);
  }

  List<BlocProvider<StateStreamableSource<Object?>>> get provider => _provider;
}
