import 'package:asdfg/screens/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  Future<List<dynamic>> fetchProduct() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products/'));
    if (response.statusCode == 200) {
      return productModelFromJson(response.body);//GIVEN FUNCTION IN MODEL 
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
