import 'dart:io';

import 'package:eshemachoch_mobile_application/constants/api.dart';
import 'package:eshemachoch_mobile_application/viewmodels/cart/cart_model.dart';
import 'package:eshemachoch_mobile_application/viewmodels/consumer/consumer_model.dart';
import 'package:eshemachoch_mobile_application/viewmodels/order/order_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({Key? key}) : super(key: key);

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  bool paymentCompleted = false;
  @override
  Widget build(BuildContext context) {
    final consumer = context.read<ConsumerModel>().consumer!;
    launchURL(url) async {
      await launch(url);
      setState(() {
        paymentCompleted = true;
      });
    }

    return Consumer<CartModel>(
      builder: (context, model, child) {
        if (model.order == null) return Text('Cart Empty.');
        var totalPrice = 0.0;
        var totalQuantity = 0;
        model.order!.products.forEach((product) {
          totalPrice += product.price * product.quantity;
          totalQuantity += product.quantity;
        });
        return ListView(
          children: [
            ...List.generate(
              model.order!.products.length,
              (index) {
                final product = model.order!.products[index];
                return ListTile(
                  leading: Image.network(
                      '$BASEURL/products/images/${product.image}',
                      fit: BoxFit.cover,
                      headers: {
                        HttpHeaders.authorizationHeader: consumer.token!,
                      }),
                  title: Text(product.name),
                  subtitle: Text('${product.price} ETB'),
                  trailing: Text('X ${model.order!.products[index].quantity}'),
                );
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Total',
                      textAlign: TextAlign.right,
                    ),
                    Text('$totalPrice ETB', textAlign: TextAlign.right),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: Text(paymentCompleted ? 'MADE MY PAYMENT' : 'CHECKOUT'),
                onPressed: () async {
                  if (paymentCompleted) {
                    // check if merchantOrderId is sent to our database
                    var order = model.order!;
                    final date = DateTime.now().millisecondsSinceEpoch;
                    final consumer = context.read<ConsumerModel>().consumer!;
                    order = order.copyWith(
                        totalPrice: totalPrice,
                        totalQuantity: totalQuantity,
                        consumerId: consumer.id!,
                        phoneNumber: consumer.phoneNumber,
                        date: date);
                    await context.read<OrderModel>().addOrder(order);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Success! You order is made.')));
                    model.clearCart();
                  } else {
                    final checkoutUrl =
                        await model.generateCheckoutUrl(model.order!);
                    await launchURL(checkoutUrl);
                  }
                },
              ),
            )
          ],
        );
      },
    );
  }
}
