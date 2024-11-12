
import 'package:e_commerce_user_app/models/user_model.dart';

class CommentModel {
  String? commentId;
  UserModel userModel;
  String productId;
  String comment;
  bool approved;
  DateTime createdAt;
  DateTime? updatedAt;
  int likes;
  int dislikes;
  List<CommentModel>? replies;
  bool reported;
  String? replyToUserId;
  double? rating;

  CommentModel({
    this.commentId,
    required this.userModel,
    required this.productId,
    required this.comment,
    required this.approved,
    required this.createdAt,
    this.updatedAt,
    this.likes = 0,
    this.dislikes = 0,
    this.replies,
    this.reported = false,
    this.replyToUserId,
    this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'commentId': commentId,
      'userModel': userModel.toMap(), // Assuming UserModel has a toMap method
      'productId': productId,
      'comment': comment,
      'approved': approved,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'likes': likes,
      'dislikes': dislikes,
      'replies': replies?.map((reply) => reply.toMap()).toList(),
      'reported': reported,
      'replyToUserId': replyToUserId,
      'rating': rating,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      commentId: map['commentId'],
      userModel: UserModel.fromMap(map['userModel']), // Assuming UserModel has a fromMap method
      productId: map['productId'],
      comment: map['comment'],
      approved: map['approved'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: map['updatedAt'] != null ? DateTime.parse(map['updatedAt']) : null,
      likes: map['likes'] ?? 0,
      dislikes: map['dislikes'] ?? 0,
      replies: map['replies'] != null
          ? List<CommentModel>.from(map['replies'].map((reply) => CommentModel.fromMap(reply)))
          : null,
      reported: map['reported'] ?? false,
      replyToUserId: map['replyToUserId'],
      rating: map['rating']?.toDouble(),
    );
  }
}