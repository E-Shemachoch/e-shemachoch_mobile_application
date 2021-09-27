<<<<<<< Updated upstream
import 'package:eshemachoch_mobile_application/constants/api.dart';
import 'package:eshemachoch_mobile_application/viewmodels/consumer/consumer_model.dart';
import 'package:eshemachoch_mobile_application/views/account/account_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
=======
import 'dart:io';

import 'package:eshemachoch_mobile_application/constants/api.dart';
import 'package:eshemachoch_mobile_application/viewmodels/consumer/consumer_model.dart';
import 'package:eshemachoch_mobile_application/views/account/account_page.dart';
import 'package:eshemachoch_mobile_application/views/language/language_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
>>>>>>> Stashed changes

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Consumer<ConsumerModel>(
              builder: (context, model, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 28,
                      foregroundImage: NetworkImage(
<<<<<<< Updated upstream
                          '$BASEURL/consumers/images/${model.consumer!.image}'),
=======
                          '$BASEURL/consumers/images/${model.consumer!.image}',
                          headers: {
                            HttpHeaders.authorizationHeader:
                                model.consumer!.token!,
                          }),
>>>>>>> Stashed changes
                    ),
                    Text(model.consumer!.name),
                    Text(model.consumer!.phoneNumber),
                  ],
                );
              },
            ),
          ),
          ListTile(
<<<<<<< Updated upstream
              title: Text('Account'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyAccountPage();
                }));
              }),
          ListTile(
            title: Text('Language'),
          ),
          ListTile(
            title: Text('About'),
=======
            title: Text(AppLocalizations.of(context)!.account),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyAccountPage();
              }));
            },
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.language),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyLanguagePage();
              }));
            },
>>>>>>> Stashed changes
          ),
        ],
      ),
    );
  }
}
