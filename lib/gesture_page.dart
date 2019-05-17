import 'package:flutter/material.dart';

///如何检测用户手势
class GesturePage extends StatefulWidget {
  @override
  _GesturePageState createState() {
    return _GesturePageState();
  }
}

class _GesturePageState extends State<GesturePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      fontSize: 30.0,
    );
    return MaterialApp(
      title: '如何检测用户手势',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
          title: Text('如何检测用户手势'),
        ),
        body: FractionallySizedBox(
          widthFactor: 1.0,
          child: Stack(
            children: <Widget>[
              Column(),
            ],
          ),
        ),
      ),
    );
  }
}
