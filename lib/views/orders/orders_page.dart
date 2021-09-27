import 'package:eshemachoch_mobile_application/models/order.dart';
import 'package:eshemachoch_mobile_application/viewmodels/order/order_model.dart';
import 'package:eshemachoch_mobile_application/views/orders/order_detail.dart';
import 'package:flutter/material.dart';
import 'package:eshemachoch_mobile_application/views/orders/qrcode_page.dart';
import 'package:provider/provider.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildClaimButton(Order order) {
      return ElevatedButton(
        child: Text('CLAIM'),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return MyQRCodePage(order: order);
          }));
        },
      );
    }

    return Consumer<OrderModel>(builder: (context, model, child) {
      if (model.hasError) return Text('Failed to load.');
      if (model.isLoading) return CircularProgressIndicator();
      return ListView.separated(
        itemBuilder: (context, index) {
          final order = model.orders![index];
          final length = order.products.length;
          final date = DateTime.fromMillisecondsSinceEpoch(order.date);
          return ListTile(
            title: Text(
                order.products.first.name + "${length > 1 ? ' , $length more' : ''}"),
            subtitle: Text(date.toString()),
            trailing: order.claimed
                ? Text(
                    'CLAIMED',
                    style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                  )
                : _buildClaimButton(order),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return MyOrderDetail(order: order);
              }));
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemCount: model.orders!.length,
      );
    });
  }
}
