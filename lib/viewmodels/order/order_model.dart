import 'package:eshemachoch_mobile_application/models/order.dart';
import 'package:eshemachoch_mobile_application/models/consumer.dart';
import 'package:eshemachoch_mobile_application/services/order_service.dart';
import 'package:flutter/foundation.dart';

class OrderModel with ChangeNotifier {
  OrderModel(this.service, this.consumer) {
    getOrders();
  }
  final OrderService service;
  final Consumer consumer;

  List<Order>? orders;
  bool isLoading = true;
  bool hasError = false;

  getOrders() async {
    try {
      orders = await service.getOrders(consumer.id!);
      isLoading = false;
    } catch (e) {
      hasError = true;
    }
    notifyListeners();
  }

  addOrder(Order order) async {
    await service.addOrder(order);
    getOrders();
  }
}
