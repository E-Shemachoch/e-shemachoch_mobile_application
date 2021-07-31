import 'package:flutter/material.dart';

class MyPurchasesPage extends StatelessWidget {
  const MyPurchasesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index'),
          subtitle: Text('DateTime'),
          trailing: Text('CLAIMED'),
        );
      },
    );
  }
}
