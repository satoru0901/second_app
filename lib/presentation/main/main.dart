import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_app/presentation/main/main_model.dart';
import '../book_list/book_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String loginName;
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainModel>(
      create: (_) => MainModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Consumer<MainModel>(builder: (context, model, child) {
          return Center(
            child: Column(
              children: [
                TextField(
                  controller: myController,
                  decoration: InputDecoration(hintText: '名前を入力してください'),
                ),
                Image.network(
                    'https://pbs.twimg.com/profile_images/1380745914566893570/meBTLODJ_400x400.jpg'),
                RaisedButton(
                  child: Text('入力完了'),
                  onPressed: () {
                    model.changeKboyText(myController.text);
                  },
                ),
                Text('あなたは  ' + model.kboyText + '  ですね？'),
                RaisedButton(
                    child: Text('次へ'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BookListPage()),
                      );
                    }),
              ],
            ),
          );
        }),
      ),
    );
  }
}
