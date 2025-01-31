import '../../domain/repositories/example_repository.dart';
import '../models/example_model.dart';

class MockExampleRepository implements ExampleRepository {
  MockExampleRepository();

  @override
  Future<bool> exampleFunction({required String exField}) async {
    return true;
  }

  @override
  Future<ExampleModel> getExampleFunctionModel() async {
    return ExampleModel.fromJson({
      "exampleField1": "Test",
      "exampleField2": false,
      "exampleField3": 1,
    });
  }
}
