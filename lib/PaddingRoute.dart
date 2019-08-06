import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class PaddingRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("PaddingRoute"),
      ),
      body:
      Center(
          child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text("你好"),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 30, 40),
                    child: Text("你好"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical:10,horizontal: 20),
                    child: Text("你好"),
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