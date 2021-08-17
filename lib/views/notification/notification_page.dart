import 'package:flutter/material.dart';

class MyNotificationPage extends StatelessWidget {
  const MyNotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
          leading: FlutterLogo(),
          title: Text('Notification $index'),
          subtitle: Text('DateTime'),
        );
      },
    );
  }
}
