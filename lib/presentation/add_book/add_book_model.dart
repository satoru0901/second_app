import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:second_app/domain/book.dart';

class AddBookModel extends ChangeNotifier {
  String bookTitle = '';
  Future addBookToFirestore() async {
    if (bookTitle.isEmpty) {
      throw ('タイトルを入力してください');
    }
    Firestore.instance.collection('books').add(
      {'title': bookTitle, 'createdAT': Timestamp.now()},
    );
  }

  Future updateBook(Book book) async {
    final document =
        Firestore.instance.collection('books').document(book.documentID);
    await document.updateData(
      {'title': bookTitle, 'updateAT': Timestamp.now()},
    );
  }
}
