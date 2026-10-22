import 'package:flutter_test/flutter_test.dart';
import 'package:grimorio_arquitetura_mvc/models/google_book_model.dart';
import 'package:grimorio_arquitetura_mvc/models/personal_book_model.dart';
void main() {
  test('livro sem detalhes opcionais continua disponível', () {
    final book=GoogleBook.fromApi({'id':'a','volumeInfo':{}});
    expect(book.title,'Titulo desconhecido');
    expect(book.authors,'Autor Desconhecido');
  });
  test('registro de leitura preserva os dados após serialização', () {
    final book=PersonalBook(id:1,dayStarted:'2026-10-21',dayFinished:'',comments:'Teste',
      googleBook:GoogleBook(id:'a',title:'Livro',authors:'Autora',description:'Texto',thumbnailLink:''));
    final restored=PersonalBook.fromMap(book.toMap());
    expect(restored.googleBook.title,'Livro');
    expect(restored.comments,'Teste');
    expect(restored.id,1);
  });
}
