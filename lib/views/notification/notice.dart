import 'package:flutter/material.dart';

class MyNotice extends StatelessWidget {
  const MyNotice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notice'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Title'),
            subtitle: Text('Date'),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Body Content..'),
          ),
        ],
      ),
    );
  }
}
