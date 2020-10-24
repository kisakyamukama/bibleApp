import 'dart:convert';

import 'package:bible_app/core/model/bible.model.dart';
import 'package:bible_app/core/repository/repository.dart';
import 'package:flutter/foundation.dart';

class BibleModel extends ChangeNotifier {
  final String path = 'assets/bibleJson/';
  Repository _repository = Repository();
  List _bible = [];
  List<BibleBookWithChapters> _oldTestamentBooks = [];
  List<BibleBookWithChapters> _newTestamentBooks = [];
  List _chaptersPerBook = [];

  List get bible => _bible;
  List get oldTestamentBooks => _oldTestamentBooks;
  List get newTestamentBooks => _newTestamentBooks;
  List get chaptersPerBook => _chaptersPerBook;

  Future getBibleText() async {
    await _repository.getBible(path + 'bible.json').then((bibleData) {
      var decodedJson = jsonDecode(bibleData);
      List bibleText = decodedJson.map((row) => Bible.fromJson(row)).toList();     
      _bible = bibleText;
    });
    notifyListeners();
  }

  Future getBibleBook() async {
    print('called');
    await _repository
        .getBible(path + 'bible_books.json')
        .then((bibleBooksList) {
      var decodedJson = jsonDecode(bibleBooksList);
      List bibleBooks =
          decodedJson.map((book) => BibleBook.fromJson(book)).toList();
      partitionBooks(bibleBooks);
    });
    notifyListeners();
  }

  void partitionBooks(bibleBooks) {
    try {
      // partition books
      _oldTestamentBooks = [];
      _newTestamentBooks = [];
      for (int i = 0; i < bibleBooks.length; i++) {
        if (i < 39) {
          _oldTestamentBooks.add(bibleBooks[i]);
        } else {
          _newTestamentBooks.add(bibleBooks[i]);
        }
      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  Future getChapterPerBook() async {
    await _repository.getBible(path + 'chapter_per_book.json').then((data) {
      var decodedJson = jsonDecode(data);
      // print(decodedJson.length); // 1 then no looping else loop
      final sourceMap = decodedJson.first;
      // print(sourceMap);
      final books = sourceMap.keys;
      List chapters = [];
      for (var book in books) {
        var bibleBook_ = {'name': book, 'chapters': sourceMap[book]};

        chapters.add(bibleBook_);
      }
      List bookChapters = [];
      chapters.forEach((book) {
        bookChapters.add(BibleBookWithChapters.fromJson(book));
      });

      partitionBooks(bookChapters);
    });
    notifyListeners();
  }
}
