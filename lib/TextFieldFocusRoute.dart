import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class TextFieldFocusRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _TextFieldFocusState();
}

class _TextFieldFocusState extends State<TextFieldFocusRoute>{
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    super.initState();
    focusNode1.addListener((){
      print("focusNode1==="+(focusNode1.hasFocus?"true":"false"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextFieldFocusRoute"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              focusNode: focusNode1,
              decoration: InputDecoration(
                labelText: "input1"
              ),
            ),
            TextField(
              autofocus: false,
              focusNode: focusNode2,
              decoration: InputDecoration(
                  labelText: "input2"
              ),
            ),
            RaisedButton(
              child: Text("切换焦点"),
              onPressed: (){
                if(focusScopeNode==null){
                  focusScopeNode = FocusScope.of(context);
                }
                focusScopeNode.requestFocus(focusNode2);
              },
            ),
            RaisedButton(
              child: Text("隐藏键盘"),
              onPressed: (){
                focusNode1.unfocus();
                focusNode2.unfocus();
              },
            ),
          ],
        ),
      ),
    );
  }
}