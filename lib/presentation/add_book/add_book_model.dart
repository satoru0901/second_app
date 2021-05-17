import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddBookModel extends ChangeNotifier {
  String bookTitle = '';
  Future addBookToFirestore() async {
    if (bookTitle.isEmpty) {
      throw ('タイトルを入力してください');
    }
    Firestore.instance.collection('books').add(
      {
        'title': bookTitle,
      },
    );
  }
}
