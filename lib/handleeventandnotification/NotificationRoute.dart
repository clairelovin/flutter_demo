import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class NotificationRoute extends StatefulWidget {
  @override
  NotificationRouteState createState() {
    return new NotificationRouteState();
  }
}

class NotificationRouteState extends State<NotificationRoute> {
  String _msg="";
  @override
  Widget build(BuildContext context) {
    //监听通知
    return new Scaffold(
      appBar: AppBar(
        title: Text("NotificationRouteState"),
      ),
      body: NotificationListener<MyNotification>(
          onNotification: (notification) {
            setState(() {
              _msg+=notification.msg+"  ";
            });
            return true;
          },
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
//          RaisedButton(
//           onPressed: () => MyNotification("Hi").dispatch(context),
//           child: Text("Send Notification"),
//          ),
                Builder(
                  builder: (context) {
                    return RaisedButton(
                      //按钮点击时分发通知
                      onPressed: () => MyNotification("Hi").dispatch(context),
                      child: Text("Send Notification"),
                    );
                  },
                ),
                Text(_msg)
              ],
            ),
          ),
      )
    );
  }
}

class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;
}