import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hello'),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Just trying some crazy stuff with Flutter, click button!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                  letterSpacing: 2,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Image.asset('assets/images/city.jpg'),
            )
          ],
        )),
        floatingActionButton: FloatButton(),
      ),
    );
  }
}

class FloatButton extends StatefulWidget {
  @override
  _FloatButtonState createState() => _FloatButtonState();
}

class _FloatButtonState extends State<FloatButton> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FloatingActionButton(
        child: Text('+ $count'),
        backgroundColor: Colors.deepOrange,
        onPressed: () => setState(() => count++),
        tooltip: 'Increment Counter',
      ),
    );
  }
}
