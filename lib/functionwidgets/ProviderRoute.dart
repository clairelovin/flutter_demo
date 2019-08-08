import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ProviderRoute extends StatelessWidget{//跨组件状态共享
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("ProviderRoute"),
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