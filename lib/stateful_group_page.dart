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
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
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
            ? RefreshIndicator(
                //注意：必须配合列表适用，否则无法下拉！
                child: ListView(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      alignment: Alignment.center, // 即（0,0）代表正方形的中间
                      child: Column(
                        children: <Widget>[
                          // 按住shift拉选清空
                          Image.network(
                            'https://flutter.dev/images/catalog-widget-placeholder.png',
                            width: 100.0,
                            height: 100.0,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              hintText: '请输入',
                              hintStyle: TextStyle(fontSize: 15),
                              //其他属性自己联系，今后搜索模块有深度封装
                            ),
                          ),
                          Container(  //PageView，有点像Banner轮播。
                            height: 100,
                            margin: EdgeInsets.only(top: 50),
                            decoration:
                                BoxDecoration(color: Colors.lightBlueAccent),
                            child: PageView(
                              children: <Widget>[
                                _item('Page1', Colors.deepPurple),
                                _item('Page2', Colors.green),
                                _item('Page3', Colors.red),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                onRefresh: _handleRefresh, // 下拉的时候要执行的返回值为Fature的回调函数
              )
            : Text("列表"),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    // 实现timeout，延迟执行函数。同微信项目的加载页面一个道理。
    await Future.delayed(Duration(seconds: 5)); // 第二个形参会等待后执行，这里没写。
    // 这里的代码会立即执行，无需等待
    // return语句，只有await后语句执行完毕后才return一个拿着null的Fature。
    // 可以看到刷新动画持续5秒才结束。化作json读取，这个时长根据真实的await决定。
    return null;
  }

  _item(String title, MaterialColor color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        title,
        style: TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }
}
