import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:xafe/models/expense.dart';

import '../../constants/preference_strings.dart';
import '../helpers/shared_pref.dart';

class FirebaseService {
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

  static Future createExpense(Expense expense) async {
    final docUser = FirebaseFirestore.instance.collection('expenses').doc(expense.id);

    final json = {
      'amount': expense.amount,
      'category': expense.category,
      'date': expense.date,
      'interval': expense.interval,
      'name': expense.name
    };

    await docUser.set(json);
  }
}
