import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class StackAndPositionedRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("StackAndPositionedRoute"),
      ),
      body:ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              child: Text(
                "Hello world",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              color: Colors.red,
            ),
            Positioned(
              child: Text("A"),
              left: 18,
            ),
            Positioned(
              child: Text("B"),
              right: 18,
            ),
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