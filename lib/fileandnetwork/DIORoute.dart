import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class DIORoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _DIORouteState();
  }
}

class _DIORouteState extends State<DIORoute>{
  Dio _dio = Dio();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("DIORoute"),
      ),
      body:
      Center(
        child:FutureBuilder(
            future: _dio.get("https://api.github.com/orgs/flutterchina/repos"),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              //请求完成
              if (snapshot.connectionState == ConnectionState.done) {
                Response response = snapshot.data;
                //发生错误
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }

                String jsonStr = snapshot.data.toString();
                print(jsonStr);
//                print(json.decode(jsonStr)[0]);

                //请求成功，通过项目信息构建用于显示项目名称的ListView
                return ListView(
                  children: response.data.map<Widget>((e) =>
                      ListTile(title: Text(e["full_name"]))
                  ).toList(),
                );
              }
              //请求未完成时弹出loading
              return CircularProgressIndicator();
            }
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
}