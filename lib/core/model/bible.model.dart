class Bible {
  final String book;
  final int chapter;
  final int verse;
  final String text;

  Bible({this.book, this.chapter, this.verse, this.text});

  factory Bible.fromJson(Map<String, dynamic> json){
    return Bible(
      book: json['Book'],
      chapter: json['Chapter'],
      verse:json['Verse'],
      text:json['Text']
    );
  }




}

class Book {
  final String name;
  final List<Chapter> chapter;

  Book({this.name, this.chapter});

  factory Book.fromJson(Map<String, dynamic> json){
    return Book(
      name: json['Book'],
      chapter: json['Chapter'].map((row) => Chapter.fromJson(row)).toList()
    );
  }
}

class Chapter{
  final int chapter;
  final List<Verse> verse;

  Chapter({this.chapter, this.verse});
  factory Chapter.fromJson(Map<String, dynamic> json){
    return Chapter(
      chapter: json['chapter'],
      verse: json['verse']
    );
  }
}

class Verse {
  final int verse;
  final String text;

  Verse({this.verse, this.text});

  factory Verse.fromJson(Map<String, dynamic> json){
    return Verse(
      verse: json['Verse'],
      text: json['Text']
    );
  }

}