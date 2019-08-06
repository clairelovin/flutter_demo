import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class WrapAndFlowRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("WrapAndFlowRoute"),
      ),
      body:Column(
        children: <Widget>[
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.start,
            children: <Widget>[
              Chip(
                label: Text("喵帕斯"),
                avatar: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text("A"),
                ),
              ),
              Chip(
                label: Text("喵帕斯"),
                avatar: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text("B"),
                ),
              ),
              Chip(
                label: Text("喵帕斯"),
                avatar: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text("C"),
                ),
              ),
              Chip(
                label: Text("喵帕斯"),
                avatar: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text("D"),
                ),
              ),
            ],
          ),
          Flow(
            delegate: MyFlowDelegate(margin: EdgeInsets.all(10)),
            children: <Widget>[
              Container(
                width: 80,
                height: 80,
                color: Colors.blue,
              ),
              Container(
                width: 80,
                height: 80,
                color: Colors.blue,
              ),
              Container(
                width: 80,
                height: 80,
                color: Colors.blue,
              ),
              Container(
                width: 80,
                height: 80,
                color: Colors.blue,
              ),
              Container(
                width: 80,
                height: 80,
                color: Colors.blue,
              ),
              Container(
                width: 80,
                height: 80,
                color: Colors.blue,
              ),
            ],
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
class MyFlowDelegate extends FlowDelegate{
  EdgeInsets margin = EdgeInsets.zero;

  MyFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(double.infinity, 200);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate!=this;
  }

}