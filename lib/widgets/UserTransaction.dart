import 'package:flutter/material.dart';
import 'package:mobile_app/models/transaction.dart';
import './NewTransaction.dart';
import './TransactionsList.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addTransaction),
        TransactionsList(_transactions),
      ],
    );
  }
}
