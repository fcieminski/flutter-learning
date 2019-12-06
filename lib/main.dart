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
            new ImageChange(),
          ],
        )),
        floatingActionButton: FloatButton(),
      ),
    );
  }
}

class BackgroundLight extends StatefulWidget {
  @override
  _BackgroundLightState createState() => _BackgroundLightState();
}

class _BackgroundLightState extends State<BackgroundLight> {
  String color = 'white';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => setState(() {
        if (color == 'white') {
          color = 'gray';
        } else {
          color = 'white';
        }
      }),
    );
  }
}

class ImageChange extends StatefulWidget {
  final List<String> _images = [
    'assets/images/city.jpg',
    'assets/images/city2.png'
  ];

  @override
  _ImageChangeState createState() => _ImageChangeState();
}

class _ImageChangeState extends State<ImageChange> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Image.asset(widget._images[_index],
                height: 300, fit: BoxFit.fill),
          )),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: FlatButton(
                child: Text('Change image'),
                onPressed: () => setState(() {
                  if (_index == widget._images.length - 1) {
                    _index = 0;
                  } else {
                    _index++;
                  }
                }),
                color: Colors.deepOrange,
                textColor: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FloatButton extends StatefulWidget {
  @override
  _FloatButtonState createState() => _FloatButtonState();
}

class _FloatButtonState extends State<FloatButton> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FloatingActionButton(
        child: Text('+ $_count'),
        backgroundColor: Colors.deepOrange,
        onPressed: () => setState(() => _count++),
        tooltip: 'Increment Counter',
      ),
    );
  }
}
