import 'package:e_commerce_user_app/screens/products/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartBadge extends StatelessWidget {
  const CartBadge({
    super.key,
    required this.totalItemInCart,
  });

  final int totalItemInCart;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(CartPage.routeName),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const Icon(
              Icons.shopping_cart_outlined,
              size: 30,
            ),
            if (totalItemInCart > 0)
              Positioned(
              top: -5,
              left: -5,
              child: Container(
                width: 20.0,
                height: 20.0,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  totalItemInCart.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
