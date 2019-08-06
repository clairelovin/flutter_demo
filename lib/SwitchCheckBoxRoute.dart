import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class SwitchCheckBoxRoute extends StatefulWidget{
  @override
  _SwitchCheckBoxRouteState createState() => new _SwitchCheckBoxRouteState();
}

class _SwitchCheckBoxRouteState extends State<SwitchCheckBoxRoute>{
  bool isSwitchSelected = false;
  bool isCheckboxChecked = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("你好啊"),
      ),
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Switch(
              value: isSwitchSelected,
              activeColor: Colors.red,
              onChanged: (value){
                setState(() {
                  isSwitchSelected = value;
                });
              },
            ),
            Checkbox(
              value: isCheckboxChecked,
              activeColor: Colors.red,
              checkColor: Colors.blue,
              onChanged: (value){
                setState(() {
                  isCheckboxChecked = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}