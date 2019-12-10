import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;
  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final inputTitle = TextEditingController();
  final inputAmout = TextEditingController();

  void submitForm() {
    final title = inputTitle.text;
    final amount = double.parse(inputAmout.text);

    if (title.isEmpty || amount is! double || amount <= 0) {
      return;
    }

    widget.addTransaction(title, amount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: inputTitle,
              decoration: InputDecoration(
                labelText: 'tytuł',
              ),
              onSubmitted: (_) => submitForm(),
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(),
              controller: inputAmout,
              decoration: InputDecoration(
                labelText: 'kwota',
              ),
              onSubmitted: (_) => submitForm(),
            ),
            FlatButton(
              child: Text(
                'Zapisz',
              ),
              color: Colors.orangeAccent,
              textColor: Colors.white,
              onPressed: submitForm,
            ),
          ],
        ),
      ),
    );
  }
}
