import 'package:bible_app/core/utility/config.dart';
import 'package:flutter/material.dart';

class TestamentLabel extends StatelessWidget {
  final String testamentName;

  const TestamentLabel({Key key, this.testamentName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
      child: Text(
    '$testamentName Testament',
    style: TextStyle(fontSize: Config.screenWidth * 4),
      )),
    ));
  }
}
