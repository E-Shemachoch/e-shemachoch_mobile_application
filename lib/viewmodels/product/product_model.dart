import 'package:eshemachoch_mobile_application/models/product.dart';
import 'package:eshemachoch_mobile_application/services/product_service.dart';
import 'package:flutter/foundation.dart';

class ProductModel with ChangeNotifier {
  ProductModel(this.service) {
    getProducts();
  }
  final ProductService service;

  List<Product>? products;
  bool isLoading = true;
  bool hasError = false;

  getProducts() async {
    try {
      products = await service.getProducts();
      isLoading = false;
    } catch (e) {
      hasError = true;
    }
    notifyListeners();
  }
}
