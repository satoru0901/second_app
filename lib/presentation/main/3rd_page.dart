import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  ThirdPage(this.name);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text(name+'のpage'),
      ),
      body: Center(
         child: RaisedButton(
            child: Text(name),
               onPressed: () {
              Navigator.pop(context);
           }
        ),
      ),
    );
  }

}