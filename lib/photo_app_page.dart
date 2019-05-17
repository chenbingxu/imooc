import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

///PhotoApp
class PhotoApp extends StatefulWidget {
  @override
  _PhotoAppState createState() => _PhotoAppState();
}

class _PhotoAppState extends State<PhotoApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("图片资产"),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
            ),
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
