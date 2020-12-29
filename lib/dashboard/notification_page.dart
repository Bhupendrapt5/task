import 'package:finnovation_task/widget/card_item_widget.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({Key key}) : super(key: key);
  final List<String> _titles = [
    'Stock market for beginners',
    'Mutual funds foreigners',
    'Financial frauds',
    'Stock market terminology',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView.separated(
          itemBuilder: (context, index) => CardItemWidget(
            title: _titles[index],
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
