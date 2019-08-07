import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class CustomScrollViewRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: AppBar(
//        title: Text("CustomScrollViewRoute"),
//      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("CustomScrollViewRoute"),
              background: Image.asset("./images/icon.png"),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context,int index){
                    return Container(
                      alignment: Alignment.center,
                      child: Text("index is $index"),
                      color: Colors.cyan[100*(index%9)],
                    );
                  },
                childCount: 20,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 4,
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context,int index){
                    return Container(
                      alignment: Alignment.center,
                      child: Text("index is $index"),
                      color: Colors.lightBlue[100*(index%9)],
                    );
                    },
            childCount: 50,
            ),
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