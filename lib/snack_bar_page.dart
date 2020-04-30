import 'package:flutter/material.dart';

// Document: https://flutter.dev/docs/cookbook/design/snackbars
class SnackBarPage extends StatefulWidget {
  @override
  _SnackBarPageState createState() => _SnackBarPageState();
}

class _SnackBarPageState extends State<SnackBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Snack Bar Test'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Builder(builder: (BuildContext childContext) {
          return Center(
            child: FlatButton(
              child: Text('Show me',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              color: Colors.red,
              onPressed: () {
                Scaffold.of(childContext).showSnackBar(SnackBar(
                  content: Text('This is SnackBar!!'),
                ));
              },
            ),
          );
        }));
  }
}
