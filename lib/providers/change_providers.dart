import 'package:flutter/material.dart';

class ChangeState extends ChangeNotifier {
  bool _isUpwardkeyPressed = false;
   bool get isUpwardkeyPressed => _isUpwardkeyPressed;
  void upwardPress() {
    _isUpwardkeyPressed = true;
    notifyListeners();
  }

}
