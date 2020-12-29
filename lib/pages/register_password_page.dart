import 'package:finnovation_task/dashboard/dashboard_page.dart';
import 'package:finnovation_task/widget/bg_cirlce_widget.dart';
import 'package:finnovation_task/widget/commont_text.dart';
import 'package:finnovation_task/widget/commot_buttom.dart';
import 'package:flutter/material.dart';

class RegisterPasswordPage extends StatefulWidget {
  RegisterPasswordPage({Key key}) : super(key: key);

  @override
  _RegisterPasswordPageState createState() => _RegisterPasswordPageState();
}

class _RegisterPasswordPageState extends State<RegisterPasswordPage> {
  final purlColor = Color(0xff7a49e7);
  final _passContoller = TextEditingController();
  final _confirmContoller = TextEditingController();
  bool _hidePassword = true;
  bool _hideConfirmPassword = true;
  @override
  void dispose() {
    _passContoller.dispose();
    _confirmContoller.dispose();
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
                    controller: _passContoller,
                    obscureText: _hidePassword,
                    decoration: InputDecoration(
                      suffix: GestureDetector(
                        child: Icon(
                          _hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: _hidePassword ? purlColor : Colors.grey,
                        ),
                        onTap: () {
                          setState(() {
                            _hidePassword = !_hidePassword;
                          });
                        },
                      ),
                      labelText: 'Password',
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    cursorColor: purlColor,
                    controller: _confirmContoller,
                    obscureText: _hideConfirmPassword,
                    decoration: InputDecoration(
                      suffix: GestureDetector(
                        child: Icon(
                          _hideConfirmPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: _hideConfirmPassword ? purlColor : Colors.grey,
                        ),
                        onTap: () {
                          setState(() {
                            _hideConfirmPassword = !_hideConfirmPassword;
                          });
                        },
                      ),
                      labelText: 'Confirm Password',
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  UnicornOutlineButton(
                    child: CommonText(
                      text: 'Next',
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
