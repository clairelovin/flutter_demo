import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class SingleChildScrollViewRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return new Scaffold(
      appBar: AppBar(
        title: Text("SingleChildScrollViewRoute"),
      ),
      body: Scrollbar(
          child: SingleChildScrollView(
            reverse: true,
            padding: EdgeInsets.all(16),
            child: Center(
              child: Column(
                children: str.split("").map((e)=>Text(
                  e,
                  textScaleFactor: 2,
                  style: TextStyle(
                  ),
                )).toList(),
              ),
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