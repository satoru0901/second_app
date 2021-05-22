import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_app/domain/book.dart';
import 'package:second_app/presentation/add_book/add_book_page.dart';
import 'package:second_app/presentation/book_list/book_list_model.dart';

class BookListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookListModel>(
      create: (_) => BookListModel()..fetchBooks(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('本一覧'),
        ),
        body: Consumer<BookListModel>(
          builder: (context, model, child) {
            final books = model.books;
            final listTiles = books
                .map((book) => ListTile(
                      title: Text(book.title),
                      trailing: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddBookPage(
                                book: book,
                              ),
                              fullscreenDialog: true,
                            ),
                          );
                          model.fetchBooks();
                        },
                      ),
                      onLongPress: () async {
                        await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('${book.title}を削除しますか？'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    //TODO:削除のAPIを叩く
                                    model.deleteBook(book);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('${book.title}を削除しました'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        model.fetchBooks();
                      },
                    ))
                .toList();
            return ListView(
              children: listTiles,
            );
          },
        ),
        floatingActionButton:
            Consumer<BookListModel>(builder: (context, model, child) {
          return FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddBookPage(),
                  fullscreenDialog: true,
                ),
              );
              model.fetchBooks();
            },
          );
        }),
      ),
    );
  }
}
