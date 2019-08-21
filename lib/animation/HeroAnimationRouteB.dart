import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
        child: Image.asset("images/icon.png"),
      ),
    );
  }
}