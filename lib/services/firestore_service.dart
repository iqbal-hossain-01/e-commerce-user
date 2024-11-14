import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_user_app/models/card_model.dart';


class FirestoreService {
  FirestoreService._();

  static final _firestore = FirebaseFirestore.instance;
  static const String _collectionCategory = 'Categories';
  static const String _collectionProduct = 'Products';
  static const String _collectionUser = 'Users';
  static const String _collectionCart = 'MyCart';


  static Future<void> addToCart(CartModel cart, String uid) {
    return _firestore.collection(_collectionUser)
        .doc(uid)
        .collection(_collectionCart)
        .doc(cart.productId)
        .set(cart.toMap());
  }

  static Future<void> updateCartQuantity(String pid, String uid, int updatedQuantity) {
    return _firestore.collection(_collectionUser)
        .doc(uid)
        .collection(_collectionCart)
        .doc(pid)
        .update({'quantity': updatedQuantity});
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> fetchCartByUser(String uid)
  => _firestore.collection(_collectionUser)
      .doc(uid)
      .collection(_collectionCart)
      .snapshots();
  static Future<void> removeFromCart(String pid, String uid) {
    return _firestore
        .collection(_collectionUser)
        .doc(uid)
        .collection(_collectionCart)
        .doc(pid).delete();
  }


  static Stream<QuerySnapshot<Map<String, dynamic>>> fetchCategories() =>
      _firestore.collection(_collectionCategory).orderBy('name').snapshots();


  static Future<void> updateSingleProductField(String id, String field,
      dynamic value) {
    return _firestore.collection(_collectionProduct)
        .doc(id)
        .update({field: value});
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> fetchProducts() =>
      _firestore.collection(_collectionProduct).snapshots();

}