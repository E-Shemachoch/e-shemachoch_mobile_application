import 'package:eshemachoch_mobile_application/viewmodels/cart/cart_model.dart';
import 'package:eshemachoch_mobile_application/viewmodels/notice/notice_model.dart';
import 'package:flutter/material.dart';
import 'package:eshemachoch_mobile_application/views/cart/cart_page.dart';
import 'package:eshemachoch_mobile_application/views/home/component/drawer.dart';
import 'package:eshemachoch_mobile_application/views/home/home_page.dart';
import 'package:eshemachoch_mobile_application/views/notification/notification_page.dart';
import 'package:eshemachoch_mobile_application/views/orders/orders_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyMainPage extends StatefulWidget {
  const MyMainPage({Key? key}) : super(key: key);

  @override
  State<MyMainPage> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyMainPage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    MyHomePage(),
    MyCartPage(),
    MyOrdersPage(),
    MyNotificationPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      context.read<CartModel>().hideCartCount();
    }
    if (index == 3) {
      context.read<NoticeModel>().hideNoticeCount();
    }
  }

  @override
  Widget build(BuildContext context) {
    buildCartIcon() {
      return Consumer<CartModel>(
        builder: (context, model, child) {
          final count = model.order?.products.length;
          return Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.shopping_cart),
              if (model.showCartCount)
                FractionalTranslation(
                  translation: Offset(1, -0.7),
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    child: Text(
                      count.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
            ],
          );
        },
      );
    }

    buildNoticeIcon() {
      return Consumer<NoticeModel>(
        builder: (context, model, child) {
          final count = model.noticeCount;
          return Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.notifications),
              if (model.showNoticeCount)
                FractionalTranslation(
                  translation: Offset(1, -0.7),
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    child: Text(
                      count.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/logo_white.png',
              width: 24,
              height: 24,
            ),
            SizedBox(width: 12),
            Text(
              AppLocalizations.of(context)!.eshemachoch,
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          showUnselectedLabels: true,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: AppLocalizations.of(context)!.home,
            ),
            BottomNavigationBarItem(
              icon: buildCartIcon(),
              label: AppLocalizations.of(context)!.cart,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: AppLocalizations.of(context)!.orders,
            ),
            BottomNavigationBarItem(
              icon: buildNoticeIcon(),
              label: AppLocalizations.of(context)!.notifications,
            ),
          ],
          onTap: _onItemTapped,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: Theme.of(context).disabledColor),
    );
  }
}
