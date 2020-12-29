import 'package:finnovation_task/widget/commont_text.dart';
import 'package:flutter/material.dart';

class CardItemWidget extends StatelessWidget {
  final bool isNew;
  final String title;
  const CardItemWidget({
    Key key,
    this.title,
    this.isNew = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            isNew
                ? Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade800,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10.0, right: 10, top: 2),
                      child: Text(
                        'New',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  )
                : SizedBox(
                    height: 16,
                  ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 16,
              ),
              child: Row(
                children: [
                  Stack(children: [
                    Container(
                      height: 110,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/yoda.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 3.0, vertical: 1),
                          child: Text(
                            '10:31',
                            style: TextStyle(
                                color: Colors.white, height: 1.5, fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: title,
                          weight: FontWeight.w600,
                          fontSize: 14,
                        ),
                        CommonText(
                          text:
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                          weight: FontWeight.w300,
                          fontSize: 12,
                        ),
                        CommonText(
                          text: 'Video 1 of 10  -  817k views',
                          weight: FontWeight.w300,
                          fontSize: 10,
                          gradientColor: [
                            Colors.grey,
                            Colors.grey,
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
