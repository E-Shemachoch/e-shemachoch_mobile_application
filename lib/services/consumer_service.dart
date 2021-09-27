import 'dart:convert';
import 'dart:io';

import 'package:eshemachoch_mobile_application/constants/api.dart';
import 'package:eshemachoch_mobile_application/models/consumer.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ConsumerService {
  ConsumerService(this.client);
  final http.Client client;
  final storage = FlutterSecureStorage();

  final Uri uri = Uri.parse('$BASEURL/consumers');

  Future<bool> checkExistence(String phoneNumber) async {
    final Uri uri = Uri.parse('$BASEURL/consumers/check/$phoneNumber');

    final response = await client.get(uri);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body) as Map;
      return result['success'];
    } else {
      throw Exception('Failed to Check Consumer.');
    }
  }

  Future<Consumer> loginConsumer(String idToken) async {
    final Uri uri = Uri.parse('$BASEURL/consumers/login');
    final response = await client.get(
      uri,
      headers: {
        HttpHeaders.authorizationHeader: idToken,
      },
    );
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      final consumer = Consumer.fromJson(result);
      await storage.write(
          key: 'consumer', value: jsonEncode(consumer.toJson()));
      return consumer;
    } else {
      throw Exception('Failed to Check Consumer.');
    }
  }

  Future<Consumer> loadConsumer() async {
    String? consumer = await storage.read(key: 'consumer');
    if (consumer == null) throw Exception('Failed to load consumer');
    return Consumer.fromJson(jsonDecode(consumer));
  }

  Future<void> logoutConsumer() async {
    await storage.delete(key: 'consumer');
  }
}
