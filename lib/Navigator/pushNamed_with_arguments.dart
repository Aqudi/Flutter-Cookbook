import 'package:flutter/material.dart';

class PushNamedWithArguments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PushNamed with arguments'),
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
                    context, ExtractArgumentsPage.routeName,
                    arguments: Arguments('Extract Arguments Page',
                        'This message is extracted in the build method.'))),
            RaisedButton(
                child: Text('Navigate to a named that accepts arguments'),
                color: Colors.blue,
                onPressed: () => Navigator.pushNamed(
                    context, PassArgumentsPage.routeName,
                    arguments: Arguments('Pass Arguments Page',
                        'This message is extracted in the onGenerateRoute function'))),
          ],
        ));
  }
}

class ExtractArgumentsPage extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    // context 에서 arguments 추출
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

class PassArgumentsPage extends StatelessWidget {
  static const routeName = '/passArguments';

  final String title;
  final String message;

  // 인자로 arguments 넘겨받기
  const PassArgumentsPage({
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
