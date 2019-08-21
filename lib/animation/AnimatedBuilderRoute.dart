import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class AnimatedBuilderRoute extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _AnimatedBuilderRouteState();
  }
}

class _AnimatedBuilderRouteState extends State<AnimatedBuilderRoute> with SingleTickerProviderStateMixin{
  AnimationController _controller;
  Animation _animation;
  @override
  Widget build(BuildContext context) {


    return new Scaffold(
      appBar: AppBar(
        title: Text("AnimatedBuilderRoute"),
      ),
      body: GrowTransition(
        child: Image.asset("images/icon.png"),
        animation: _animation,
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

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    _animation = new Tween(begin: 0.0, end: 300.0).animate(_controller)
      ..addListener(() {
        setState(()=>{});
      });
    _animation.addStatusListener((status){
      if(status==AnimationStatus.completed){
        _controller.reverse();
      }else if(status==AnimationStatus.dismissed){
        _controller.forward();
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return new Container(
                height: animation.value,
                width: animation.value,
                child: child
            );
          },
          child: child
      ),
    );
  }
}