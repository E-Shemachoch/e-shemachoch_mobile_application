import 'package:flutter/material.dart';

class MyProductTile extends StatelessWidget {
  const MyProductTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Placeholder(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 10.0, bottom: 6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name'),
                Text('Price'),
              ],
            ),
          ),
        ],
      ),
      onTap: () {},
    );
  }
}
