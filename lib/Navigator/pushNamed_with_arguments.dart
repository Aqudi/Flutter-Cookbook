import 'package:flutter/material.dart';

class PushNamedWithArguments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Navigator.pushNamed Test'),
          backgroundColor: Colors.green,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Text(
              "Test Navigator's pushNamed methods with arguments",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )),
            RaisedButton(
                child: Text('Navigate to screen that extracts arguments'),
                color: Colors.blue,
                onPressed: () => Navigator.pushNamed(
                    context, PassArgumentPage.routeName,
                    arguments: Arguments('Extract Arguments Screen',
                        'This message is extracted in the build method.'))),
            RaisedButton(
                child: Text('Navigate to a named that accepts arguments'),
                color: Colors.blue,
                onPressed: () => Navigator.pushNamed(
                    context, PassArgumentPage.routeName,
                    arguments: Arguments('Hello argumnets',
                        'This message is extracted in the onGenerateRoute function'))),
          ],
        ));
  }
}

class ExtractArgumentsPage extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    final Arguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}

class PassArgumentPage extends StatelessWidget {
  static const routeName = '/passArguments';

  final String title;
  final String message;

  const PassArgumentPage({
    Key key,
    @required this.title,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}

class Arguments {
  final String title;
  final String message;

  Arguments(this.title, this.message);
}
