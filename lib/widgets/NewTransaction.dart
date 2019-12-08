import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final inputTitle = TextEditingController();
  final inputAmout = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            labelText: 'tytuł',
          ),
        ),
        TextField(
          keyboardType: TextInputType.numberWithOptions(),
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
          onPressed: () {
            // transactions.add(new Transaction(
            //     title: titleInput,
            //     id: '3',
            //     amount: double.parse(amountInput),
            //     time: DateTime.now()));
          },
        ),
      ],
    );
  }
}
