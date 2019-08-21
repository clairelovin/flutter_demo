import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'MySlideTransition.dart';
import 'SlideTransitionX.dart';

class AnimatedSwitcherCounterRoute extends StatefulWidget {
  const AnimatedSwitcherCounterRoute({Key key}) : super(key: key);

  @override
  _AnimatedSwitcherCounterRouteState createState() => _AnimatedSwitcherCounterRouteState();
}

class _AnimatedSwitcherCounterRouteState extends State<AnimatedSwitcherCounterRoute> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  //执行缩放动画
                  return ScaleTransition(child: child, scale: animation);
                },
                child: Text(
                  '$_count',
                  //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                  key: ValueKey<int>(_count),
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
//              AnimatedSwitcher(
//                duration: Duration(milliseconds: 200),
//                transitionBuilder: (Widget child, Animation<double> animation) {
//                  var tween=Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
//                  return MySlideTransition(
//                    child: Text(
//                      '$_count',
//                      //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
//                      key: ValueKey<int>(_count),
//                      style: Theme.of(context).textTheme.display1,
//                    ),
//                    position: tween.animate(animation),
//                  );
//                },
//              ),
//              AnimatedSwitcher(
//                duration: Duration(milliseconds: 200),
//                transitionBuilder: (Widget child, Animation<double> animation) {
//                  var tween=Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
//                  return SlideTransitionX(
//                    child: child,
//                    direction: AxisDirection.down, //上入下出
//                    position: animation,
//                  );
//                },
//              ),
              RaisedButton(
                child: const Text('+1',),
                onPressed: () {
                  setState(() {
                    _count += 1;
                  });
                },
              ),
            ],
          ),
        ),
      );
  }
}