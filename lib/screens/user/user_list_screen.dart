import 'package:flutter/material.dart';

class UserListScreen extends StatelessWidget {
  static const String routeName = '/user-list';
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
    );
  }
}
