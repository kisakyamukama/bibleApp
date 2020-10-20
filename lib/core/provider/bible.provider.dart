import 'dart:convert';

import 'package:bible_app/core/model/bible.model.dart';
import 'package:bible_app/core/repository/repository.dart';
import 'package:flutter/foundation.dart';
class BibleModel extends ChangeNotifier {
  Repository _repository = Repository();
  List _bible;
  List get bible => _bible;




  Future getBibleText() async {
    await _repository.getBible('assets/bibleJson/bible.json').then((bibleData) {
       var decodedJson = jsonDecode(bibleData);
       // print(decodedJson);
       List bibleText = decodedJson.map((row) =>  Bible.fromJson(row)).toList();
      print(bibleText.length);
      print(bibleText[0]);

      bibleText.forEach((element) {
        print(element.book);
        while()


    });

  });
        }



}