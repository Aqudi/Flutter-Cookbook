import 'package:flutter/material.dart';

class MyOrientationBuilder extends StatefulWidget {
  @override
  _MyOrientationBuilderState createState() => _MyOrientationBuilderState();
}

class _MyOrientationBuilderState extends State<MyOrientationBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OrientationBuilder'),
      ),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
            children: List.generate(50, (position) {
              return Center(
                child: Text('Item $position'),
              );
            }),
          );
        },
      ),
    );
  }
}
