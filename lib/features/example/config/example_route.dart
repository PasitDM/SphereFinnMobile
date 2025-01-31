import '../presentation/example_screen.dart';

/// ต้องไปเพิ่มใน app_route.dart
class ExampleRoute {
  static const example = '/example';

  static final screens = {
    example: (context) => const ExampleScreen(),
  };
}
