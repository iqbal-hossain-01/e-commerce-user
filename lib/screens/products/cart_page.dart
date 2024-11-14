import 'package:e_commerce_user_app/providers/auth_provider.dart';
import 'package:e_commerce_user_app/providers/cart_provider.dart';
import 'package:e_commerce_user_app/widgets/cart_item_view.dart';
import 'package:e_commerce_user_app/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends ConsumerWidget {
  static const String routeName = '/my-cart';

  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartList = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: cartList.when(
        data: (carts) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: carts.length,
                  itemBuilder: (context, index) {
                    final cart = carts[index];
                    return CartItemView(
                      cart: cart,
                      onAddButtonClicked: () {
                        ref.read(cartProvider.notifier).increaseCartQuantity(
                            ref
                                .read(firebaseAuthProvider.notifier)
                                .currentUser!
                                .uid,
                            cart);
                      },
                      onRemoveButtonClicked: () {
                        ref.read(cartProvider.notifier).decreaseCartQuantity(
                            ref
                                .read(firebaseAuthProvider.notifier)
                                .currentUser!
                                .uid,
                            cart);
                      },
                      onDelete: () {
                        ref.read(cartProvider.notifier).removeFromCart(cart.productId,
                            ref.read(firebaseAuthProvider.notifier).currentUser!.uid);
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  height: 80,
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Subtotal: ${ref.read(cartProvider.notifier).getCartSubTotal}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        error: (err, stackTrace) => Center(
          child: Text('Error: $err'),
        ),
        loading: () => const Center(
          child: LoadingIndicator(),
        ),
      ),
    );
  }
}
