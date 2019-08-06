import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:math' as math;

class ContainerRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("ContainerRoute"),
      ),
      body:
      Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 120,top: 50),
            constraints: BoxConstraints.tightFor(width: 200,height: 150),
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [Colors.red,Colors.orange],
                center: Alignment.topLeft,
                radius: 0.98,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            transform: Matrix4.rotationZ(.2),
            alignment: Alignment.center,
            child: Text(
              "你好啊",
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.blue
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0), //容器外补白
            color: Colors.orange,
            child: Text("Hello world!"),
          ),
          Container(
            padding: EdgeInsets.all(20.0), //容器内补白
            color: Colors.orange,
            child: Text("Hello world!"),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.orange),
              child: Text("Hello world!"),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.orange),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("Hello world!"),
            ),
          ),
        ],
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