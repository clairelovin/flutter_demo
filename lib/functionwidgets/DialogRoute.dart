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
              RaisedButton(
                child: Text("dialog with Checkbox"),
                onPressed: () async {
                  //弹出删除确认对话框，等待用户确认
                  bool deleteTree = await showDeleteConfirmDialog3(context);
                  if (deleteTree == null) {
                    print("取消删除");
                  } else {
                    print("同时删除子目录: $deleteTree");
                  }
                },
              ),
              RaisedButton(
                child: Text("dialog with Checkbox 优化"),
                onPressed: () async {
                  //弹出删除确认对话框，等待用户确认
                  bool deleteTree = await showDeleteConfirmDialog4(context);
                  if (deleteTree == null) {
                    print("取消删除");
                  } else {
                    print("同时删除子目录: $deleteTree");
                  }
                },
              ),
              RaisedButton(
                child: Text("显示底部菜单列表"),
                onPressed: () async {
                  int type = await _showModalBottomSheet(context);
                  print(type);
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


  Future<bool> showDeleteConfirmDialog3(BuildContext context) {
    bool _withTree = false; //记录复选框是否选中
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),
                  DialogCheckbox(
                    value: _withTree, //默认不选中
                    onChanged: (bool value) {
                      //更新选中状态
                      _withTree = !_withTree;
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                // 将选中状态返回
                Navigator.of(context).pop(_withTree);
              },
            ),
          ],
        );
      },
    );
  }

  Future<bool> showDeleteConfirmDialog4(BuildContext context) {//优化
    bool _withTree = false;
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  Text("同时删除子目录？"),
                  // 通过Builder来获得构建Checkbox的`context`，
                  // 这是一种常用的缩小`context`范围的方式
                  Builder(
                    builder: (BuildContext context) {
                      return Checkbox(
                        value: _withTree,
                        onChanged: (bool value) {
                          // 直接将对话框UI对应的Element标记为dirty
                          (context as Element).markNeedsBuild();
                          _withTree = !_withTree;
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                // 执行删除操作
                Navigator.of(context).pop(_withTree);
              },
            ),
          ],
        );
      },
    );
  }

  // 弹出底部菜单列表模态对话框
  Future<int> _showModalBottomSheet(BuildContext context) {
    return showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: () => Navigator.of(context).pop(index),
            );
          },
        );
      },
    );
  }

}

// 单独封装一个内部管理选中状态的复选框组件
class DialogCheckbox extends StatefulWidget {
  DialogCheckbox({
    Key key,
    this.value,
    @required this.onChanged,
  });

  final ValueChanged<bool> onChanged;
  final bool value;

  @override
  _DialogCheckboxState createState() => _DialogCheckboxState();
}

class _DialogCheckboxState extends State<DialogCheckbox> {
  bool value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (v) {
        //将选中状态通过事件的形式抛出
        widget.onChanged(v);
        setState(() {
          //更新自身选中状态
          value = v;
        });
      },
    );
  }
}

