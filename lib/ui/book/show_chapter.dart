import 'package:bible_app/core/provider/bible.provider.dart';
import 'package:bible_app/ui/constants/constant_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowChapter extends StatelessWidget {
  final String bookName;
  final int chapter;

  const ShowChapter({Key key, this.bookName, this.chapter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(child: back, onTap: () => Navigator.pop(context)),
          title: Text('$bookName   $chapter'),
          centerTitle: true,
        ),
        body: Consumer<BibleModel>(builder: (context, bibleModel, child) {
          List chapterVerses = bibleModel.bible
              .where((bibleData) =>
                  (bibleData.book == bookName) &&
                  (bibleData.chapter == chapter))
              .toList();

          return ListView.builder(
              itemCount: chapterVerses.length,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${chapterVerses[index].verse.toString()} ${ chapterVerses[index].text}'),
                );
              });
        }));
  }
}
