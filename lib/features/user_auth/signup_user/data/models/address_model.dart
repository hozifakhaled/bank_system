class AddressModel {
  final String city;
  final String zipCode;

  AddressModel({
    required this.city,
    required this.zipCode,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      city: json['city'],
      zipCode: json['zipCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city': city,
      'zipCode': zipCode,
    };
  }
}
