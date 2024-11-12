

import 'package:e_commerce_user_app/models/user_model.dart';

class RatingModel {
  UserModel userModel;
  String productId;
  double rating;

  RatingModel({
    required this.userModel,
    required this.productId,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'userModel': userModel.toMap(),
      'productId': productId,
      'rating': rating,
    };
  }

  factory RatingModel.fromMap(Map<String, dynamic> map) {
    return RatingModel(
      userModel: UserModel.fromMap(map['userModel']),
      productId: map['productId'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
    );
  }
}