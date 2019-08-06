import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ScaffoldAndTabBarAndBottomNavigationBarRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ScaffoldAndTabBarAndBottomNavigationBarRouteState();
  }
}

class _ScaffoldAndTabBarAndBottomNavigationBarRouteState extends State<ScaffoldAndTabBarAndBottomNavigationBarRoute> with SingleTickerProviderStateMixin{
  static GlobalKey<ScaffoldState> _globalKey = new GlobalKey();
  var _selectedIndex = 1;

  TabController _tabController ;
  List tabs = ["新闻","历史","图片",];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener((){
      switch(_tabController.index){
        case 0:
          print("select 0");
          break;
        case 1:
          print("select 1");
          break;
        case 2:
          print("select 2");
          break;
        case 3:
          print("select 3");
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text("ScaffoldAndTabBarAndBottomNavigationBarRoute"),
        leading: IconButton(
            icon: Builder(builder: (context){
              return IconButton(icon: Icon(Icons.dashboard), onPressed: (){
//                Scaffold.of(context).openDrawer();
                _globalKey.currentState.openDrawer(); //通过GlobalKey来获取State对象
              });
            })),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: (){
            print("导航栏 分享");
          })
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e)=>Tab(text: e,)).toList(),
        ),
      ),
      drawer: MyDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e){
          return Container(
            alignment: Alignment.center,
            child: Text(e,textScaleFactor: 5,),
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            IconButton(icon: Icon(Icons.home), onPressed: (){
              _tabController.animateTo(0);
            }),
            SizedBox(),
            IconButton(icon: Icon(Icons.business), onPressed: (){
              _tabController.animateTo(1);
            }),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            final wordPair = new WordPair.random();
            debugPrint("随机字符串："+wordPair.toString());
            debugDumpApp();
//          debugDumpRenderTree();
//          debugDumpLayerTree();
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class MyDrawer extends StatelessWidget{
  const MyDrawer({Key key,}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 38),
                child: Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      child: ClipOval(
                        child: Image.asset("images/icon.png",width: 80,),
                      ),
                    ),
                    Text(
                      "clairelovin",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.add),
                      title: Text("Add account"),
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text("Manage accounts"),
                    ),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}