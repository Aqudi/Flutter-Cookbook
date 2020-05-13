import 'package:flutter/material.dart';
import 'package:flutterexamples/pages/MyAnimatedContainer.dart';
import 'package:flutterexamples/pages/MyAnimatedOpacity.dart';
import 'package:flutterexamples/pages/MyFormValidation.dart';
import 'package:flutterexamples/pages/MyOrientationBuilder.dart';
import 'package:flutterexamples/pages/MyPageView.dart';
import 'package:flutterexamples/pages/MySwipeToDismiss.dart';
import 'package:flutterexamples/pages/MyTabController.dart';
import 'package:flutterexamples/pages/Navigator/pushNamed.dart';
import 'package:flutterexamples/pages/Navigator/pushNamed_with_arguments.dart';
import 'package:flutterexamples/pages/Navigator/push_pop.dart';
import 'package:flutterexamples/pages/MySnackBar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // Navigation - pushNamed
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/b': (context) => PushNamedB(),
        '/c': (context) => PushNamedC(),

        // pushNamed Arguments 전달 방법1: 페이지로 가서 ModalRoute.of(context) 로 settings 추출
        ExtractArgumentsPage.routeName: (context) => ExtractArgumentsPage()
      },

      // pushNamed Arguments 전달 방법2: onGenerateRoute 에서 Route 할 때 추출
      // ignore: missing_return
      onGenerateRoute: (settings) {
        /*
        // settings type : RouteSettings
        
        const RouteSettings({
          String name, // 라우터 이름
          bool isInitialRoute: false, // 초기 라우터여부
          Object arguments // 인자들
        })
        */
        if (settings.name == PassArgumentsPage.routeName) {
          final Arguments args = settings.arguments;

          return MaterialPageRoute(builder: (context) {
            return PassArgumentsPage(
              title: args.title,
              message: args.message,
            );
          });
        }
      },

      //home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // GlobalKey to open drawer
  // <ScaffoldState> is needed
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  final List _pages = [
    [MySnackBar(), 'SnackBar'],
    [PushPopPage(), 'Divider'],
    [PushNamedPage(), 'Navigator - PushPop'],
    [PushNamedWithArguments(), 'Navigator - PushNamed'],
    [MyAnimatedContainer(), 'Navigator - PushNamed with arguments'],
    [MyAnimatedOpacity(), 'Divider'],
    [MyOrientationBuilder(), 'AnimatedContainer'],
    [MyTabController(), 'AnimatedOpacity'],
    [MyFormValidation(), 'OrientationBuilder'],
    [MySwipeToDismiss(), 'Dismissible SwipeToDismiss'],
    [MyPageView(), 'PageView - Slide page'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Home page'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text('Home page with drawer menu',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            RaisedButton(
              child: Text('Tap to open drawer'),
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            )
          ],
        ),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: _buildDrawer(context),
        )));
  }

  _buildDrawer(context) {
    List<Widget> itemList = [
      // It looks like play store drawer menu
      UserAccountsDrawerHeader(
        accountName: Text('태정 허'),
        accountEmail: Text('Aqudi:Github.com'),
        currentAccountPicture: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1588102023869-d23e5daa0c45?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
          backgroundColor: Colors.white,
        ),

        // It looks like when i have multiple google accounts on play store
        otherAccountsPictures: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1588104203354-1d14a1971335?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
            backgroundColor: Colors.white,
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1588008239255-774ff927d529?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
            backgroundColor: Colors.white,
          ),
        ],
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
      ListTile(
          leading: Icon(Icons.close),
          title: Text('Close drawer'),
          onTap: () {
            Navigator.of(context).pop();
          })
    ];
    List<Widget> menuList = List.generate(_pages.length,
        (index) => MyListTile(_pages[index][0], _pages[index][1]));
    itemList.addAll(menuList);
    return itemList;
  }
}

class MyListTile extends StatelessWidget {
  final _name;
  final _page;

  MyListTile(this._page, this._name);

  @override
  Widget build(BuildContext context) {
    return (_name != "Divider")
        ? ListTile(
            title: Text(_name),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => _page));
            },
          )
        : Divider(thickness: 3.0);
  }
}
