import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ScrollControllerRoute extends StatelessWidget{//滚动监听及控制
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("ScrollControllerRoute"),
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
    );
  }
}