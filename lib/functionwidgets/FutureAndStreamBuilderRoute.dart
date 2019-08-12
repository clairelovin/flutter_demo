import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class FutureAndStreamBuilderRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("FutureAndStreamBuilderRoute"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder(
              future: mockNetworkData(),
              builder: (BuildContext context,AsyncSnapshot snapshot){
                if(snapshot.connectionState==ConnectionState.done){
                  if(snapshot.hasError){
                    return Text("Error:${snapshot.error}");
                  }else{
                    return Text("Data:${snapshot.data}");
                  }
                }else{
                  return CircularProgressIndicator();
                }
              },
            ),
            StreamBuilder(
              stream: counter(),
              builder: (BuildContext context,AsyncSnapshot snapshot){
                if(snapshot.hasError){
                  return Text("Error:${snapshot.error}");
                }
                switch(snapshot.connectionState){
                  case ConnectionState.done:
                    return Text("Stream已关闭");
                  case ConnectionState.active:
                    return Text("active：${snapshot.data}");
                  case ConnectionState.none:
                    return Text("没有Stream");
                  case ConnectionState.waiting:
                    return Text("等待数据。。。");
                }
                return null;
              },
            ),
          ],
        ),
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

  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 3),()=>"我是网络数据");
  }

  Stream<int>counter() {
    return Stream.periodic(Duration(seconds: 1),(i)=>i);
  }
}