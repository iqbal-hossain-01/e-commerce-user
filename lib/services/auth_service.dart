import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_user_app/models/user_model.dart';

class FirebaseAuthService {
  FirebaseAuthService._();
  static final FirebaseFirestore _firestoreAuth = FirebaseFirestore.instance;
  static const String _collectionUser = 'Users';

  static Future<void> addNewUser(UserModel user) {
    return _firestoreAuth.collection(_collectionUser)
        .doc(user.uid)
        .set(user.toMap());
  }

}
