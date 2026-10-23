import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:grimorio_arquitetura_mvc/features/library/data/google_book_service.dart';

void main() {
  test('resposta sem itens resulta em lista vazia', () async {
    final client =
        MockClient((_) async => http.Response('{"totalItems":0}', 200));
    addTearDown(client.close);
    expect(
        await GoogleBooksService(client: client).searchBooks('Livro'), isEmpty);
  });
  test('termos são codificados e os resultados decodificados', () async {
    final client = MockClient((request) async {
      expect(request.url.queryParameters['q'], 'A & B');
      return http.Response(
          '{"items":[{"id":"1","volumeInfo":{"title":"Livro"}}]}', 200);
    });
    addTearDown(client.close);
    expect(
        (await GoogleBooksService(client: client).searchBooks('A & B'))
            .single
            .title,
        'Livro');
  });
  test('falha do provedor não é confundida com ausência de livros', () async {
    final client = MockClient((_) async => http.Response('', 500));
    addTearDown(client.close);
    expect(GoogleBooksService(client: client).searchBooks('Livro'),
        throwsStateError);
  });
}
