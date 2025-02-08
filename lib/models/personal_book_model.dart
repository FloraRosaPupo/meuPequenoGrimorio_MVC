import 'dart:convert';

import 'package:grimorio_arquitetura_mvc/models/google_book_model.dart';

class PersonalBook {
  int ? id;
  String dayStarted;
  String dayFinished;
  String comments;
  GoogleBook googleBook;

  //construtor
  PersonalBook({this.id, required this.dayStarted, required this.dayFinished, required this.comments, required this.googleBook});

  //map->objeto
  PersonalBook.fromMap(Map<String, dynamic> map) : id= map["id"], dayStarted = map["dayStarted"], dayFinished = map["dayFinished"], comments = map["comments"], googleBook = GoogleBook.fromJson(jsonDecode(map["googleBook"]))/*No bd é string ->Json-> objeto */;

  //objeto -> Map
  Map<String, dynamic> toMap() {
    return {"id": id, "googleBook": jsonEncode(googleBook.toMap()), "dayStarted": dayStarted, "dayFinished": dayFinished, "comments": comments};
  }
}
