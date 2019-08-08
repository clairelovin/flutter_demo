import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ScrollNotificationRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ScrollNotificationRouteState();
  }
}

class _ScrollNotificationRouteState extends State<ScrollNotificationRoute>{
  String _progress = "0%";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("ScrollNotificationRoute"),
      ),
      body: Scrollbar(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification){
            double progress = notification.metrics.pixels/notification.metrics.maxScrollExtent;
            setState(() {
              _progress = "${(progress * 100).toInt()}%";
            });
            return;
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                itemCount: 100,
                itemExtent: 50,
                itemBuilder: (context,index){
                  return ListTile(title: Text("$index"),);
                },
              ),
              CircleAvatar(
                radius: 30,
                child: Text(_progress),
                backgroundColor: Colors.black54,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            final wordPair = new WordPair.random();
            debugPrint("随机字符串："+wordPair.toString());
            debugDumpApp();
//          debugDumpRenderTree();
//          debugDumpLayerTree();
          }),
    );
  }
}