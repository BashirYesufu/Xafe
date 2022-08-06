import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static Future login({required String email, required String password}) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(), password: password.trim());
  }
}
