import 'package:flutter/material.dart';

class StatefulGroup extends StatefulWidget {
  @override
  _StatefulGroupState createState() {
    return _StatefulGroupState();
  }
}

class _StatefulGroupState extends State<StatefulGroup> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      fontSize: 30.0,
    );
    return MaterialApp(
      title: 'StatelessWidget与基础组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('StatelessWidget与基础组件'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex, //默认选中第0个
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              //可以设置两个状态
              title: Text("首页"),
              icon: Icon(Icons.home, color: Colors.grey), //激活状态
              activeIcon: Icon(Icons.home, color: Colors.blue), //选中状态
            ),
            BottomNavigationBarItem(
              title: Text("列表"),
              icon: Icon(Icons.list, color: Colors.grey), //激活状态
              activeIcon: Icon(Icons.list, color: Colors.blue), //选中状态
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text("点我"),
        ),
        body: _currentIndex == 0
            ? Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                alignment: Alignment.center, // 即（0,0）代表正方形的中间
                child: Column(
                  children: <Widget>[
                    Text(
                      "I am text",
                      style: textStyle,
                    ),
                    Icon(
                      Icons.android,
                      size: 50,
                      color: Colors.red,
                    ),
                    CloseButton(), //关闭按钮
                    BackButton(), //返回按钮
                    Chip(
                      //material.io/design/components/chips.html
                      avatar: Icon(Icons.photo),
                      label: Text('StatelessWidget与基本组件'),
                    ),
                    Divider(
                      height: 10.0, //容器高度，设置不了线的高度
                      indent: 16.0, //左边间距
                      color: Colors.orange,
                    ),
                    //还可以用Container画线
                    Card(
                      // 带有圆角，阴影，边框效果的卡片
                      color: Colors.blue,
                      elevation: 5, //阴影（悬浮高度）
                      margin: EdgeInsets.all(10),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'I am Card.',
                          style: textStyle,
                        ),
                      ),
                    ),
                    AlertDialog(
                      //这个弹窗将直接显示出来，有一个悬浮和圆角的效果
                      title: Text('盘他'),
                      content: Text('你个糟老头子坏得很'),
                    ),
                  ],
                ),
              )
            : Text("列表"),
      ),
    );
  }
}
