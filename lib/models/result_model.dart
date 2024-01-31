class ResultModel {
  final String? idCardNumber;
  final String firstName;
  final String lastName;
  final String province;
  final String city;
  final String district;
  final String village;

  ResultModel({
    required this.idCardNumber,
    required this.firstName,
    required this.lastName,
    required this.province,
    required this.city,
    required this.district,
    required this.village,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      idCardNumber: json['idCardNumber'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      province: json['province'],
      city: json['city'],
      district: json['district'],
      village: json['village'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idCardNumber': idCardNumber,
      'firstName': firstName,
      'lastName': lastName,
      'province': province,
      'city': city,
      'district': district,
      'village': village,
    };
  }
}
