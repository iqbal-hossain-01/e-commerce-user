
import 'package:e_commerce_user_app/screens/auth/launcher_screen.dart';
import 'package:e_commerce_user_app/screens/auth/login_screen.dart';
import 'package:e_commerce_user_app/screens/products/cart_page.dart';
import 'package:e_commerce_user_app/screens/products/product_detail_screen.dart';
import 'package:e_commerce_user_app/screens/products/product_list_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter{
  AppRouter._();
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: LauncherScreen.routeName,
        builder: (context, state) => const LauncherScreen(),
      ),
      GoRoute(
        path: LoginScreen.routeName,
        name: LoginScreen.routeName,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: ProductListScreen.routeName,
        path: ProductListScreen.routeName,
        builder: (context, state) => const ProductListScreen(),
      ),
      GoRoute(
        name: ProductDetailScreen.routeName,
        path: ProductDetailScreen.routeName,
        builder: (context, state) => const ProductDetailScreen(),
      ),
      GoRoute(
        name: CartPage.routeName,
        path: CartPage.routeName,
        builder: (context, state) => const CartPage(),
      ),
    ]
  );
}