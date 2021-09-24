import 'dart:convert';

import 'package:eshemachoch_mobile_application/constants/api.dart';
import 'package:eshemachoch_mobile_application/models/product.dart';
import 'package:http/http.dart' as http;

class ProductService {
  ProductService(this.client);
  final http.Client client;

  final Uri uri = Uri.parse('$BASEURL/products');

  Future<List<Product>> getProducts() async {
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      final products = jsonDecode(response.body) as List;
      return products.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products.');
    }
  }
}
