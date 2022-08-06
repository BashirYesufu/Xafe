import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier{
  String _name = '';
  String get name => _name;
  setName(String newName) {
    _name = newName;
    notifyListeners();
  }

  String _email = '';
  String get email => _email;
  setEmail(String newEmail){
    _email = newEmail;
    notifyListeners();
  }

}