import 'dart:convert';

import 'package:eshemachoch_mobile_application/constants/api.dart';
import 'package:eshemachoch_mobile_application/models/notice.dart';
import 'package:http/http.dart' as http;

class NoticeService {
  NoticeService(this.client);
  final http.Client client;

  final Uri uri = Uri.parse('$BASEURL/notices');

  Future<List<Notice>> getNotices() async {
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      final notices = jsonDecode(response.body) as List;
      return notices.map((json) => Notice.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load notices.');
    }
  }
}
