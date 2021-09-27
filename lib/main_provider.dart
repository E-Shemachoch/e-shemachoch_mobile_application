import 'package:eshemachoch_mobile_application/models/consumer.dart' as model;
import 'package:eshemachoch_mobile_application/services/cart_service.dart';
import 'package:eshemachoch_mobile_application/services/notice_service.dart';
import 'package:eshemachoch_mobile_application/services/product_service.dart';
import 'package:eshemachoch_mobile_application/services/order_service.dart';
import 'package:eshemachoch_mobile_application/utils/http_client.dart';
import 'package:eshemachoch_mobile_application/viewmodels/cart/cart_model.dart';
import 'package:eshemachoch_mobile_application/viewmodels/notice/notice_model.dart';
import 'package:eshemachoch_mobile_application/viewmodels/order/order_model.dart';
import 'package:eshemachoch_mobile_application/viewmodels/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainProvider extends StatefulWidget {
  const MainProvider({Key? key, required this.consumer, required this.child})
      : super(key: key);
  final Widget child;
  final model.Consumer consumer;
  @override
  _MainProviderState createState() => _MainProviderState();
}

class _MainProviderState extends State<MainProvider> {
  @override
  Widget build(BuildContext context) {
    final client = MyCustomClient(widget.consumer.token!);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ProductModel(ProductService(client))),
        ChangeNotifierProvider(create: (_) => CartModel(CartService(client))),
        ChangeNotifierProvider(
            create: (_) => NoticeModel(NoticeService(client)), lazy: false),
        ChangeNotifierProvider(
            create: (_) => OrderModel(OrderService(client), widget.consumer)),
      ],
      child: widget.child,
    );
  }
}
