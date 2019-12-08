import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final inputTitle = TextEditingController();
  final inputAmout = TextEditingController();
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: inputTitle,
          decoration: InputDecoration(
            labelText: 'tytuł',
          ),
        ),
        TextField(
          keyboardType: TextInputType.numberWithOptions(),
          controller: inputAmout,
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
            addTransaction(inputTitle.text, double.parse(inputAmout.text));
          },
        ),
      ],
    );
  }
}
