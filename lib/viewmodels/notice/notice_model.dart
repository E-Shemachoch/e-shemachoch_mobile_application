import 'package:eshemachoch_mobile_application/models/notice.dart';
import 'package:eshemachoch_mobile_application/services/notice_service.dart';
import 'package:flutter/foundation.dart';

class NoticeModel with ChangeNotifier {
  NoticeModel(this.service) {
    getNotices();
  }
  final NoticeService service;

  List<Notice>? notices;
  bool isLoading = true;
  bool hasError = false;

  getNotices() async {
    try {
      notices = await service.getNotices();
      isLoading = false;
    } catch (e) {
      hasError = true;
    }
    notifyListeners();
  }
}
