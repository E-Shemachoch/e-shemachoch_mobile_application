import 'package:eshemachoch_mobile_application/viewmodels/app/language_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyLanguagePage extends StatelessWidget {
  const MyLanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageModel>(builder: (context, model, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Change Language'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: DropdownButtonFormField(
              value: model.locale,
              decoration: InputDecoration(
                label: Text('Language'),
                border: OutlineInputBorder(),
              ),
              items: [Locale('en'), Locale('am'), Locale('ao'), Locale('ti')]
                  .map((l) {
                String? lang;
                switch (l.languageCode) {
                  case 'en':
                    lang = 'English';
                    break;
                  case 'am':
                    lang = 'Amharic';
                    break;
                  case 'ao':
                    lang = 'Afan Oromo';
                    break;
                  case 'ti':
                    lang = 'Tigrigna';
                    break;
                  default:
                    lang = 'English';
                }
                return DropdownMenuItem(
                  value: l,
                  child: Text('${lang}'),
                );
              }).toList(),
              onChanged: (Locale? selected) {
                model.changeLocale(selected!);
              }),
        ),
      );
    });
  }
}
