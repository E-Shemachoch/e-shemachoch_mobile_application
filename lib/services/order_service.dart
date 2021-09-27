import 'dart:convert';

import 'package:eshemachoch_mobile_application/constants/api.dart';
import 'package:eshemachoch_mobile_application/models/order.dart';
import 'package:http/http.dart' as http;

class OrderService {
  OrderService(this.client);
  final http.Client client;

  final Uri uri = Uri.parse('$BASEURL/orders');

  Future<List<Order>> getOrders(String consumerId) async {
    final Uri uri = Uri.parse('$BASEURL/orders/consumers/$consumerId');
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      final orders = jsonDecode(response.body) as List;
      return orders.map((json) => Order.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load orders.');
    }
  }

  addOrder(Order order) async {
    final response = await client.post(
      uri,
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(order.toJson()),
    );
    if (response.statusCode == 200) {
      return Order.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create order.');
    }
  }
}
