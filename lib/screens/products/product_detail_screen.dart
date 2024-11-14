import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_user_app/providers/product_provider.dart';
import 'package:e_commerce_user_app/utils/helper_functions.dart';
import 'package:e_commerce_user_app/widgets/loading_indicator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  static const String routeName = '/product-details/:id';

  const ProductDetailScreen({super.key});

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  late String productId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    productId = GoRouter.of(context).state!.pathParameters['id']!;
  }

  @override
  Widget build(BuildContext context) {
    final productAsyncValue = ref.watch(singleProductProvider(productId));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: productAsyncValue.when(
        data: (product) {
          return ListView(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CachedNetworkImage(
                        width: 150,
                        height: 150,
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
                    for (var imageUrl in product.additionalImages)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CachedNetworkImage(
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                          imageUrl: imageUrl,
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
                  ],
                ),
              ),
              ListTile(
                tileColor: Colors.grey.withOpacity(0.1),
                title: SelectableText('Description: ${product.description}'),
              ),
              ListTile(
                title: SelectableText(product.productName),
              ),
              ListTile(
                tileColor: Colors.grey.withOpacity(0.1),
                title: Text('Category: ${product.categoryModel.name}'),
              ),
              ListTile(
                title: Text('Brand: ${product.brand}'),
              ),
              ListTile(
                tileColor: Colors.grey.withOpacity(0.1),
                title: Text('Price: ${product.price}'),
              ),
              if (product.discount > 0)
                ListTile(
                  title: Text('Discount: ${product.discount}%'),
                ),
                if (product.discount > 0)
                  ListTile(
                    tileColor: Colors.grey.withOpacity(0.1),
                    title:
                    Text('Price after discount: ${product.priceAfterDiscount}'),
                  ),
              ListTile(
                title: Text('Stock: ${product.stock}'),
              ),
              ListTile(
                tileColor: Colors.grey.withOpacity(0.1),
                title: Wrap(
                  children: [
                    const Text('Product Sizes: '),
                    for (var size in product.sizes) Text('$size '),
                  ],
                ),
              ),
              ListTile(
                title: Wrap(
                  children: [
                    const Text('Product Colors: '),
                    for (var color in product.colors) Text('$color '),
                  ],
                ),
              ),
            ],
          );
        },
        error: (error, stackTrace) => Center(
          child: Text('Error loading product: $error'),
        ),
        loading: () => const Center(
          child: LoadingIndicator(),
        ),
      ),
    );
  }
}
