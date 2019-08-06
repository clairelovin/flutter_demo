import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class FormRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _FormRouteState();
}

class _FormRouteState extends State<FormRoute>{
  TextEditingController _nameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FormRoute"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16,horizontal: 24),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "请输入用户名",
                  icon: Icon(Icons.person),
                ),
                validator: (value){
                  return value.trim().length>0?null:"用户名不能为空";
                },
              ),
              TextFormField(
                autofocus: false,
                obscureText: true,
                controller: _pwdController,
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "请输入密码",
                  icon: Icon(Icons.lock),
                ),
                validator: (value){
                  return value.trim().length>5?null:"密码长度不能小于6";
                },
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        child: Text("登录"),
                        padding: EdgeInsets.all(16),
                        onPressed: (){
                          if((_formKey.currentState as FormState).validate()){
                            print("验证通过");
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}