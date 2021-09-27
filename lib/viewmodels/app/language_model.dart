import 'package:eshemachoch_mobile_application/services/language_service.dart';
import 'package:flutter/material.dart';

class LanguageModel with ChangeNotifier {
  LanguageModel(this.service) {
    getLocale();
  }
  final LanguageService service;

  Locale locale = Locale('en', '');

  getLocale() {
    locale = service.getLocale();
  }

  changeLocale(Locale locale) {
    service.addLocale(locale);
    this.locale = locale;
    notifyListeners();
  }
}
