import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:url_launcher/url_launcher.dart';

/// 如何打开第三方App

class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("如何打开第三方App"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => _launchURL(),
                  child: Text("打开浏览器"),
                ),
                RaisedButton(
                  onPressed: () => _launchMap(),
                  child: Text("打开地图"),
                ),
              ],
            ),
          )),
    );
  }

  //加载新的插件一定要硬重启
  _launchURL() async {
    const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  //加载新的插件一定要硬重启
  _launchMap() async {
    // Android
    const url = 'geo:52.32,4.917'; //google地图，App提供者提供的schema，注册在系统的
    if(await canLaunch(url)){
      await launch(url);
    }else{
      //IOS
      const url='http://maps.apple.com/?ll=52.32,4.917';
      if(await canLaunch(url)){
        await launch(url);
      }else{
        throw 'Could not launch $url';
      }
    }
  }

}
