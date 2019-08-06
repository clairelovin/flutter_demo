import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class TextFieldRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _TextFieldState();
}

class _TextFieldState extends State<TextFieldRoute>{
  TextEditingController _editController = new TextEditingController();

  @override
  void initState() {
    _editController.text = "initState text";
    _editController.selection = TextSelection(baseOffset: 2, extentOffset: _editController.text.length);
    _editController.addListener((){
      print("listener==="+_editController.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(
        title: Text("TextFieldState"),
      ),
      body:
      Center(
        child:Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person)
              ),
              onChanged: (value){
                print("onChanged==="+value);
              },
              controller: _editController,
            ),
            TextField(
              obscureText: true,
              autofocus: false,
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "请输入密码",
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            IconButton(
              icon: Icon( Icons.search),
              onPressed: (){
                print("show==="+_editController.text);
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
}