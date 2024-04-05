import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:medicare_web/models/apiModel.dart';
import 'package:medicare_web/services/apiService.dart';

class MyDataProvider extends ChangeNotifier {
  final ApiProvider apiProvider;

  MyDataProvider({required this.apiProvider});

  List<MyData> myDataList = [];

  Future<void> fetchData() async {
    final response = await apiProvider.get('my-endpoint');
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      myDataList = jsonData.map((data) => MyData.fromJson(data)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> postData(Map<String, dynamic> data) async {
    final response = await apiProvider.post('my-endpoint', data);
    if (response.statusCode == 201) {
      fetchData(); // Reload data after successful post
    } else {
      throw Exception('Failed to post data');
    }
  }
}
