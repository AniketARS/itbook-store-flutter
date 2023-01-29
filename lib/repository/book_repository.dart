import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/book.dart';

class BookRepository {
  final String baseUrl = "https://api.itbook.store/1.0/";

  Future<List<Book>> getNewBooks() async {
    final url = '${baseUrl}new';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body)['books'] as List;
      final result = json.map((e) => Book.fromJson(e)).toList();
      return result;
    } else {
      throw "Something went wrong, code ${response.statusCode}";
    }
  }

  Future<List<Book>> searchBook(String query) async {
    final url = '$baseUrl/search/$query';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body)['books'] as List;
      final result = json.map((e) => Book.fromJson(e)).toList();
      return result;
    } else {
      throw "Something went wrong, code ${response.statusCode}";
    }
  }
}
