import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/book_model.dart';
import '../models/spell_model.dart';

class ApiProvider {
  static const String _baseUrl = 'https://potterapi-fedeperin.vercel.app/en';

  Future<List<BookModel>> getBooks() async {
    final response = await http.get(Uri.parse('$_baseUrl/books'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => BookModel.fromJson(json)).toList();
    }
    throw Exception('Failed to load books: ${response.statusCode}');
  }

  Future<List<SpellModel>> getSpells() async {
    final response = await http.get(Uri.parse('$_baseUrl/spells'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => SpellModel.fromJson(json)).toList();
    }
    throw Exception('Failed to load spells: ${response.statusCode}');
  }
}
