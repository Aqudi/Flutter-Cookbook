import 'package:flutter/material.dart';

class PushPopPage extends StatefulWidget {
  @override
  _PushPopPageState createState() => _PushPopPageState();
}

class _PushPopPageState extends State<PushPopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('First Page'),
          backgroundColor: Colors.green,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text("Test Navigator's push pop methods",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            RaisedButton(
              child: Text('Go to SecondPage'),
              color: Colors.blue,
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage())),
            ),
            RaisedButton(
              child: Text('Go to ThirdPage (no AppBar)'),
              color: Colors.amber,
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdPage())),
            )
          ],
        ));
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second Page'),
          backgroundColor: Colors.green,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text("Press AppBar's Back button",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ],
        ));
  }
}

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text("No AppBar",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        RaisedButton(
          child: Text('Back to the FirstPage'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    ));
  }
}
