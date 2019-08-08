import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class InheritedWidgetRoute extends StatefulWidget{//数据共享控件
  @override
  State<StatefulWidget> createState() {
    return _InheritedWidgetRouteState();
  }
}

class _InheritedWidgetRouteState extends State<InheritedWidgetRoute>{
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidgetRoute"),
      ),
      body: Center(
        child: ShareDataWidget(
          data: _count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: TestWidgetRoute(),
              ),
              RaisedButton(
                child: Text("Increment"),
                onPressed: (){
                  setState(() {
                    ++_count;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class TestWidgetRoute extends StatefulWidget{//数据共享控件
  @override
  State<StatefulWidget> createState() {
    return _TestWidgetRouteState();
  }
}

class _TestWidgetRouteState extends State<TestWidgetRoute>{
  @override
  Widget build(BuildContext context) {
    return  Text(ShareDataWidget.of(context).data.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
}

class ShareDataWidget extends InheritedWidget{
  final int data;//共享数据
  ShareDataWidget({@required this.data,Widget child}):super(child:child);

  static ShareDataWidget of(BuildContext context){
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    return oldWidget.data!=data;
  }
}