import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'TurnBox.dart';

class ComposeComponentRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ComposeComponentRouteState();
  }
}

class _ComposeComponentRouteState extends State<ComposeComponentRoute>{
  double _turns = .0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("ComposeComponentRoute"),
      ),
      body:
      Center(
        child:Column(
          children: <Widget>[
            TurnBox(
              turns: _turns,
              speed: 500,
              child: Icon(Icons.refresh, size: 50,),
            ),
            TurnBox(
              turns: _turns,
              speed: 1000,
              child: Icon(Icons.refresh, size: 150.0,),
            ),
            RaisedButton(
              child: Text("顺时针旋转1/5圈"),
              onPressed: () {
                setState(() {
                  _turns += .2;
                });
              },
            ),
            RaisedButton(
              child: Text("逆时针旋转1/5圈"),
              onPressed: () {
                setState(() {
                  _turns -= .2;
                });
              },
            )
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
    );
  }
}