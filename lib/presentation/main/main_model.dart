

import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  String kboyText = '' ;

  void changeKboyText (String text) {
    kboyText = text ;
    notifyListeners();
  }
}