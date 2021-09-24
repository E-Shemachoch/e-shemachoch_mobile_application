import 'package:eshemachoch_mobile_application/constants/api.dart';
import 'package:eshemachoch_mobile_application/models/product.dart';
import 'package:eshemachoch_mobile_application/viewmodels/cart/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProductDetail extends StatefulWidget {
  const MyProductDetail({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<MyProductDetail> createState() => _MyProductDetailState();
}

class _MyProductDetailState extends State<MyProductDetail> {
  int? quantity;
  final maxAllowed = 3;

  @override
  Widget build(BuildContext context) {
    handleAdding() {
      context.read<CartModel>().addProduct(widget.product.copyWith(quantity: quantity));

      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 400,
            child: Image.network(
              '$BASEURL/products/images/${widget.product.image}',
              fit: BoxFit.cover,
              height: double.maxFinite,
              width: double.maxFinite,
            ),
          ),
          ListTile(
            title: Text(widget.product.name),
            subtitle: Text(widget.product.price.toString()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField(
                value: quantity,
                decoration: InputDecoration(
                  label: Text('Quantity'),
                  border: OutlineInputBorder(),
                ),
                items: List.generate(
                  maxAllowed,
                  (index) => DropdownMenuItem(
                    value: index + 1,
                    child: Text('${index + 1}'),
                  ),
                ),
                onChanged: (int? selected) {
                  setState(() {
                    quantity = selected;
                  });
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: Text('Add To Cart'),
              onPressed: handleAdding,
            ),
          )
        ],
      ),
    );
  }
}
