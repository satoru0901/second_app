import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpModel extends ChangeNotifier {
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

    final User user = (await auth.createUserWithEmailAndPassword(
            email: mail, password: password))
        .user;
    final email = user.email;

    FirebaseFirestore.instance.collection('users').add(
      {'email': mail, 'createdAT': Timestamp.now()},
    );
  }
}
