import 'package:flutter/material.dart';

class MyQRCodePage extends StatelessWidget {
  const MyQRCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'),
      ),
      body: Padding(
        padding: EdgeInsets.all(56),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height: 200, color: Colors.blueGrey),
            SizedBox(height: 24.0),
            Text(
                'Show this QR Code to claim your purchased items from a nearby E-Shemachoch Store.')
          ],
        ),
      ),
    );
  }
}
