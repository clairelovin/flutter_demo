import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class PointerEventRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _PointerEventRoute();
  }
}

class _PointerEventRoute extends State<PointerEventRoute>{
  int _count=0;
  PointerEvent _event;
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text("PointerEventRoute"),
      ),
      body:
      Stack(
        children: <Widget>[
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(300.0, 200.0)),
              child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.blue)),
            ),
            onPointerDown: (event) => print("down0"),
          ),
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(200.0, 100.0)),
              child: Center(child: Text("左上角200*100范围内非文本区域点击")),
            ),
            onPointerDown: (event) => print("down1"),
            //behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
          ),
          Listener(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(Size(300.0, 150.0)),
                child: Center(child: Text("Box A")),
              ),
              //behavior: HitTestBehavior.opaque,//该属性并不能用于在组件树中拦截（忽略）事件，它只是决定命中测试时的组件大小。
              onPointerDown: (event) => print("down A")
          ),
          Listener(
            child: AbsorbPointer(//AbsorbPointer本身会参与命中测试，而IgnorePointer本身不会参与
              child: Listener(
                child: Container(
                  color: Colors.red,
                  width: 200.0,
                  height: 100.0,
                ),
                onPointerDown: (event)=>print("in"),
              ),
            ),
            onPointerDown: (event)=>print("up"),
          ),
        ],
      ),
//      Listener(
//        child: Container(
//          alignment: Alignment.center,
//          color: Colors.blue,
//          width: 300,
//          height: 150,
//          child:Text("$_count${_event?.toString()??""}",style: TextStyle(color: Colors.white)),
//        ),
//
//        onPointerDown: (PointerDownEvent event){setState((){++_count;_event = event;});print("onPointerDown${_event?.toString()??""}");},
//        onPointerMove: (PointerMoveEvent event){setState((){++_count;_event = event;});print("PointerMoveEvent");},
//        onPointerUp: (PointerUpEvent event){setState((){++_count;_event = event;});print("PointerUpEvent");},
//      ),
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