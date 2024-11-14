import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_user_app/models/card_model.dart';
import 'package:e_commerce_user_app/utils/constants.dart';
import 'package:e_commerce_user_app/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';

class CartItemView extends StatelessWidget {
  const CartItemView({
    super.key,
    required this.cart,
    required this.onAddButtonClicked,
    required this.onRemoveButtonClicked,
    required this.onDelete,
  });

  final CartModel cart;
  final VoidCallback onAddButtonClicked;
  final VoidCallback onRemoveButtonClicked;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: CachedNetworkImage(
                width: 75,
                height: 75,
                fit: BoxFit.cover,
                imageUrl: cart.image,
                placeholder: (context, url) => const Center(
                  child: LoadingIndicator(),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(
                    Icons.error_outline,
                    size: 50,
                  ),
                ),
                fadeInCurve: Curves.bounceInOut,
                fadeInDuration: const Duration(milliseconds: 1000),
              ),
              title: Text(
                cart.productName,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              trailing: Text('$currency${cart.price}'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: onRemoveButtonClicked,
                    icon: const Icon(Icons.remove_circle_outline),
                  ),
                  Text(
                    '${cart.quantity}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  IconButton(
                    onPressed: onAddButtonClicked,
                    icon: const Icon(Icons.add_circle_outline),
                  ),
                  const Spacer(),
                  Text(
                    '$currency${cart.totalPrice}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    onPressed: onDelete,
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
