import 'package:flutter/material.dart';

// 如何进行Flutter布局开发？
class FlutterLayoutPage extends StatefulWidget {
  @override
  _FlutterLayoutPageState createState() {
    return _FlutterLayoutPageState();
  }
}

class _FlutterLayoutPageState extends State<FlutterLayoutPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      fontSize: 30.0,
    );
    return MaterialApp(
      title: '如何进行Flutter布局开发？',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何进行Flutter布局开发？'),
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
                          Row(
                            children: <Widget>[
                              ClipOval(
                                child: SizedBox(
                                  //这个组件可有可无，很多部件自带大小属性，同时Container也可以约束大小。
                                  width: 100.0,
                                  height: 100.0,
                                  // 由于图片是长方形的，最终看到的不是圆形，上边下边的圆形部分会用透明代替。以长边为准，而不是短边。
                                  child: Image.network(
                                      'http://chenbingxu.blog.phizmore.com/wp-content/uploads/2019/05/4b7e25bb12a6eee4a987837a828a16f8.png'),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          100)), // 圆角100%但是原图不是正方形，效果同ClipOval。
                                  child: Opacity(
                                    opacity: 0.6,
                                    child: Image.network(
                                      'http://chenbingxu.blog.phizmore.com/wp-content/uploads/2019/05/4b7e25bb12a6eee4a987837a828a16f8.png',
                                      width: 100,
                                      height: 100,
                                    ),
                                  ), //不透明度60%
                                ),
                              ),
                            ],
                          ),
                          Image.network(
                            'http://chenbingxu.blog.phizmore.com/wp-content/uploads/2019/05/4b7e25bb12a6eee4a987837a828a16f8.png',
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
                          Container(
                            //PageView，有点像Banner轮播。
                            height: 100,
                            margin: EdgeInsets.only(top: 50),
                            decoration:
                                BoxDecoration(color: Colors.lightBlueAccent),
                            child: PhysicalModel(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(50),
                                clipBehavior: Clip.antiAlias, //抗锯齿
                                child: PageView(
                                  children: <Widget>[
                                    _item('Page1', Colors.deepPurple),
                                    _item('Page2', Colors.green),
                                    _item('Page3', Colors.red),
                                  ],
                                )),
                          ),
                          Column(
                            children: <Widget>[
                              FractionallySizedBox(
                                widthFactor: 1,
                                child: Container(
                                  //Container根据child优先决定宽度，所以外面包裹一层。
                                  decoration:
                                      BoxDecoration(color: Colors.greenAccent),
                                  child: Text("宽度能撑满屏幕么？"),
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: <Widget>[
                              Image.network(
                                'http://chenbingxu.blog.phizmore.com/wp-content/uploads/2019/05/4b7e25bb12a6eee4a987837a828a16f8.png',
                                width: 100.0,
                                height: 100.0,
                              ),
                              Positioned(
                                left: 0,
                                bottom: 0,
                                child: Image.network(
                                  'http://chenbingxu.blog.phizmore.com/wp-content/uploads/2019/05/4b7e25bb12a6eee4a987837a828a16f8.png',
                                  width: 100.0,
                                  height: 100.0,
                                ),
                                width: 36.0,
                                height: 36.0,
                              ),
                            ],
                          ),
                          Wrap(
                            spacing: 8.0, //水平间距
                            runSpacing: 6.0, //垂直间距
                            children: <Widget>[
                              _chip('Flutter'),
                              _chip('进阶'),
                              _chip('实战'),
                              _chip('携程'),
                              _chip('App'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                onRefresh: _handleRefresh, // 下拉的时候要执行的返回值为Fature的回调函数
              )
            : Column(
                children: <Widget>[
                  Text('列表'),
                  Expanded(  //Expand根据可伸展组件的可伸展方向膨胀至最大
                    child: Container(
                      //不用expand，只有文字那么高根据子元素，而且列表的宽度根据Container 调节
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Text('拉伸填满高度'),
                    ),
                  ),
                ],
              ),
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

  _chip(String label) {
    return Chip(
        label: Text(label),
        avatar: CircleAvatar(
          backgroundColor: Colors.blue.shade900,
          child: Text(
            label.substring(0, 1),
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ));
  }
}
