import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionsList extends StatefulWidget {
  final List<Transaction> transactions;
  final Function removeTransaction;
  TransactionsList(this.transactions, this.removeTransaction);

  @override
  _TransactionsListState createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  @override
  Widget build(BuildContext context) {
    return widget.transactions.isEmpty
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.add_circle,
                color: Colors.orangeAccent,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    'Dodaj swoje wydatki',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ))
            ],
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
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
                            '${widget.transactions[index].amount.toStringAsFixed(2)} zł',
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
                                  widget.transactions[index].title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  '${widget.transactions[index].time.day}.${widget.transactions[index].time.month}, ${widget.transactions[index].time.hour}:${widget.transactions[index].time.minute}',
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
                    FlatButton(
                      child: Icon(
                        Icons.delete,
                        color: Colors.orangeAccent,
                      ),
                      onPressed: () => widget.removeTransaction(index),
                    ),
                  ],
                ),
              );
            },
            itemCount: widget.transactions.length,
            shrinkWrap: true,
          );
  }
}
