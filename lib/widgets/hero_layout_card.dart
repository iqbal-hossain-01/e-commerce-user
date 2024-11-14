import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_user_app/models/product_model.dart';
import 'package:e_commerce_user_app/utils/constants.dart';
import 'package:e_commerce_user_app/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';

class GirdViewItem extends StatelessWidget {
  const GirdViewItem({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    //final double width = MediaQuery.sizeOf(context).width;
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: CachedNetworkImage(
              height: 200,
              fit: BoxFit.cover,
              imageUrl: product.imageUrl!,
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
          ),
          Text(
            product.productName,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
          ),
          if (product.discount > 0)
            RichText(
              text: TextSpan(
                text: '$currency${product.price}',
                style: const TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.lineThrough,
                ),
              ),

            ),
          Text(
            'Price: $currency${product.priceAfterDiscount}',
            overflow: TextOverflow.clip,
            softWrap: false,
          ),

          ElevatedButton(onPressed: () {}, child: const Text('Buy'),),
          ElevatedButton(onPressed: () {}, child: Text('Add to Cart'),),
        ],
      ),
    );
  }
}