import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Document: https://flutter.dev/docs/cookbook/design/snackbars
class MySnackBar extends StatefulWidget {
  @override
  _MySnackBarState createState() => _MySnackBarState();
}

class _MySnackBarState extends State<MySnackBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Snack Bar Test'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 1. SnackBar with Builder!!
            Builder(builder: (BuildContext childContext) {
              return Center(
                child: FlatButton(
                  child: Text('SnackBar with Builder widget',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  color: Colors.red,
                  onPressed: () {
                    Scaffold.of(childContext).showSnackBar(SnackBar(
                      content: Text('This is SnackBar!!'),
                      duration: Duration(microseconds: 500),
                    ));
                  },
                ),
              );
            }),

            // 2. Custom SnackBar widget
            CustomSnackBar('Custom SnackBar widget'),

            // 3. SnackBar with Flutter Toast library
            FlatButton(
              onPressed: () {
                flutterToast();
              },
              child: Text('Flutter Toast Library'),
              color: Colors.blue,
            )
          ],
        ));
  }
}

class CustomSnackBar extends StatelessWidget {
  final String _title;

  CustomSnackBar(this._title);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text(_title),
        onPressed: () {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(
              'Snack Bar with custom widget!!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.teal,
            duration: Duration(microseconds: 500),
          ));
        },
      ),
    );
  }
}

void flutterToast() {
  Fluttertoast.showToast(
      msg: 'Flutter Toast',
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.redAccent,
      fontSize: 20.0,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT);
}
