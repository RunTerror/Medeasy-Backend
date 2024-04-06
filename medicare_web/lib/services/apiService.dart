import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiProvider extends ChangeNotifier {
  // final String baseUrl = 'https://api.example.com';

  final String baseUrl = 'http://0.0.0.0:8000';

  // final String modelUrl = '';

  Future<http.Response> get(String endpoint) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<http.Response> post(String endpoint, dynamic data) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/$endpoint'),
        body: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
