import 'package:eshemachoch_mobile_application/constants/api.dart';
import 'package:eshemachoch_mobile_application/models/product.dart';
import 'package:eshemachoch_mobile_application/views/home/product_detail.dart';
import 'package:flutter/material.dart';

class MyProductTile extends StatelessWidget {
  const MyProductTile({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => MyProductDetail(product: product,)));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                '$BASEURL/products/images/${product.image}',
                fit: BoxFit.cover,
                height: double.maxFinite,
                width: double.maxFinite,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 10.0, bottom: 6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name),
                Text(product.price.toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
