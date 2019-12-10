import 'package:flutter/material.dart';
import 'package:mobile_app/models/transaction.dart';
import 'package:mobile_app/widgets/NewTransaction.dart';
import 'package:mobile_app/widgets/TransactionsList.dart';
import './widgets/UserTransaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> _transactions = [
    Transaction(id: '1', title: 'Pc', amount: 1450.35, time: DateTime.now()),
    Transaction(id: '2', title: 'Shoes', amount: 150, time: DateTime.now()),
    Transaction(
        id: '3', title: 'Groceries', amount: 98.45, time: DateTime.now()),
    Transaction(
        id: '3', title: 'Groceries', amount: 98.45, time: DateTime.now()),
    Transaction(
        id: '3', title: 'Groceries', amount: 98.45, time: DateTime.now()),
    Transaction(
        id: '3', title: 'Groceries', amount: 98.45, time: DateTime.now()),
    Transaction(
        id: '3', title: 'Groceries', amount: 98.45, time: DateTime.now()),
    Transaction(
        id: '3', title: 'Groceries', amount: 98.45, time: DateTime.now()),
    Transaction(
        id: '3', title: 'Groceries', amount: 98.45, time: DateTime.now()),
    Transaction(
        id: '3', title: 'Groceries', amount: 98.45, time: DateTime.now()),
    Transaction(
        id: '3', title: 'Groceries', amount: 98.45, time: DateTime.now()),
  ];

  void _addTransaction(String title, double amount) {
    setState(() {
      _transactions.add(new Transaction(
        id: DateTime.now().toString(),
        time: DateTime.now(),
        title: title,
        amount: amount,
      ));
    });
  }

  void modalNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (_) => NewTransaction(_addTransaction));
  }

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
              children: <Widget>[
                Column(
                  children: <Widget>[
                    NewTransaction(_addTransaction),
                    TransactionsList(_transactions),
                  ],
                ),
              ],
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
