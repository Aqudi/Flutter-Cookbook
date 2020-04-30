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
  List _pages = [
    SnackBarPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home page'),
        ),
        body: Center(
            child: Text('Home page with drawer menu',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Flutter example list'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(title: Text('SnackBar'), onTap: () {
              Navigator.push(context, _pages[0]);
            })
          ],
        )));
  }
}
