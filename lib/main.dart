import 'package:flutter/material.dart';
import 'package:imooc/plugin_use.dart';
import 'package:imooc/less_group_page.dart';
import 'package:imooc/stateful_group_page.dart';
import 'package:imooc/flutter_layout_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("如何创建和使用Flutter的路由与导航？"),
        ),
        body: RouteNavigator(),
      ),

      //typedef WidgetBuilder = Widget Function(BuildContext context);
      //typedef就是给带返回类型的，参数信息的函数对象类取个别名，在函数作为参数传递是避免返回类型信息丢失。
      routes: <String, WidgetBuilder>{
        'plugin': (BuildContext context) => PluginUse(),
        'less': (BuildContext context) => LessGroupPage(),
        'ful': (BuildContext context) => StatefulGroup(),
        'layout': (BuildContext context) => FlutterLayoutPage(),
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  //true根据路由名称跳转，false通过Navigator直接跳转
  bool byName = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          //开关列表瓷砖//开则传true关则传false
          SwitchListTile(
            title: Text("${byName?'':'不'}通过路由名跳转"),
            value: byName,
            //onChanged填写回调函数
            onChanged: (value) {
              setState(() {
                byName = value;
              });
            },
          ),
          // 显示的文案，具体页面实例，路由名字。
          // 对应用实例切路由和用系统注册的路由名字切路由。
          _item('如何使用Fluttter包和插件', PluginUse(), 'plugin'),
          _item('StatelessWidget与基础组件', LessGroupPage(), 'less'),
          _item('StatefulWidget与基础组件', StatefulGroup(), 'ful'),
          _item('如何进行Flutter布局开发', FlutterLayoutPage(), 'layout'),
        ],
      ),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
        child: RaisedButton(
      onPressed: () {
        if(byName) {
          Navigator.pushNamed(context, routeName);
        }else{
          Navigator.push(context,MaterialPageRoute(builder:(context)=>page));
        }
      },
      child: Text(title),
    ));
  }
}
