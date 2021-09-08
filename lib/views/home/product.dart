import 'package:flutter/material.dart';

class MyProductPage extends StatelessWidget {
  const MyProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 400,
            child: Placeholder(),
          ),
          ListTile(
            title: Text('Product name'),
            subtitle: Text('Price'),
          ),
          DropdownButtonFormField(
              items: [DropdownMenuItem(child: Text('Quantity'))]),
          ElevatedButton(onPressed: () {}, child: Text('Add To Cart'))
        ],
      ),
    );
  }
}
