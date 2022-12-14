import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:xafe/models/category_model.dart';
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

  static Future createCategory(CategoryModel category) async {
    final docUser = FirebaseFirestore.instance.collection('expenses').doc(category.id);

    final json = {
      'name': category.name,
      'emoji': category.emoji,
      'time': category.time,
    };

    await docUser.set(json);
  }

  static Future signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Shared.setBoolean(Preference.isLoggedIn, false);
    } on FirebaseAuthException catch (_){
      rethrow;
    }
  }

  // static Future<List<CategoryModel>> getCategories() async {
  //   QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('categories').get();
  //   List<CategoryModel> models = [];
  //   final List<QueryDocumentSnapshot<Object?>> allData = querySnapshot.docs;
  //   allData.forEach((data) {
  //     print(data);
  //   });
  //   return models;
  // }
}
