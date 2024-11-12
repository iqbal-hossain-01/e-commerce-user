class OrderSettingsModel {
  int deliveryCharge;
  int discount;
  int vat;

  OrderSettingsModel({
    this.deliveryCharge = 0,
    this.discount = 0,
    this.vat = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'deliveryCharge': deliveryCharge,
      'discount': discount,
      'vat': vat,
    };
  }

  factory OrderSettingsModel.fromMap(Map<String, dynamic> map) {
    return OrderSettingsModel(
      deliveryCharge: map['deliveryCharge'] as int? ?? 0,
      discount: map['discount'] as int? ?? 0,
      vat: map['vat'] as int? ??0,
    );
  }
}