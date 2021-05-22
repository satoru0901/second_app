import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  String mail = '';
  String password = '';

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future signUp() async {
    if (mail.isEmpty) {
      throw ('emailを入力してください');
    }

    if (password.isEmpty) {
      throw ('passを入力してください');
    }
    final result =
        await auth.signInWithEmailAndPassword(email: mail, password: password);
    final uid = result.user.uid;
    //TODO 端末にUIDを保存する
  }
}
