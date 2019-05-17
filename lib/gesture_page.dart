import 'package:flutter/material.dart';

///如何检测用户手势
class GesturePage extends StatefulWidget {
  @override
  _GesturePageState createState() {
    return _GesturePageState();
  }
}

class _GesturePageState extends State<GesturePage> {
  String printString = '';
  double moveX = 0, moveY = 0;

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
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => _printMsg('点击'),
                    onDoubleTap: () => _printMsg('双击'),
                    onLongPress: () => _printMsg('长按'),
                    onTapCancel: () => _printMsg('点击取消'),
                    onTapUp: (element) => _printMsg('点击抬起'),
                    onTapDown: (element) => _printMsg('点击按下'),
                    child: Container(
                      padding: EdgeInsets.all(60),
                      decoration: BoxDecoration(color: Colors.blueAccent),
                      child: Text(
                        '点我',
                        style: TextStyle(
                          fontSize: 36.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Text(printString),
                ],
              ),
              Positioned(
                left: moveX,
                top: moveY,
                child: GestureDetector(
                  onPanUpdate: (element) => _doMove(element),
                  child: Container(
                    width: 72.0,
                    height: 72.0,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(36),  //设置为半径
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _printMsg(String msg) {
    setState(() {
      printString += ' , ${msg}';
    });
  }

  _doMove(DragUpdateDetails element) {
    setState(() {
      moveY += element.delta.dy;
      moveX += element.delta.dx;
    });
    print(element);
  }
}
