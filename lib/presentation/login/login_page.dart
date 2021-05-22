import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_app/presentation/login/login_page_model.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mailController = TextEditingController();
    final passwordController = TextEditingController();

    return ChangeNotifierProvider<LoginModel>(
      create: (_) => LoginModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('SignUp'),
        ),
        body: Consumer<LoginModel>(
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
                    child: Text('Loginする'),
                    onPressed: () async {
                      try {
                        await model.signUp();
                        await _showDialog(context, 'Login完了');
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
