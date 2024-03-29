import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:test_a/functionwidgets/Counter.dart';
import 'package:test_a/scrollablewidgets/CustomScrollViewRoute.dart';
import 'package:test_a/scrollablewidgets/ListViewRoute.dart';
import 'package:test_a/scrollablewidgets/ScrollControllerRoute.dart';
import 'package:test_a/scrollablewidgets/ScrollNotificationRoute.dart';
import 'package:test_a/scrollablewidgets/SingleChildScrollViewRoute.dart';
import 'ConstrainedBoxAndSizedBoxRoute.dart';
import 'ContainerRoute.dart';
import 'DecoratedBoxRoute.dart';
import 'package:test_a/scrollablewidgets/GridViewRoute.dart';
import 'PaddingRoute.dart';
import 'TextRoute.dart';
import 'ButtonRoute.dart';
import 'ImageIconRoute.dart';
import 'SwitchCheckBoxRoute.dart';
import 'TextFieldRoute.dart';
import 'TextFieldFocusRoute.dart';
import 'FormRoute.dart';
import 'RowAndColumnRoute.dart';
import 'FlexLayoutRoute.dart';
import 'TransformRoute.dart';
import 'WrapAndFlowRoute.dart';
import 'StackAndPositionedRoute.dart';
import 'ScaffoldAndTabBarAndBottomNavigationBarRoute.dart';
import 'animation/AnimatedBuilderRoute.dart';
import 'animation/AnimatedSwitcherCounterRoute.dart';
import 'animation/ComposeComponentRoute.dart';
import 'animation/CustomPaintRoute.dart';
import 'animation/FadeRoute.dart';
import 'animation/HeroAnimationRoute.dart';
import 'animation/StaggerRoute.dart';
import 'fileandnetwork/DIORoute.dart';
import 'fileandnetwork/FileOperationRoute.dart';
import 'fileandnetwork/HttpRoute.dart';
import 'functionwidgets/DialogRoute.dart';
import 'functionwidgets/FutureAndStreamBuilderRoute.dart';
import 'functionwidgets/InheritedWidgetRoute.dart';
import 'functionwidgets/ProviderRoute.dart';
import 'functionwidgets/ThemeRoute.dart';
import 'functionwidgets/WillPopScopeRoute.dart';
import 'package:provider/provider.dart';

import 'handleeventandnotification/GestureDetectorRoute.dart';
import 'handleeventandnotification/NotificationRoute.dart';
import 'handleeventandnotification/PointerEventRoute.dart';

void main() => {
//  debugPrintMarkNeedsPaintStacks = true,
//  debugPrintMarkNeedsLayoutStacks = true,
//  debugPaintBaselinesEnabled = true,
  runApp(
      ChangeNotifierProvider<Counter>.value(
        notifier: Counter(1),
        child: MyApp(),
      )
  )
};

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      showSemanticsDebugger: true,
//      debugShowMaterialGrid: true,
//      showPerformanceOverlay: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
    Provider.of<Counter>(context,listen: false).add();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        leading: IconButton(icon: Icon(Icons.close), onPressed: (){
          print("leaading close");
        }),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          children: <Widget>[
            ListTile(title: Text("${Provider.of<Counter>(context).count}"),),
            FlatButton(
              child: Text("click to new route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new TextRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to button route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new ButtonRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to image icon route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new ImageIconRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to switch checkbox route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new SwitchCheckBoxRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to switch textfield form route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new TextFieldRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to switch TextField focus route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new TextFieldFocusRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to form route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new FormRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to Row and Column route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new RowAndColumnRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to FlexLayout route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new FlexLayoutRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to WrapAndFlow route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new WrapAndFlowRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to StackAndPositioned route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new StackAndPositionedRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to Padding route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new PaddingRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to ConstrainedBoxAndSizedBox route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new ConstrainedBoxAndSizedBoxRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to DecoratedBox route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new DecoratedBoxRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to TransformRoute route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new TransformRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to Container route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new ContainerRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to ScaffoldAndTabBarAndBottomNavigationBar route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new ScaffoldAndTabBarAndBottomNavigationBarRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to SingleChildScrollView route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new SingleChildScrollViewRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to ListView route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new ListViewRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to GridView route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new GridViewRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to CustomScrollView route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new CustomScrollViewRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to ScrollController route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new ScrollControllerRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to ScrollNotification route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new ScrollNotificationRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to WillPopScope route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new WillPopScopeRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to InheritedWidget route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new InheritedWidgetRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to Provider route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new ProviderRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to Theme route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new ThemeRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to FutureAndStreamBuilder route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new FutureAndStreamBuilderRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to Dialog route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new DialogRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to PointerEvent route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new PointerEventRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to GestureDetector route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new GestureDetectorRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to Notification route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new NotificationRoute();
                }));
              },
            ),
//    虽然下面的两种方法都可以实现自定义切换动画，但实际使用时应优先考虑使用PageRouteBuilder，这样无需定义一个新的路由类，使用起来会比较方便。但是有些时候PageRouteBuilder是不能满足需求的，例如在应用过渡动画时我们需要读取当前路由的一些属性，这时就只能通过继承PageRoute的方式了
            FlatButton(
              child: Text("click to AnimatedBuilder route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 500), //动画时间为500毫秒
                    pageBuilder: (BuildContext context, Animation animation,
                        Animation secondaryAnimation) {
                      return new FadeTransition(
                        //使用渐隐渐入过渡,
                        opacity: animation,
                        child: AnimatedBuilderRoute(), //路由B
                      );
                    },
                  ),
                );
              },
            ),

            FlatButton(
              child: Text("click to Fade route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, FadeRoute(builder: (context) {
                  return AnimatedBuilderRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to Hero route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new HeroAnimationRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to Stagger route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new StaggerRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to AnimatedSwitcherCounter route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new AnimatedSwitcherCounterRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to ComposeComponent route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new ComposeComponentRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to CustomPaint route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new CustomPaintRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to FileOperation route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new FileOperationRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to Http route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new HttpRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("click to DIO route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context){
                  return new DIORoute();
                }));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: 
      Builder(builder: (context){
        print("floatingActionButton Builder");
        return FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        );
      }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
