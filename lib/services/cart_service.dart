import 'dart:convert';

import 'package:eshemachoch_mobile_application/constants/api.dart';
import 'package:eshemachoch_mobile_application/models/order.dart';
import 'package:http/http.dart' as http;

class CartService {
  CartService(this.client);
  final http.Client client;

  final Uri uri = Uri.parse('$BASEURL/orders');

  Future<String> generateCheckoutUrl(Order order) async {
    String uri = 'https://testapi.yenepay.com/api/urlgenerate/getcheckouturl/';
    Map body = {
      "process": order.products.length == 1 ? "Express" : "Cart",
      // "ipnUrl": "$BASEURL/payments",
      "merchantId": "SB1241",
      "merchantOrderId": DateTime.now().millisecondsSinceEpoch.toString(),
      "items": order.products
          .map((product) => {
                "itemId": product.id,
                "itemName": product.name,
                "unitPrice": product.price,
                "quantity": product.quantity
              })
          .toList(),
    };
    final result = await http.post(Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body));
    return (jsonDecode(result.body) as Map)['result'];
  }
}
