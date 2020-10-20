import 'package:bible_app/core/provider/bible.provider.dart';
import 'package:bible_app/core/utility/config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    Config.setScreenSize(screenSize.height/100, screenSize.width/100);
    Provider.of<BibleModel>(context, listen: false).getBibleText();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [
                Center(child:Text('Bible', style: TextStyle(fontWeight: FontWeight.bold, fontSize: Config.screenWidth * 6),)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:15.0),
                  child: Row(
                    children: [
                    Expanded(child:Card(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text('Old Testament', style: TextStyle(fontSize: Config.screenWidth * 4),)),
                    ))),
                    Expanded(child:Text('New Testament'))
                  ],),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
