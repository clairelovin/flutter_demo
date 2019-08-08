import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class WillPopScopeRoute extends StatefulWidget{//返回导航拦截
  @override
  State<StatefulWidget> createState() {
    return _WillPopScopeRouteState();
  }
}

class _WillPopScopeRouteState extends State<WillPopScopeRoute>{
  DateTime _lastPressTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text("WillPopScopeRoute"),
        ),
        body:
        Center(
          child:Column(
            children: <Widget>[
            ],
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
      ),
      onWillPop: ()async{
        if(_lastPressTime==null||DateTime.now().difference(_lastPressTime)>Duration(seconds: 1)){
          _lastPressTime = DateTime.now();
          return false;
        }
        return true;
      },
    ) ;
  }
}