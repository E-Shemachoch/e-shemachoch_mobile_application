import 'dart:io';

import 'package:eshemachoch_mobile_application/constants/api.dart';
import 'package:eshemachoch_mobile_application/viewmodels/consumer/consumer_model.dart';
import 'package:eshemachoch_mobile_application/views/orders/qrcode_page.dart';
import 'package:eshemachoch_mobile_application/models/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyOrderDetail extends StatelessWidget {
  const MyOrderDetail({Key? key, required this.order}) : super(key: key);
  final Order order;
  @override
  Widget build(BuildContext context) {
    final consumer = context.read<ConsumerModel>().consumer!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Detail'),
      ),
      body: ListView(children: [
        ...List.generate(
          order.products.length,
          (index) {
            final product = order.products[index];
            return ListTile(
              leading: Image.network('$BASEURL/products/images/${product.image}',
                  fit: BoxFit.cover,
                  headers: {
                    HttpHeaders.authorizationHeader: consumer.token!,
                  }),
              title: Text(product.name),
              subtitle: Text('${product.price} ETB'),
              trailing: Text('X ${order.products[index].quantity}'),
            );
          },
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              child: Text('Claim'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return MyQRCodePage(order: order);
                }));
              },
            ),
          ),
        )
      ]),
    );
  }
}
