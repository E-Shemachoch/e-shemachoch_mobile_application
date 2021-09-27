import 'dart:io';

import 'package:eshemachoch_mobile_application/constants/api.dart';
import 'package:eshemachoch_mobile_application/viewmodels/consumer/consumer_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Consumer<ConsumerModel>(builder: (context, model, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                foregroundImage: NetworkImage(
                    '$BASEURL/consumers/images/${model.consumer!.image}',
                    scale: 1,
                    headers: {
                      HttpHeaders.authorizationHeader: model.consumer!.token!,
                    }),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text(model.consumer!.name),
                subtitle: Text('Name'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text(model.consumer!.phoneNumber),
                subtitle: Text('Phone Number'),
              ),
              Spacer(),
              ElevatedButton(
                child: Text(AppLocalizations.of(context)!.logout),
                onPressed: () {
                  model.logoutConsumer();
                },
              )
            ],
          ),
        );
      }),
    );
  }
}
