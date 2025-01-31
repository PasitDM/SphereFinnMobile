import 'package:dio/dio.dart';

import '../../domain/repositories/example_repository.dart';
import '../models/example_model.dart';

class RemoteExampleRepository implements ExampleRepository {
  final Dio dio;
  final String apiPath = "example";

  RemoteExampleRepository({required this.dio});

  @override
  Future<bool> exampleFunction({required String exField}) async {
    return true;
  }

  @override
  Future<ExampleModel> getExampleFunctionModel() async {
    final response = await dio.post('$apiPath/ex');
    throw ExampleModel.fromJson(response.data);
  }
}
