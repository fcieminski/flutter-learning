import 'package:flutter/material.dart';
import 'package:mobile_app/models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);

  List<Map<String, Object>> get transactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double daySum = 0;

      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].time.day == weekDay.day &&
            recentTransactions[i].time.month == weekDay.month) {
          daySum += recentTransactions[i].amount;
        }
      }

      return {'day': '${weekDay.day}.${weekDay.month}', 'amount': daySum};
    }).reversed.toList();
  }

  double get totalSpending {
    return transactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, availableSize) {
      return Card(
        elevation: 6,
        margin: EdgeInsets.all(16),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: transactionValues.map((element) {
                  return Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 20,
                          child: FittedBox(
                            child: Text('${element['amount']}zł'),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          height: availableSize.maxHeight * 0.3,
                          width: 10,
                          child: Stack(
                            alignment: AlignmentDirectional.bottomStart,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.orangeAccent,
                                    width: 1,
                                  ),
                                  color: Color.fromRGBO(220, 220, 220, 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              FractionallySizedBox(
                                heightFactor: totalSpending == 0.0
                                    ? 0.0
                                    : (element['amount'] as double) /
                                        totalSpending,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.deepOrange,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '${element['day']}',
                          style: TextStyle(
                              color: element['day'] ==
                                      '${DateTime.now().day}.${DateTime.now().month}'
                                  ? Colors.deepOrange
                                  : null),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      );
    });
  }
}
