import 'package:flutter/material.dart';

class AuthNotifier extends ChangeNotifier {
  static final AuthNotifier instance = AuthNotifier._internal();
  AuthNotifier._internal();

  factory AuthNotifier() => instance;

  void notifyTokenCleared() {
    notifyListeners();
  }
}
