class FinanceModel {
  final String code;
  final String name;
  final double rate;
  final String calculatedStr;
  final num calculated;

  FinanceModel({
    required this.code,
    required this.name,
    required this.rate,
    required this.calculatedStr,
    required this.calculated,
  });

  factory FinanceModel.fromJson(Map<String, dynamic> json) {
    return FinanceModel(
      code: json['code'] ?? '',
      name: json['name'] ?? '',
      rate: (json['rate'] as num?)?.toDouble() ?? 0.0,
      calculatedStr: json['calculatedstr'] ?? '',
      calculated: json['calculated'] ?? 0,
    );
  }
}
