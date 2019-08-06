import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class DecoratedBoxRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("DecoratedBox"),
      ),
      body:
      Center(
          child: DecoratedBox(
            position: DecorationPosition.background,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue,Colors.red]),
              borderRadius: BorderRadius.circular(3),
              boxShadow: [BoxShadow(
                color: Colors.black54,
                offset: Offset(2, 2),
                blurRadius: 4,
              )],
            ),
            child: Text("渐变背景"),
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