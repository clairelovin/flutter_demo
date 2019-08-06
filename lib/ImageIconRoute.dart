import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ImageIconRoute extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    String icons = "";
// accessible: &#xE914; or 0xE914 or E914
    icons += "\uE914";
// error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
// fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";

    return new Scaffold(
      appBar: AppBar(
        title: Text("ImageIconRoute"),
      ),
      body:
      Center(
          child:Column(
            children: <Widget>[
              Image(
                image: AssetImage("images/icon.png"),
                width: 100,
                height: 100,
              ),
              Image.asset("images/icon.png",width: 100,),
              Image(
                image: NetworkImage("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                width: 100,
              ),
              Image.network("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                width: 100,
                color: Colors.blue,
                colorBlendMode: BlendMode.difference,
              ),
              Text(icons,
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: "MaterialIcons",
                  color: Colors.blue,
                ),
              ),
            ],
          ),
      ),
    );
  }
}