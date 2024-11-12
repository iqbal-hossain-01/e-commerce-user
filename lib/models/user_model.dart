

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_user_app/models/address_model.dart';

class UserModel {
  String uid;
  String email;
  Timestamp creationTime;
  String? name;
  String? mobile;
  AddressModel? address;
  String? imageUrl;
  List<String>? ordersId;

  UserModel({
    required this.uid,
    required this.email,
    required this.creationTime,
    this.name,
    this.mobile,
    this.address,
    this.imageUrl,
    this.ordersId,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'creationTime': creationTime,
      'name': name,
      'mobile': mobile,'address': address?.toMap(), // Convert AddressModel to map
      'imageUrl': imageUrl,
      'ordersId': ordersId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      email: map['email'] as String,
      creationTime: map['creationTime'] as Timestamp,
      name: map['name'] as String?,
      mobile: map['mobile'] as String?,
      address: map['address'] != null ? AddressModel.fromMap(map['address'] as Map<String, dynamic>) : null, // Handle AddressModel
      imageUrl: map['imageUrl'] as String?,
      ordersId: map['ordersId'] != null ? List<String>.from(map['ordersId']) : null, // Handle List<String>
    );
  }
}
