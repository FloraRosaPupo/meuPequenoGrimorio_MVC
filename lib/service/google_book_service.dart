
// ignore: depend_on_referenced_packages
import 'package:grimorio_arquitetura_mvc/models/google_book_model.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class GoogleBooksService {
  static const String baseUrl = "https://www.googleapis.com/books/v1/volumes";
  
  get json => null;

  Future<List<GoogleBook>> searchBooks(String name) async {
    if(name != "") {
      http.Response httpResponse = await http.get(Uri.parse("$baseUrl/?q=$name"));

      Map<String, dynamic> response = json.decode(httpResponse.body);
      List listResponse = response["items"];

      List<GoogleBook> listResult = [];
      for (int i = 0; i < listResponse.length; i++) {
        listResult.add(GoogleBook.fromApi(listResponse[i]));
      }

      return listResult;
    }
    return List.empty();
  }
}


