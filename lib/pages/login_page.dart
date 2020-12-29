import 'package:finnovation_task/dashboard/dashboard_page.dart';
import 'package:finnovation_task/widget/bg_cirlce_widget.dart';
import 'package:finnovation_task/widget/commont_text.dart';
import 'package:finnovation_task/widget/commot_buttom.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final purlColor = Color(0xff7a49e7);
  bool hidePassword = true;
  final _passowrdContoller = TextEditingController();
  final _emailContoller = TextEditingController();

  @override
  void dispose() {
    _passowrdContoller.dispose();
    _emailContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
            right: -75,
            top: -75,
            child: BgHalfCirlce(
              height: 250,
            ),
          ),
          Positioned(
            left: -50,
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
                      text: 'Login',
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
                    height: 20,
                  ),
                  TextField(
                    cursorColor: purlColor,
                    controller: _passowrdContoller,
                    obscureText: hidePassword,
                    decoration: InputDecoration(
                      suffix: GestureDetector(
                        child: Icon(
                          hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: hidePassword ? purlColor : Colors.grey,
                        ),
                        onTap: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                      ),
                      labelText: 'Password',
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Forget Password',
                      style: TextStyle(
                        color: purlColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  UnicornOutlineButton(
                    child: CommonText(
                      text: 'Log in',
                      gradientColor: [purlColor, purlColor],
                    ),
                    colors: [purlColor, purlColor],
                    strokeWidth: 2,
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DashBoardPage(),
                          ),
                          (Route<dynamic> route) => false);
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                      child: Text(
                    'or login with',
                  )),
                  SizedBox(
                    height: 20,
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
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                          text: 'Don\'t have an account?',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Create an account',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: purlColor,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // navigate to desired screen
                                  })
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
