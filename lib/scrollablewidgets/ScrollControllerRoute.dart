import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import '../PaddingRoute.dart';

class ScrollControllerRoute extends StatefulWidget{//滚动监听及控制
  @override
  State<StatefulWidget> createState() {
    return _ScrollControllerRouteState();
  }
}

class _ScrollControllerRouteState extends State<ScrollControllerRoute>{
  ScrollController _scrollController = ScrollController(keepScrollOffset: false);
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮

  @override
  void initState() {
    super.initState();
    _scrollController.addListener((){
      print("listview offset===$_scrollController.offset");
      if(_scrollController.offset<1000&&showToTopBtn){
        setState(() {
          showToTopBtn = false;
        });
      }else if(_scrollController.offset>1000&&!showToTopBtn){
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      key: PageStorageKey(_ScrollControllerRouteState),
      appBar: AppBar(
        title: Text("ScrollControllerRoute"),
      ),
      body:
       Center(
         child:Scrollbar(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate((context,index){
                  return ListTile(
                    title: Text("$index"),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return PaddingRoute();
                      }));
                    },
                  );
                },
                  childCount: 50,
                ),
              )
            ],
          ),
        ),

//        ListView.builder(
//          itemCount: 100,
//          itemExtent: 50,
//          controller: _scrollController,
//          itemBuilder: (BuildContext context,int index){
//            return ListTile(
//              title: Text("$index"),
//              onTap: (){
//                Navigator.push(context, new MaterialPageRoute(builder: (context){
//                  return PaddingRoute();
//                }));
//              },
//            );
//          },
//        ),
      ),
      floatingActionButton: showToTopBtn?FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: (){
          _scrollController.animateTo(0, duration: Duration(milliseconds: 20), curve: Curves.ease);
        },
      ):null,
    );
  }
}