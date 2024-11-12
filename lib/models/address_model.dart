class AddressModel {
  String addressLine;
  String addressLine2;
  String subArea;
  String city;
  String zipCode;

  AddressModel({
    required this.addressLine,
    required this.addressLine2,
    required this.subArea,
    required this.city,
    required this.zipCode,
  });

  Map<String, dynamic> toMap() {
    return {
      'addressLine': addressLine,
      'addressLine2': addressLine2,
      'subArea': subArea,
      'city': city,
      'zipCode': zipCode,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      addressLine: map['addressLine'] as String,
      addressLine2: map['addressLine2'] as String,
      subArea: map['subArea'] as String,
      city: map['city'] as String,
      zipCode: map['zipCode'] as String,
    );
  }
}