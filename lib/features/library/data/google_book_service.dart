import 'dart:convert';
import 'package:grimorio_arquitetura_mvc/features/library/domain/google_book_model.dart';
import 'package:http/http.dart' as http;

class GoogleBooksService {
  final http.Client? client;
  GoogleBooksService({this.client});

  Future<List<GoogleBook>> searchBooks(String name) async {
    if (name.trim().isEmpty) return [];
    final uri = Uri.https(
        'www.googleapis.com', '/books/v1/volumes', {'q': name.trim()});
    final response = await (client?.get ?? http.get)(uri);
    if (response.statusCode != 200)
      throw StateError('Falha na busca de livros.');
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final items = data['items'] as List<dynamic>? ?? [];
    return items
        .map((item) => GoogleBook.fromApi(item as Map<String, dynamic>))
        .toList();
  }
}
