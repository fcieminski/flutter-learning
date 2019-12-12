import 'package:flutter/material.dart';
import 'package:mobile_app/models/transaction.dart';
import 'package:mobile_app/widgets/Chart.dart';
import 'package:mobile_app/widgets/NewTransaction.dart';
import 'package:mobile_app/widgets/TransactionsList.dart';

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
    Transaction(
        id: DateTime.now().toString(),
        time: DateTime.now(),
        title: 'Zupa',
        amount: 55.45),
    Transaction(
        id: DateTime.now().toString(),
        time: DateTime.now(),
        title: 'Zakupy',
        amount: 75.52)
  ];

  List<Transaction> get _recentTransactions {
    return _transactions.where((transaction) {
      return transaction.time
          .isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

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

  void _modalNewTransaction(BuildContext context) {
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
            Chart(_recentTransactions),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TransactionsList(_transactions),
                ],
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepOrange,
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () => _modalNewTransaction(context)));
  }
}
