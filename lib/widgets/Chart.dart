import 'package:flutter/material.dart';
import 'package:mobile_app/models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);

  List<Map<String, Object>> get transactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double daySum;

      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].time.day == weekDay.day &&
            recentTransactions[i].time.month == weekDay.month) {
          daySum += recentTransactions[i].amount;
        }
      }

      return {'day': weekDay, 'amount': daySum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}
