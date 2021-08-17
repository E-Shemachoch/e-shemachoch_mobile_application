import 'package:flutter/material.dart';
import 'package:eshemachoch_mobile_application/views/purchases/qrcode_page.dart';

class MyPurchasesPage extends StatelessWidget {
  const MyPurchasesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildClaimButton() {
      return ElevatedButton(
        child: Text('CLAIM'),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return MyQRCodePage();
          }));
        },
      );
    }

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
