import 'package:finnovation_task/widget/card_item_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);
  final List<String> _titles = [
    'Stock market for beginners',
    'Mutual funds foreigners',
    'Financial frauds',
    'Stock market terminology',
    'Stock market succession',
    'Invenstment and stockmarket book summeries',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView.separated(
          itemBuilder: (context, index) => CardItemWidget(
            title: _titles[index],
            isNew: index == 1
                ? true
                : index == 3
                    ? true
                    : false,
          ),
          itemCount: _titles.length,
          separatorBuilder: (context, index) => SizedBox(
            height: 25,
          ),
        ),
      ),
    );
  }
}
