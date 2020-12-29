import 'package:finnovation_task/pages/otp_page.dart';
import 'package:finnovation_task/widget/bg_cirlce_widget.dart';
import 'package:finnovation_task/widget/commont_text.dart';
import 'package:finnovation_task/widget/commot_buttom.dart';
import 'package:flutter/material.dart';

class RegisterAccountPage extends StatefulWidget {
  RegisterAccountPage({Key key}) : super(key: key);

  @override
  _RegisterAccountPageState createState() => _RegisterAccountPageState();
}

class _RegisterAccountPageState extends State<RegisterAccountPage> {
  final purlColor = Color(0xff7a49e7);
  final _emailContoller = TextEditingController();
  @override
  void dispose() {
    _emailContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: -75,
            top: -75,
            child: BgHalfCirlce(
              height: 250,
            ),
          ),
          Positioned(
            top: 50,
            left: 30,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Positioned(
            right: -50,
            bottom: -75,
            child: BgHalfCirlce(
              height: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 40,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: CommonText(
                      text: 'Register an account',
                      fontSize: 22,
                      weight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    cursorColor: purlColor,
                    controller: _emailContoller,
                    decoration: InputDecoration(
                      labelText: 'Mobile No/Email',
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  UnicornOutlineButton(
                    child: CommonText(
                      text: 'Get OTP',
                    ),
                    colors: [purlColor, purlColor],
                    strokeWidth: 2,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OTPScreen(),
                          ));
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                      child: Text(
                    'or Register with',
                  )),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 1,
                        child: Image.asset(
                          'assets/facebook_logo.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Card(
                        elevation: 1,
                        child: Image.asset(
                          'assets/google_logo.png',
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
