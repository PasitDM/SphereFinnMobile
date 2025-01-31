import '../../data/models/example_model.dart';

abstract class ExampleRepository {
  Future<bool> exampleFunction({required String exField});
  Future<ExampleModel> getExampleFunctionModel();
}
