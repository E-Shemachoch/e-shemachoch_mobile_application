import 'package:eshemachoch_mobile_application/models/consumer.dart';
import 'package:eshemachoch_mobile_application/services/consumer_service.dart';
import 'package:flutter/cupertino.dart';

class ConsumerModel with ChangeNotifier {
  ConsumerModel(this.service) {
    loadConsumer();
  }
  final ConsumerService service;
  Consumer? consumer;

  Future<bool> checkExistence(String phoneNumber) async {
    return await service.checkExistence(phoneNumber);
  }

  loginConsumer(String idToken) async {
    consumer = await service.loginConsumer(idToken);
    notifyListeners();
  }

  loadConsumer() async {
    try {
      consumer = await service.loadConsumer();
      notifyListeners();
    } catch (e) {}
  }

  logoutConsumer() async {
    await service.logoutConsumer();
    consumer = null;
    notifyListeners();
  }
}
