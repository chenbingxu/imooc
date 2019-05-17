import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

class ResPage extends StatefulWidget {
  @override
  _ResPageState createState() => _ResPageState();
}

class _ResPageState extends State<ResPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("图片资产"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  width: 100,
                  height: 100,
                  image: AssetImage('images/avatar.png'),
                ),
              ],
            ),
          )),
    );
  }
}
