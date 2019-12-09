import 'package:flutter/material.dart';
import './widgets/UserTransaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New App'),
        elevation: 5,
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[UserTransactions()],
            ),
          ),
          FloatingActionButton(
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
