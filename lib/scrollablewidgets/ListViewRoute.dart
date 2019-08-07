import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ListViewRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ListViewRouteState();
  }
}

class _ListViewRouteState extends State<ListViewRoute>{
  static const loadingTag = "##loading##";
  var _wards = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("ListViewRoute"),
      ),
      body: Column(
        children: <Widget>[
          ListTile(title: Text("商品列表"),),
          Expanded(
            child: ListView.builder(itemBuilder: (BuildContext context,int index){
              return ListTile(title: Text("$index"),);
            }),
          ),
        ],
      ),
//      ListView.separated(//下拉加载
//          itemBuilder: (BuildContext context,int index){
//            if(_wards[index]==loadingTag){
//              //不足100条 继续获取数据
//              if(_wards.length-1<100){
//                //获取数据
//                _retrieveData();
//                //加载时显示loading
//                return Container(
//                  padding: EdgeInsets.all(16),
//                  alignment: Alignment.center,
//                  child: CircularProgressIndicator(strokeWidth: 2,),
//                );
//              }else{
//                return Container(
//                  alignment: Alignment.center,
//                  padding: EdgeInsets.all(16),
//                  child: Text("没有更多了~",style: TextStyle(color: Colors.grey),),
//                );
//              }
//            }
//
//            //显示列表项数据
//            return ListTile(title: Text(_wards[index]),);
//          },
//          separatorBuilder: (BuildContext context,int index){
//            return index%2==0?Divider(height: 2,color: Colors.blue,):Divider(height: 2,color: Colors.red,);
//          },
//          itemCount: _wards.length,
//      ),
//      ListView.separated(itemBuilder: (BuildContext context,int index){//有分割线的ListView
//        return ListTile(title: Text("$index"),);
//      },
//        separatorBuilder: (BuildContext context,int index){
//          return index%2==0?Divider(height: 2,color: Colors.blue,):Divider(height: 2,color: Colors.red,);
//        },
//        itemCount: 50,
//      ),
//      ListView.builder(//没有分割线的ListView
//        itemCount: 50,
//        itemExtent: 50,//强制高度为50.0
//        itemBuilder: (BuildContext context,int index){
//          return ListTile(title: Text("$index"),);
//        },
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

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e){
    _wards.insertAll(_wards.length-1, generateWordPairs().take(20).map((e)=>e.asPascalCase).toList());
        setState((){
      //重新构建列表
    });
    });
  }
}