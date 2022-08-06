import 'package:firebase_auth/firebase_auth.dart';

import '../../constants/preference_strings.dart';
import '../helpers/shared_pref.dart';

class AuthService {
  static Future<UserCredential?> login({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      Shared.setBoolean(Preference.isLoggedIn, true);
    } on FirebaseAuthException catch (_){
      rethrow;
    }
    return null;
  }

  static Future<UserCredential?> createUser({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      Shared.setBoolean(Preference.isLoggedIn, true);
    } on FirebaseAuthException catch (_){
      rethrow;
    }
    return null;
  }

}
