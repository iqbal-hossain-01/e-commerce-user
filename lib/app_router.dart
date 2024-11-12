
import 'package:e_commerce_user_app/screens/auth/launcher_screen.dart';
import 'package:e_commerce_user_app/screens/auth/login_screen.dart';
import 'package:e_commerce_user_app/screens/categories/category_list_screen.dart';
import 'package:e_commerce_user_app/screens/orders/order_list_screen.dart';
import 'package:e_commerce_user_app/screens/products/product_detail_screen.dart';
import 'package:e_commerce_user_app/screens/products/product_list_screen.dart';
import 'package:e_commerce_user_app/screens/user/user_list_screen.dart';
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
        name: CategoryListScreen.routeName,
        path: CategoryListScreen.routeName,
        builder: (context, state) => const CategoryListScreen(),
      ),
      GoRoute(
        name: ProductDetailScreen.routeName,
        path: ProductDetailScreen.routeName,
        builder: (context, state) => const ProductDetailScreen(),
      ),
      GoRoute(
        name: OrderListScreen.routeName,
        path: OrderListScreen.routeName,
        builder: (context, state) => const OrderListScreen(),
      ),
      GoRoute(
        name: UserListScreen.routeName,
        path: UserListScreen.routeName,
        builder: (context, state) => const UserListScreen(),
      ),
    ]
  );
}