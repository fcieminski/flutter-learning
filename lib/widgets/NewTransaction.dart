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
  DateTime time;
  String errorMessage;

  void submitForm() {
    final title = inputTitle.text;
    final amount = double.parse(inputAmout.text);

    if (title.isEmpty ||
        amount is! double ||
        amount <= 0 ||
        time is! DateTime) {
      setState(() {
        errorMessage = 'W twoim formularzu wystąpił błąd!';
      });
      return;
    }

    widget.addTransaction(title, amount, time);
    errorMessage = '';
    Navigator.of(context).pop();
  }

  Future<DateTime> _dataPicker(BuildContext context) async {
    time = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    );
    return time;
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
            Row(
              children: <Widget>[
                FlatButton(
                  textColor: Colors.orangeAccent,
                  child: Text('Wybierz datę'),
                  onPressed: () {
                    _dataPicker(context);
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                if (errorMessage != null)
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Text(
                      '$errorMessage',
                      style: TextStyle(
                        color: Colors.deepOrange,
                      ),
                    ),
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
          ],
        ),
      ),
    );
  }
}
