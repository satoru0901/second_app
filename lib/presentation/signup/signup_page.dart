import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_app/presentation/signup/signup_page_model.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mailController = TextEditingController();
    final passwordController = TextEditingController();

    return ChangeNotifierProvider<SignUpModel>(
      create: (_) => SignUpModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('SignUp'),
        ),
        body: Consumer<SignUpModel>(
          builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: mailController,
                    decoration: InputDecoration(
                        labelText: "Mail",
                        hintText: "Enter Your E-Mail Address"),
                    onChanged: (text) {
                      model.mail = text;
                    },
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        labelText: "Pass", hintText: "Enter Password"),
                    obscureText: true,
                    onChanged: (text) {
                      model.password = text;
                    },
                  ),
                  RaisedButton(
                    child: Text('登録する'),
                    onPressed: () async {
                      try {
                        await model.signUp();
                        await _showDialog(context, '登録完了');
                      } catch (e) {
                        _showDialog(context, e.toString());
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future _showDialog(
    BuildContext context,
    String title,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          actions: [
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
