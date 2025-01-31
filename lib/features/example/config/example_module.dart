import '../../../core/api/api_config.dart';
import '../../../core/module/app_base_module.dart';
import '../../../di/app_module.dart';
import '../data/repositories/mock_example_repository.dart';
import '../data/repositories/remote_example_repository.dart';
import '../domain/repositories/example_repository.dart';

/// ต้องไปเพิ่มใน app_module.dart
class ExampleModule with AppBaseModule {
  @override
  void provideModule() {
    if (ApiConfig.shouldMockResponse) {
      appModule.registerLazySingleton<ExampleRepository>(
        () {
          return MockExampleRepository();
        },
      );
    } else {
      appModule.registerLazySingleton<ExampleRepository>(
        () {
          return RemoteExampleRepository(dio: appModule.get());
        },
      );
    }
  }
}
