import 'package:eshemachoch_mobile_application/viewmodels/notice/notice_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyNotificationPage extends StatelessWidget {
  const MyNotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NoticeModel>(
      builder: (context, model, child) {
        if (model.hasError) return Text('Failed to load.');
        if (model.isLoading) return CircularProgressIndicator();
        return ListView.separated(
          itemBuilder: (context, index) {
            final notice = model.notices![index];
            final date = DateTime.fromMillisecondsSinceEpoch(notice.date);
            return ListTile(
              title: Text(notice.title),
              subtitle: Text(date.toString()),
            );
          },
          itemCount: model.notices!.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
        );
      },
    );
  }
}
