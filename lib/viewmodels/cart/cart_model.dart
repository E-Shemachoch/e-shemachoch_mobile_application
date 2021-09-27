import 'package:eshemachoch_mobile_application/models/order.dart';
import 'package:eshemachoch_mobile_application/models/product.dart';
import 'package:eshemachoch_mobile_application/services/cart_service.dart';
import 'package:flutter/cupertino.dart';

class CartModel with ChangeNotifier {
  final CartService service;

  Order? order;
  bool showCartCount = false;

  CartModel(this.service);

  hideCartCount() {
    showCartCount = false;
    notifyListeners();
  }

  addProduct(Product product) {
    if (order == null) order = Order.empty();
    order!.products.add(product);
    showCartCount = true;
    notifyListeners();
  }

  generateCheckoutUrl(Order order) async {
    final checkoutUrl = await service.generateCheckoutUrl(order);
    return checkoutUrl;
  }

  clearCart() {
    order = null;
    notifyListeners();
  }
}
