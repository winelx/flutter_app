import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //这个是必须返回的widget，
    return new MaterialApp(
      title: "这是demo",
      home: new myapp(),
    );
  }
}

class myapp extends StatefulWidget {
  @override
  Login createState() {
    // TODO: implement createState
    return new Login();
  }
}

class Login extends State<myapp> {
  static const LOGO =
      'http://www.pptok.com/wp-content/uploads/2012/08/xunguang-4.jpg';
  var leftRightPadding = 30.0;
  var topBottomPadding = 4.0;
  var textTips = new TextStyle(fontSize: 16.0, color: Colors.black);
  var hintTips = new TextStyle(fontSize: 15.0, color: Colors.black26);

  var _userPassController = new TextEditingController();
  var _userNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        //居中标题
        centerTitle: true,
        title: new Text(
            //标题
            "登陆",
            //标题文字样式
            style: new TextStyle(color: Colors.white)),
        //一个显示在 AppBar 下方的控件，高度和 AppBar 高度一样，可以实现一些特殊的效果，
        flexibleSpace: Container(
          color: Colors.red,
          decoration: new BoxDecoration(
            
          ),
        ),
        bottom: new PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: new Theme(
            data: Theme.of(context).copyWith(accentColor: Colors.black),
            child: new Container(
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: new EdgeInsets.fromLTRB(
                        leftRightPadding, 0.0, leftRightPadding, 10.0),
                    child: new Image.network(LOGO),
                  ),
                ],
              ),
              transform: new Matrix4.rotationZ(0.0),
              height: 48.0,
              alignment: Alignment.center,
            ),
          ),
        ),

        //左边icon（一般这里是返回和菜单）
        iconTheme: new IconThemeData(color: Colors.white),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              print("返回");
            }),
        //右边icon（这里是功能按钮 比如设置，个人中心等共的Icon）
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.alarm),
            //长按提示内容
            tooltip: "Alarm",
            onPressed: () {
              print("Alarm");
            },
          ),
          //menu控件 安卓的menu
          PopupMenuButton(
            //这里菜单包裹控件，里面可以放多个item
            //itemBuilder类似父布局，
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                  //类似布局里的子控件
                  PopupMenuItem<String>(
                    //显示内容
                    child: Text("热度"),
                    //标签，类似id
                    value: "hot",
                  ),
                  PopupMenuItem<String>(
                    //显示内容
                    child: Text("最新"),
                    //标签，类似id
                    value: "new",
                  ),
                ],
            //这里出力item 的点击事件
            onSelected: (String value) {
              //根据actionz做判断
              switch (value) {
                case "热度":
                  print("hot");
                  break;
                case "new":
                  print("最新");
                  break;
              }
            },
          )
        ],
      ),
      body: new Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
            child: new Image.network(LOGO),
          ),
          new Padding(
            padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child: new TextField(
              style: hintTips,
              controller: _userNameController,
              decoration: new InputDecoration(hintText: '输入用户名'),
              obscureText: false,
            ),
          ),
          new Padding(
            padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child: new TextField(
              style: hintTips,
              controller: _userPassController,
              decoration: new InputDecoration(hintText: '请输入用户密码'),
              obscureText: true,
            ),
          ),
          new Container(
            width: 200.0,
            margin: new EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0.0),
            padding: new EdgeInsets.fromLTRB(
                leftRightPadding, topBottomPadding, leftRightPadding, 0.0),
            child: new Card(
              color: Colors.blue,
              elevation: 5.0,
              child: new FlatButton(
                onPressed: () {
                  print(_userNameController);
                },
                child: new Padding(
                  padding: new EdgeInsets.all(10.0),
                  child: new Text(
                    '登陆',
                    style: new TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
