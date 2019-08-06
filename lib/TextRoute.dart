import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class TextRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("TextRoute"),
      ),
      body:
      Center(
          child:Column(
            children: <Widget>[
              Text("第一行"*10,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,),
              Text("第二行",
              textScaleFactor: 1,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 28.0,
                backgroundColor: Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed
              ),),
              Text.rich(TextSpan(
                  children: [
                    TextSpan(
                        text: "Home: "
                    ),
                    TextSpan(
                        text: "https://flutterchina.club",
                        style: TextStyle(
                            color: Colors.blue
                        ),
                        recognizer: null
                    ),
                  ]
              )),
              DefaultTextStyle(
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 38.0
                ),
                child: Column(
                  children: <Widget>[
                    Text("你好啊"),
                    Text("你好啊111"),
                    Text("你好啊222",
                      style: TextStyle(
                        color: Colors.blue
                      ),
                    ),
                  ],
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