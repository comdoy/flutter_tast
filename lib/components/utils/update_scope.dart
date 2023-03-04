import 'package:flutter/material.dart';

/// 有时候就只是想单纯的刷新一下
class UpdateScope with ChangeNotifier {
  void update() {
    notifyListeners();
  }
}
