import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:machine_test_zartek/app/config/api_url.dart';
import 'package:machine_test_zartek/app/model/item_model.dart';

class CategoryRepository {
  Future<List<ItemModel>> getItems() async {
    final uri = Uri.parse(AppUrl.baseUrl);
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.map((json) => ItemModel.fromJson(json)).toList();
      } else {
        return Future.error('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      return Future.error('An error occurred: $e');
    }
  }
}
