import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ThemeRoute extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    return _ThemeRoute();
  }
}

class _ThemeRoute extends State<ThemeRoute>{
  Color _themeColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Theme(
        data: ThemeData(
          primarySwatch: _themeColor,//用于导航栏、FloatingActionButton的背景色等
          iconTheme: IconThemeData(color: _themeColor),//用于Icon颜色
        ),
        child: Scaffold(
          appBar: AppBar(title: Text("主题测试"),),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.favorite),
                  Icon(Icons.airport_shuttle),
                  Text("颜色跟随主题"),
                ],
              ),
              Theme(
                data: themeData.copyWith(
                  iconTheme: themeData.iconTheme.copyWith(color: Colors.black),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.favorite),
                    Icon(Icons.airport_shuttle),
                    Text("颜色固定黑色"),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.track_changes),
            onPressed: (){
              setState(() {
                _themeColor = _themeColor == Colors.teal?Colors.blue:Colors.teal;
              });
            },
          ),
        ),
    );
  }
}