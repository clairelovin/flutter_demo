import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'HeroAnimationRouteB.dart';

// 路由A
class HeroAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Container(
          alignment: Alignment.topCenter,
          child: InkWell(
            child: Hero(
              tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
              child: ClipOval(
                child: Image.asset("images/icon.png",
                  width: 50.0,
                ),
              ),
            ),
            onTap: () {
              //打开B路由
              Navigator.push(context, PageRouteBuilder(
                  pageBuilder: (BuildContext context, Animation animation,
                      Animation secondaryAnimation) {
                    return new FadeTransition(
                      opacity: animation,
                      child: Scaffold(
                        appBar: AppBar(
                          title: Text("原图"),
                        ),
                        body: HeroAnimationRouteB(),
                      ),
                    );
                  })
              );
            },
          ),
        ),
      );
  }
}