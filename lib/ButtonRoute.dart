import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ButtonRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("ButtonRoute"),
      ),
      body:
      Center(
          child:Column(
            children: <Widget>[
              RaisedButton(
                  child: Text("RaisedButton"),
                  onPressed: (){
                    print("RaisedButton");
                  },
              ),
              FlatButton(
                child: Text("FlatButton"),
                onPressed: (){
                  print("FlatButton");
                },
              ),
              OutlineButton(
                child: Text("OutlineButton"),
                onPressed: (){
                  print("OutlineButton");
                },
              ),
              IconButton(
                icon: Icon(Icons.ac_unit),
                onPressed: (){
                  print("IconButton");
                },
              ),
              FlatButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text("custom"),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: () => {
                  print("custom")
                },
              ),
            ],
          ),
      ),
    );
  }
}