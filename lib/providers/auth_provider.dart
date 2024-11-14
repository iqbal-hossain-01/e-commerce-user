import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_user_app/models/user_model.dart';
import 'package:e_commerce_user_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthProvider = StateNotifierProvider<FirebaseAuthNotifier, User?>
  ((ref) {
  final auth = FirebaseAuth.instance;
  return FirebaseAuthNotifier(auth);
});

class FirebaseAuthNotifier extends StateNotifier<User?> {
  final FirebaseAuth _auth;

  FirebaseAuthNotifier(this._auth) : super(_auth.currentUser) {
    _auth.authStateChanges().listen((User? user) {
      state = user;
    });
  }

  User? get currentUser => state;

  Future<void> loginUser(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      state = credential.user;
    } catch (err) {
      throw Exception('Login failed. Please check your credentials.');
    }
  }

  Future<void> registerUser(String email, String password) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      state = credential.user;
      await FirebaseAuthService.addNewUser(UserModel(
        uid: credential.user!.uid,
        email: email,
        creationTime: Timestamp.fromDate(credential.user!.metadata.creationTime!),
      ));
    } catch (err) {
      throw Exception('Registration failed. Please try again.');
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    state = null;
  }
}

