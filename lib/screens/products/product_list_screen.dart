
import 'package:e_commerce_user_app/providers/auth_provider.dart';
import 'package:e_commerce_user_app/providers/cart_provider.dart';
import 'package:e_commerce_user_app/providers/category_provider.dart';
import 'package:e_commerce_user_app/providers/product_provider.dart';
import 'package:e_commerce_user_app/screens/products/product_detail_screen.dart';
import 'package:e_commerce_user_app/widgets/card_badge.dart';
import 'package:e_commerce_user_app/widgets/hero_layout_card.dart';
import 'package:e_commerce_user_app/widgets/home_drawer.dart';
import 'package:e_commerce_user_app/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProductListScreen extends ConsumerWidget {
  static const String routeName = '/allProduct';

  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Data fetch only once outside build method
    ref.read(productProvider.notifier).getProducts();
    ref.read(categoryProvider.notifier).getCategories();
    ref.read(cartProvider.notifier).getAllCartItemsByUser(ref.read(firebaseAuthProvider.notifier).currentUser!.uid);
    // Watching product and category state
    final productList = ref.watch(productProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Product'),
        actions: [
          CartBadge(totalItemInCart: ref.read(cartProvider.notifier).totalItemsInCart),
        ],
      ),
      drawer: const HomeDrawer(),
      body: productList.when(
        data: (products) {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 2,
                childAspectRatio: 0.65,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return InkWell(
                  child: GirdViewItem(product: product),
                  onTap: () => context.pushNamed(
                    ProductDetailScreen.routeName,
                    pathParameters: {'id': product.id.toString()},
                  ),
                );
              });
        },
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
        loading: () => const Center(
          child: LoadingIndicator(),
        ),
      ),
    );
  }
}
