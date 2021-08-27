import 'package:bible_app/core/model/bible.model.dart';
import 'package:bible_app/core/utility/config.dart';
import 'package:bible_app/ui/book/show_book.dart';
import 'package:flutter/material.dart';

class ShowTestamentBooks extends StatelessWidget {
  final List<BibleBookWithChapters> books;

  const ShowTestamentBooks({Key key, this.books}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Config.screenHeight * 80,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: books.length,
          itemBuilder: (BuildContext context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: Row(
                    children: [
                      Text('${++index}'),
                      SizedBox(width: 10.0),
                      Text(books[--index].name)
                    ],
                  ),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ShowBook(book: books[index]))),
                ),
              )),
    );
  }
}
