
import 'package:e_commerce_user_app/providers/auth_provider.dart';
import 'package:e_commerce_user_app/screens/products/product_list_screen.dart';
import 'package:e_commerce_user_app/utils/constants.dart';
import 'package:e_commerce_user_app/utils/helper_functions.dart';
import 'package:e_commerce_user_app/widgets/custom_button.dart';
import 'package:e_commerce_user_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TheBEST'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const FlutterLogo(size: 50),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text('Log in', style: Theme.of(context).textTheme.headlineLarge,),
                  ),
                  CustomTextField(
                      controller: _emailController,
                      labelText: ' Email',
                      prefixIcon: const Icon(Icons.email),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email';
                        }
                        if (!RegExp(
                                r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      }),
                  const SizedBox(height: 16),
                  CustomTextField(
                      controller: _passwordController,
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.password),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      }),
                  const SizedBox(height: 24),
                  CustomButton(text: 'Log in', onPressed: () {
                    _authentication(true);
                  }),
                  CustomButton(text: 'Register', onPressed: () {
                    _authentication(false);
                  }),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    _error,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _authentication(bool isLogin) async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;
      EasyLoading.show(
        status: 'Please wait...',
        maskType: EasyLoadingMaskType.black
      );
      configLoading();
      try {
        if (isLogin) {
          await ref.read(firebaseAuthProvider.notifier).loginUser(email, password);
        } else {
          await ref.read(firebaseAuthProvider.notifier).registerUser(email, password);
        }
        EasyLoading.dismiss();
        context.pushReplacementNamed(ProductListScreen.routeName);
      } catch (err) {
        EasyLoading.dismiss();
        EasyLoading.showError(err.toString());
      } finally {
        EasyLoading.dismiss();
      }

    }
  }
}
