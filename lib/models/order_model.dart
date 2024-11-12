

import 'package:e_commerce_user_app/models/address_model.dart';
import 'package:e_commerce_user_app/models/card_model.dart';
import 'package:e_commerce_user_app/models/date_model.dart';
import 'package:e_commerce_user_app/models/order_settings_model.dart';
import 'package:e_commerce_user_app/models/user_model.dart';

class OrderModel {
  String? orderId;
  DateModel dateModel;
  UserModel userModel;
  String orderStatus;
  double grandTotal;
  AddressModel deliveryAddress;
  OrderSettingsModel orderSettingsModel;
  String? additionalInfo;
  List<CartModel> cartList;

  String paymentMethod;
  String? transactionId;
  bool isPaid;
  DateTime? deliveryDate;
  String? trackingNumber;
  String? orderType;

  OrderModel({
    this.orderId,
    required this.dateModel,
    required this.userModel,
    required this.orderStatus,
    required this.grandTotal,
    required this.deliveryAddress,
    required this.orderSettingsModel,
    this.additionalInfo,
    required this.cartList,
    required this.paymentMethod,
    this.transactionId,
    this.isPaid = false,
    this.deliveryDate,
    this.trackingNumber,
    this.orderType,
  });

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'dateModel': dateModel.toMap(),
      'userModel': userModel.toMap(),
      'orderStatus': orderStatus,
      'grandTotal': grandTotal,
      'deliveryAddress': deliveryAddress.toMap(),
      'orderSettingsModel': orderSettingsModel.toMap(),
      'additionalInfo': additionalInfo,
      'cartList': cartList.map((cart) => cart.toMap()).toList(),
      'paymentMethod': paymentMethod,
      'transactionId': transactionId,
      'isPaid': isPaid,
      'deliveryDate': deliveryDate?.toIso8601String(),
      'trackingNumber': trackingNumber,
      'orderType': orderType,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      orderId: map['orderId'],
      dateModel: DateModel.fromMap(map['dateModel']),
      userModel: UserModel.fromMap(map['userModel']),
      orderStatus: map['orderStatus'],
      grandTotal: map['grandTotal']?.toDouble() ?? 0.0,
      deliveryAddress: AddressModel.fromMap(map['deliveryAddress']),
      orderSettingsModel: OrderSettingsModel.fromMap(map['orderSettingsModel']),
      additionalInfo: map['additionalInfo'],
      cartList: (map['cartList'] as List)
          .map((cart) => CartModel.fromMap(cart))
          .toList(),
      paymentMethod: map['paymentMethod'],
      transactionId: map['transactionId'],
      isPaid: map['isPaid'] ?? false,
      deliveryDate: map['deliveryDate'] != null
          ? DateTime.parse(map['deliveryDate'])
          : null,
      trackingNumber: map['trackingNumber'],
      orderType: map['orderType'],
    );
  }
}
