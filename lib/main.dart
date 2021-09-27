import 'package:eshemachoch_mobile_application/main_provider.dart';
import 'package:eshemachoch_mobile_application/services/consumer_service.dart';
import 'package:eshemachoch_mobile_application/services/language_service.dart';
import 'package:eshemachoch_mobile_application/viewmodels/app/language_model.dart';
import 'package:eshemachoch_mobile_application/viewmodels/consumer/consumer_model.dart';
import 'package:eshemachoch_mobile_application/views/login/login_page.dart';
import 'package:eshemachoch_mobile_application/views/main/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ConsumerModel(ConsumerService(http.Client()))),
        ChangeNotifierProvider(create: (_) => LanguageModel(LanguageService())),
      ],
      child: Consumer<LanguageModel>(builder: (context, model, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
            Locale('am', ''),
            Locale('or', ''),
            Locale('ti', ''),
          ],
          locale: model.locale,
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.eshemachoch,
          theme: ThemeData(
            primarySwatch: Colors.green,
            canvasColor: Colors.white,
          ),
          builder: (context, child) {
            return Consumer<ConsumerModel>(
              builder: (context, model, _) {
                if (model.consumer != null)
                  return MainProvider(consumer: model.consumer!, child: child!);
                return Navigator(
                  onGenerateRoute: (settings) {
                    return MaterialPageRoute(
                      settings: settings,
                      builder: (_) => MyLoginPage(),
                    );
                  },
                );
              },
            );
          },
          home: MyMainPage(),
        );
      }),
    );
  }
}
