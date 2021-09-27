import 'package:eshemachoch_mobile_application/models/notice.dart';
import 'package:eshemachoch_mobile_application/services/notice_service.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoticeModel with ChangeNotifier {
  NoticeModel(this.service) {
    getNotices();
  }
  final NoticeService service;
  List<Notice>? notices;
  bool isLoading = true;
  bool hasError = false;

  bool showNoticeCount = false;
  int? lastSeen;
  int noticeCount = 0;

  setLastSeen() async {
    final storage = await SharedPreferences.getInstance();
    lastSeen = storage.getInt('lastSeen') ?? 0;
  }

  changeLastSeen() async {
    final storage = await SharedPreferences.getInstance();
    storage.setInt('lastSeen', lastSeen!);
  }

  hideNoticeCount() {
    notices?.forEach((notice) {
      if (notice.date > lastSeen!) {
        lastSeen = notice.date;
      }
    });
    changeLastSeen();
    showNoticeCount = false;
    notifyListeners();
  }

  getNotices() async {
    await setLastSeen();
    try {
      notices = await service.getNotices();
      notices?.forEach((notice) {
        if (notice.date > lastSeen!) {
          noticeCount += 1;
        }
      });
      if (noticeCount > 0) showNoticeCount = true;
      isLoading = false;
    } catch (e) {
      hasError = true;
    }
    notifyListeners();
  }
}
