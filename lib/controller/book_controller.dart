import 'package:grimorio_arquitetura_mvc/dao/book_database.dart';
import 'package:grimorio_arquitetura_mvc/models/google_book_model.dart';
import 'package:grimorio_arquitetura_mvc/models/personal_book_model.dart';

class BookController {

  PersonalBookDatabase personalBookDatabase = PersonalBookDatabase();   

 void addBook(GoogleBook googleBook, String dayStarted, String dayFinished, String comments) {
   
   PersonalBook newBook = PersonalBook(
     dayFinished: dayFinished,
      dayStarted: dayStarted,
      comments: comments,
      googleBook: googleBook,);

      personalBookDatabase.save(newBook);
      //banco de dados
 }



  Future<List<PersonalBook>> getBooks() async {
    return personalBookDatabase.findAll();
  }


  void updateBook(PersonalBook personalBook) {
    personalBookDatabase.save(personalBook);
  }

  void deleteBook(PersonalBook personalBook) {
    personalBookDatabase.delete(personalBook);
  }
}