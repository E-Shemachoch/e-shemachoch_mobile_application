import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                FlutterLogo(),
                Text('Full Name'),
                Text('Phone Number'),
              ],
            ),
          ),
          ListTile(
            title: Text('Account'),
          ),
          ListTile(
            title: Text('Language'),
          ),
          ListTile(
            title: Text('About'),
          ),
        ],
      ),
    );
  }
}
