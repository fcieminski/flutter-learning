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
    Transaction(id: '1', title: 'Pc', amount: 1450.35, time: DateTime.now()),
    Transaction(id: '2', title: 'Shoes', amount: 150, time: DateTime.now()),
    Transaction(
        id: '3', title: 'Groceries', amount: 98.45, time: DateTime.now()),
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
        children: <Widget>[
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: 'tytuł',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'kwota',
                  ),
                ),
                FlatButton(
                  child: Text(
                    'Zapisz',
                  ),
                  color: Colors.orangeAccent,
                  textColor: Colors.white,
                  onPressed: () {},
                )
              ],
            ),
          ),
          Column(
            children: transactions.map((transaction) {
              return Container(
                child: Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.orangeAccent,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          '${transaction.amount} zł',
                          style: TextStyle(
                            color: Colors.orangeAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Text(
                                transaction.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                '${transaction.time.month}.${transaction.time.year} ${transaction.time.hour}:${transaction.time.minute}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black45,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
