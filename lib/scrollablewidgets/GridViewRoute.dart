import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class GridViewRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _GridViewRouteState();
  }
}

class _GridViewRouteState extends State<GridViewRoute>{
  List<IconData>_icons = [];

  @override
  void initState() {
    super.initState();
    // 初始化数据
    _retrieveIcons();
  }

  void _retrieveIcons(){
    Future.delayed(Duration(seconds: 2)).then((e){
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast,
        ]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("GridViewRoute"),
      ),
      body:
//      GridView(
//        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//          crossAxisCount: 3, //横轴三个子widget
//          childAspectRatio: 1, //宽高比为1时，子widget
//        ),
//        children: <Widget>[
//          Icon(Icons.ac_unit),
//          Icon(Icons.airport_shuttle),
//          Icon(Icons.all_inclusive),
//          Icon(Icons.beach_access),
//          Icon(Icons.cake),
//          Icon(Icons.free_breakfast),
//        ],
//      ),
//        GridView.count(
//          crossAxisCount: 3,
//          childAspectRatio: 1,
//          children: <Widget>[
//            Icon(Icons.ac_unit),
//            Icon(Icons.airport_shuttle),
//            Icon(Icons.all_inclusive),
//            Icon(Icons.beach_access),
//            Icon(Icons.cake),
//            Icon(Icons.free_breakfast),
//          ],
//        ),
//        GridView(
//          padding: EdgeInsets.all(0),
//          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//            maxCrossAxisExtent: 120,
//            childAspectRatio: 1,
//          ),
//          children: <Widget>[
//            Icon(Icons.ac_unit),
//            Icon(Icons.airport_shuttle),
//            Icon(Icons.all_inclusive),
//            Icon(Icons.beach_access),
//            Icon(Icons.cake),
//            Icon(Icons.free_breakfast),
//          ],
//        ),
//        GridView.extent(
//          padding: EdgeInsets.all(0),
//          maxCrossAxisExtent: 120,
//          childAspectRatio: 1,
//          children: <Widget>[
//            Icon(Icons.ac_unit),
//            Icon(Icons.airport_shuttle),
//            Icon(Icons.all_inclusive),
//            Icon(Icons.beach_access),
//            Icon(Icons.cake),
//            Icon(Icons.free_breakfast),
//          ],
//        ),
      GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
        ),
        itemCount: _icons.length,
        itemBuilder: (context,index){
          if(index==_icons.length-1&&index<200){
            _retrieveIcons();
          }
          return Icon(_icons[index]);
        },
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