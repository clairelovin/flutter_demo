import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:english_words/english_words.dart';

class GestureDetectorRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _GestureDetectorRouteState();
  }
}

class _GestureDetectorRouteState extends State<GestureDetectorRoute>{
  String _operation = "No Gesture detected!"; //保存事件名
  double _width = 200.0; //通过修改图片宽度来达到缩放效果
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  bool _toggle = false; //变色开关

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("GestureDetectorRoute"),
      ),
      body: Center(
        child:
//        GestureDetector(
//          child: Container(
//            alignment: Alignment.center,
//            color: Colors.blue,
//            width: 200,
//            height: 100,
//            child: Text("$_operation",
//              style: TextStyle(color: Colors.white),
//            ),
//          ),
//          onTap: (){
//            setState(() {
//              _operation = "tap";
//            });
//          },
//          onDoubleTap: (){
//            setState(() {
//              _operation = "double tap";
//            });
//          },
//          onLongPress: (){
//            setState(() {
//              _operation = "long press";
//            });
//          },
//          onPanDown: (DragDownDetails details){
//            setState(() {
//              _operation = "drag down";
//            });
//          },
//          onPanUpdate: (DragUpdateDetails details){
//            setState(() {
//              _operation = "drag update";
//            });
//          },
//          onPanEnd: (DragEndDetails details){
//            setState(() {
//              _operation = "drag end";
//            });
//          },
//        ),



//    GestureDetector(
//    //指定宽度，高度自适应
//    child: Image.asset("./images/icon.png", width: _width),
//    onScaleUpdate: (ScaleUpdateDetails details) {
//    setState(() {
//    //缩放倍数在0.8到10倍之间
//    _width=200*details.scale.clamp(.8, 10.0);
//    });
//    },

        Text.rich(
            TextSpan(
                children: [
                  TextSpan(text: "你好世界"),
                  TextSpan(
                    text: "点我变色",
                    style: TextStyle(
                        fontSize: 30.0,
                        color: _toggle ? Colors.blue : Colors.red
                    ),
                    recognizer: _tapGestureRecognizer
                      ..onTap = () {
                        setState(() {
                          _toggle = !_toggle;
                        });
                      },
                  ),
                  TextSpan(text: "你好世界"),
                ]
            )
        ),

      ),
    );
  }
}