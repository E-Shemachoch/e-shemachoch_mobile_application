import 'package:flutter/material.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            leading: FlutterLogo(),
            title: Text('Item $index'),
            subtitle: Text('$index ETB'),
          );
        },
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Total',
            textAlign: TextAlign.right,
          ),
          Text('152 ETB', textAlign: TextAlign.right),
        ],
      ),
      ElevatedButton(
        child: Text('CHECKOUT'),
        onPressed: null,
      )
    ]);
  }
}
