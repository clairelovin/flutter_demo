import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:math' as math;

class TransformRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("TransformRoute"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.black54,
              child: Transform(
                alignment: Alignment.topRight,
                transform: Matrix4.skewY(0.3),
                child: Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.deepOrange,
                  child: Text("测试"),
                ),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Transform.translate(
                offset: Offset(5, 5),
                child: Text("测试"),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Transform.rotate(
                angle: math.pi/2,
                child: Text("测试"),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Transform.scale(
                scale: 1.5,
                child: Text("测试"),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: RotatedBox(//RotatedBox和Transform.rotate功能相似，它们都可以对子widget进行旋转变换，但是有一点不同：RotatedBox的变换是在layout阶段，会影响在子widget的位置和大小
                quarterTurns: 1,
                child: Text("测试"),
              ),
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