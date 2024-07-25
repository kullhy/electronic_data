class DataModel {
  int v0;
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  String v8;

  DataModel({
    required this.v0,
    required this.v1,
    required this.v2,
    required this.v3,
    required this.v4,
    required this.v5,
    required this.v6,
    required this.v7,
    required this.v8,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      v0: json['v0'],
      v1: json['v1'],
      v2: json['v2'],
      v3: json['v3'],
      v4: json['v4'],
      v5: json['v5'],
      v6: json['v6'],
      v7: json['v7'],
      v8: json['v8'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final DataModel otherResponse = other as DataModel;
    return v0 == otherResponse.v0 &&
        v1 == otherResponse.v1 &&
        v2 == otherResponse.v2 &&
        v3 == otherResponse.v3 &&
        v4 == otherResponse.v4 &&
        v5 == otherResponse.v5 &&
        v6 == otherResponse.v6 &&
        v7 == otherResponse.v7 &&
        v8 == otherResponse.v8;
  }

  @override
  int get hashCode => Object.hash(v0, v1, v2, v3, v4, v5, v6, v7, v8);
}
