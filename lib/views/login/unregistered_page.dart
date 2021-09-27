import 'package:flutter/material.dart';

class MyUnregisteredPage extends StatelessWidget {
  const MyUnregisteredPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
              'Your phone number is not registered in our system, please visit a nearby E-Shemachoch Center.'),
        ),
      ),
    );
  }
}
