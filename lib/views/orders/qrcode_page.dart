import 'package:eshemachoch_mobile_application/models/order.dart';
import 'package:eshemachoch_mobile_application/viewmodels/order/order_model.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:provider/provider.dart';

class MyQRCodePage extends StatelessWidget {
  const MyQRCodePage({Key? key, required this.order}) : super(key: key);
  final Order order;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'),
      ),
      body: Padding(
        padding: EdgeInsets.all(56),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            QrImage(
              data: order.id!,
              version: QrVersions.auto,
              size: 320,
              gapless: false,
            ),
            SizedBox(height: 24.0),
            Text(
                'Show this QR Code to claim your orderd items from a nearby E-Shemachoch Store.'),
            Spacer(),
            ElevatedButton(
              child: Text('Done'),
              onPressed: () async {
                await context.read<OrderModel>().getOrders();
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
