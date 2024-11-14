import 'package:e_commerce_user_app/providers/auth_provider.dart';
import 'package:e_commerce_user_app/screens/auth/login_screen.dart';
import 'package:e_commerce_user_app/screens/products/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeDrawer extends ConsumerWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: Column(
        children: [
          // Header section with user info and app logo
          const UserAccountsDrawerHeader(
            accountName: Text("User Name"),
            accountEmail: Text("user@example.com"),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
            ),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              /*
              image: DecorationImage(
                image: AssetImage('assets/images/app_logo.png'), // App logo placeholder
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3),
                  BlendMode.darken,
                ),
              ),

               */
            ),
          ),
          // Drawer items
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Cart'),
            onTap: () {
              context.pushNamed(CartPage.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.list_alt),
            title: const Text('Orders'),
            onTap: () {
              // Navigate to Orders page
              Navigator.pushNamed(context, '/orders');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              // Navigate to Profile page
              Navigator.pushNamed(context, '/profile');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About App'),
            onTap: () {
              // Navigate to About App page
              Navigator.pushNamed(context, '/about');
            },
          ),
          const Spacer(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              ref.read(firebaseAuthProvider.notifier).logout().then((_){
                context.pushReplacementNamed(LoginScreen.routeName);
              });
            },
          ),
        ],
      ),
    );
  }
}

