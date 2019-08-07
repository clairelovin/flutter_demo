import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class GridViewRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("GridViewRoute"),
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