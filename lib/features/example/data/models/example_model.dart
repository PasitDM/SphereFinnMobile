class ExampleModel {
  String? exampleField1;
  bool? exampleField2;
  num? exampleField3;

  ExampleModel({
    this.exampleField1,
    this.exampleField2,
    this.exampleField3,
  });

  factory ExampleModel.fromJson(Map<String, dynamic> json) {
    return ExampleModel(
      exampleField1: json['exampleField1'] as String?,
      exampleField2: json['exampleField2'] as bool?,
      exampleField3: json['exampleField3'] as num?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exampleField1': exampleField1,
      'exampleField2': exampleField2,
      'exampleField3': exampleField3,
    };
  }
}
