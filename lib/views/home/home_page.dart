import 'package:flutter/material.dart';
import 'package:eshemachoch_mobile_application/views/home/component/product_tile.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  SliverToBoxAdapter _buildHeader(String text, BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 8.0),
        child: Row(children: [
          Container(
            height: 10.0,
            width: 24.0,
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(5)),
          ),
          SizedBox(width: 8),
          Text(text),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: [
          _buildHeader('NEWLY ARRIVED', context),
          SliverToBoxAdapter(
            child: SizedBox(height: 180, child: Placeholder()),
          ),
          _buildHeader('ALL PRODUCTS', context),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.75,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return MyProductTile();
              },
            ),
          )
        ],
      ),
    );
  }
}
