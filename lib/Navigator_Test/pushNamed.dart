import 'package:flutter/material.dart';


class PushNamedA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PushNamedA'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: Colors.green,
              child: Text('Go to PushNamedB'),
              onPressed: () {
                Navigator.pushNamed(context, '/b');
              },
            ),
            RaisedButton(
              color: Colors.green,
              child: Text('Go to PushNamedC'),
              onPressed: () {
                Navigator.pushNamed(context, '/c');
              },
            )
          ],
        ),
      )
    );
  }
}

class PushNamedB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PushNamedB'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            ],
          ),
        )
    );
  }
}

class PushNamedC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PushNamedC'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

            ],
          ),
        )
    );
  }
}
