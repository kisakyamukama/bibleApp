import 'package:bible_app/core/provider/bible.provider.dart';
import 'package:bible_app/core/utility/config.dart';
import 'package:bible_app/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_) => BibleModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bible App ',
        theme: ThemeData(
          fontFamily: 'Lato',
           primarySwatch: Colors.teal,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}