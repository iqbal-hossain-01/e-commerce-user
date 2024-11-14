import 'package:e_commerce_user_app/models/card_model.dart';
import 'package:e_commerce_user_app/models/product_model.dart';
import 'package:e_commerce_user_app/services/firestore_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends StateNotifier<AsyncValue<List<CartModel>>> {
  CartNotifier() : super(const AsyncValue.loading());

  List<CartModel> cartList = [];

  int get totalItemsInCart => cartList.length;

  bool isProductInCart(String pid) {
    bool tag = false;
    for (final cart in cartList) {
      if (cart.productId == pid) {
        tag = true;
        break;
      }
    }
    return tag;
  }

  double get getCartSubTotal {
    double total = 0;
    for (final cart in cartList) {
      total += cart.totalPrice!;
    }
    return total;
  }

  Future<void> increaseCartQuantity(String uid, CartModel cart) {
    final newQuantity = cart.quantity + 1;
    return FirestoreService.updateCartQuantity(cart.productId, uid, newQuantity);
  }
  Future<void> decreaseCartQuantity(String uid, CartModel cart) async {
    if (cart.quantity > 1) {
      final newQuantity = cart.quantity - 1;
      await FirestoreService.updateCartQuantity(cart.productId, uid, newQuantity);
    }
  }

  Future<void> addProductToCart(ProductModel product, String uid) {
    final cart = CartModel(
      productId: product.id!,
      productName: product.productName,
      image: product.imageUrl!,
      price: product.priceAfterDiscount.toDouble(),
    );
    return FirestoreService.addToCart(cart, uid);
  }

  Future<void> removeFromCart(String pid, String uid) {
    return FirestoreService.removeFromCart(pid, uid);
  }

  Future<void> getAllCartItemsByUser(String uid) async {
    try {
      FirestoreService.fetchCartByUser(uid).listen((snapshot) {
        cartList = List.generate(snapshot.docs.length,
            (index) => CartModel.fromMap(snapshot.docs[index].data()));
        state = AsyncValue.data(cartList);
      });
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

final cartProvider =
    StateNotifierProvider<CartNotifier, AsyncValue<List<CartModel>>>(
        (ref) => CartNotifier());

