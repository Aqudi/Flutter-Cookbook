import 'package:flutter/material.dart';
import 'package:flutterexamples/snack_bar_page.dart';

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // GlobalKey to open drawer
  // <ScaffoldState> is needed
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  final List _pages = [
    SnackBarPage(),
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
          children: <Widget>[
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
                leading: Icon(Icons.adjust),
                title: Text('SnackBar'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => _pages[0]));
                }),
            ListTile(
                leading: Icon(Icons.close),
                title: Text('Close drawer'),
                onTap: () {
                  Navigator.of(context).pop();
                })
          ],
        )));
  }
}
