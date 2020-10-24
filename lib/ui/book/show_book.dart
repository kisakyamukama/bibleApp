import 'package:bible_app/core/model/bible.model.dart';
import 'package:bible_app/ui/book/show_chapter.dart';
import 'package:bible_app/ui/constants/constant_widgets.dart';
import 'package:flutter/material.dart';

class ShowBook extends StatelessWidget {
  final BibleBookWithChapters book;

  const ShowBook({Key key, this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(child: back, onTap: ()=>Navigator.pop(context)),
        title: Text(book.name),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),
        itemCount: book.chapters,
        itemBuilder: (BuildContext context, index) {
          return InkWell(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> ShowChapter(bookName: book.name,chapter: index) )),
                      child: Card(
              child: Center(child: Text('${++index}')),
            ),
          );
        },
      ),
    );
  }
}
