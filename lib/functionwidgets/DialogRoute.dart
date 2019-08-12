import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class DialogRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("DialogRoute"),
      ),
      body:
      Center(
          child:Column(
            children: <Widget>[
              RaisedButton(
                child: Text("AlertDialog"),
                onPressed: () async {
                  //弹出对话框并等待关闭
                  bool delete = await showDeleteConfirmDialog1(context);
                  if(delete==null){
                    print("取消删除");
                  }else{
                    print("确认删除");
                  }
                },
              ),
              RaisedButton(
                child: Text("SimpleDialog"),
                onPressed: (){
                  changeLanguage(context);
                },
              ),
              RaisedButton(
                child: Text("Dialog with ListView"),
                onPressed: (){
                  showListDialog(context);
                },
              ),
              RaisedButton(
                child: Text("cutsom Dialog"),
                onPressed: (){
                  showCustomDialog1(context);
                },
              ),
            ],
          ),
      ),
    );
  }

  void showCustomDialog1(BuildContext context){
    showCustomDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                // 执行删除操作
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void>showListDialog(BuildContext context) async {
    int i = await showDialog<int>(
      context: context,
      builder: (context){
        return Dialog(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("请选择"),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (context,index){
                    return ListTile(
                      title: Text("$index"),
                      onTap: (){Navigator.pop(context,index);},
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
    print("您选择了$i");
  }

  Future<void>changeLanguage(BuildContext context) async {
    int i = await showDialog<int>(
      context: context,
      builder: (context){
        return
//          UnconstrainedBox(
//            constrainedAxis: Axis.vertical,
//            child: ConstrainedBox(
//              constraints: BoxConstraints(maxWidth: 280),
//              child: Material(
//                child: Text("呵呵"),
//                type: MaterialType.card,
//              ),
//            ),
//          );
          SimpleDialog(
          title: Text("请选择语言"),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: (){Navigator.pop(context,1);},
              child: Padding(padding: EdgeInsets.all(16),child: Text("中文简体"),),
            ),
            SimpleDialogOption(
              onPressed: (){Navigator.pop(context,2);},
              child: Padding(padding: EdgeInsets.all(16),child: Text("英语"),),
            ),
          ],
        );
      },
    );
    print("您选择了"+((i==1)?"中文简体":"英语"));
  }

  Future<bool>showDeleteConfirmDialog1(BuildContext context){
    return showDialog<bool>(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text("提示"),
          content: Text("确定删除吗"),
          actions: <Widget>[
            FlatButton(
              onPressed: ()=>Navigator.of(context).pop(),
              child: Text("取消"),
            ),
            FlatButton(
              onPressed: ()=>Navigator.of(context).pop(true),
              child: Text("确认"),
            ),
          ],
        );
      },
    );
  }

  Future<T> showCustomDialog<T>({
    @required BuildContext context,
    bool barrierDismissible = true,
    WidgetBuilder builder,
  }) {
    final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        final Widget pageChild = Builder(builder: builder);
        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            return theme != null
                ? Theme(data: theme, child: pageChild)
                : pageChild;
          }),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black87, // 自定义遮罩颜色
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: _buildMaterialDialogTransitions,
    );
  }

  Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    // 使用缩放动画
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }
}