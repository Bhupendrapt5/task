import 'package:finnovation_task/pages/login_page.dart';
import 'package:finnovation_task/pages/register_account_page.dart';
import 'package:finnovation_task/widget/commont_text.dart';
import 'package:finnovation_task/widget/commot_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelComePage extends StatelessWidget {
  WelComePage({Key key}) : super(key: key);

  final listColor = [
    Color(0xff7a49e7),
    Color(0xff51bbcf),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/crux-circle.svg',
                      color: Colors.black,
                      width: 80,
                      height: 100,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Image.asset(
                      'assets/crux-logo.jpg',
                      height: 60,
                      width: 150,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: CommonText(
                        text: 'Let\'s Get Started',
                        fontSize: 22,
                        weight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    UnicornOutlineButton(
                      child: CommonText(
                        text: 'Log in',
                        gradientColor: listColor,
                      ),
                      colors: listColor,
                      strokeWidth: 2,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    UnicornOutlineButton(
                      child: CommonText(
                        text: 'Register New Account',
                        gradientColor: [Colors.white, Colors.white],
                      ),
                      colors: listColor,
                      bgColor: listColor,
                      strokeWidth: 2,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterAccountPage(),
                            ));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
