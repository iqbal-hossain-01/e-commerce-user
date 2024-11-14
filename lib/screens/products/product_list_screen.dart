import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_user_app/providers/auth_provider.dart';
import 'package:e_commerce_user_app/providers/category_provider.dart';
import 'package:e_commerce_user_app/providers/product_provider.dart';
import 'package:e_commerce_user_app/screens/auth/login_screen.dart';
import 'package:e_commerce_user_app/screens/products/product_detail_screen.dart';
import 'package:e_commerce_user_app/widgets/hero_layout_card.dart';
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
    // Watching product and category state
    final productList = ref.watch(productProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Product'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(firebaseAuthProvider.notifier).logout().then((_) {
                context.pushReplacementNamed(LoginScreen.routeName);
              });
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
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
              return GirdViewItem(product: product);
            },

          );
        },
        error: (error, stackTrace) =>
            Center(
              child: Text('Error: $error'),
            ),
        loading: () =>
        const Center(
          child: LoadingIndicator(),
        ),
      ),
    );
  }
}
