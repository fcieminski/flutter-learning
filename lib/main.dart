import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: '1', title: 'Pc', amount: 1450.30, time: DateTime.now()),
    Transaction(id: '2', title: 'Shoes', amount: 150, time: DateTime.now()),
    Transaction(
        id: '3', title: 'Groceries', amount: 98.40, time: DateTime.now()),
  ];

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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            child: Container(
              child: Text("hello"),
              width: double.infinity,
              height: 100,
            ),
            elevation: 5,
          ),
          Card(
            child: Container(
              child: Text('hello2'),
              width: double.infinity,
              height: 100,
            ),
            elevation: 5,
          ),
          Column(
            children: transactions.map((transaction) {
              return Card(child: Text(transaction.title));
            }).toList(),
          )
        ],
      ),
    );
  }
}
