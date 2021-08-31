import 'package:flutter/material.dart';

class MyOrderDetail extends StatelessWidget {
  const MyOrderDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          ...List.generate(
            15,
            (index) => ListTile(
              leading: FlutterLogo(),
              title: Text('Item $index'),
              subtitle: Text('$index ETB'),
            ),
          ),
          ElevatedButton(
            child: Text('Claim'),
            onPressed: null,
          )
        ]),
      ),
    );
  }
}
