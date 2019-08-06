import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ConstrainedBoxAndSizedBoxRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Widget redBox = DecoratedBox(decoration: BoxDecoration(color: Colors.red,),);

    return new Scaffold(
      appBar: AppBar(
        title: Text("ConstrainedBoxAndSizedBoxRoute"),
      ),
      body:
          Padding(padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: double.infinity,
                  minHeight: 50,
                ),
                child: Container(
                  height: 1,
                  child: redBox,
                ),
              ),
              SizedBox(width: double.infinity,height: 2,),
              SizedBox(
                width: 100,
                height: 100,
                child: redBox,
              ),
              SizedBox(width: double.infinity,height: 2,),
              ConstrainedBox(
                constraints: BoxConstraints.tight(Size(100,100)),
                child: redBox,
              ),
              SizedBox(width: double.infinity,height: 2,),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 100,height: 100),
                child: redBox,
              ),
              SizedBox(width: double.infinity,height: 2,),
              Row(
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 60,minHeight: 60),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: 90,minHeight: 20),
                      child: redBox,
                    ),
                  ),
                  SizedBox(width: 2,height: 10,),
                  ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 90,minHeight: 20),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: 60,minHeight: 60),
                      child: redBox,
                    ),
                  ),
                  ConstrainedBox(
                      constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),  //父
                      child: UnconstrainedBox( //“去除”父级限制
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
                          child: redBox,
                        ),
                      )
                  )
                ],
              )
            ],
          ),),

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