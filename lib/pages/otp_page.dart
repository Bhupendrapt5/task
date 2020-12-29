import 'package:finnovation_task/pages/register_password_page.dart';
import 'package:finnovation_task/widget/bg_cirlce_widget.dart';
import 'package:finnovation_task/widget/commont_text.dart';
import 'package:finnovation_task/widget/commot_buttom.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen({Key key}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _pinPutController = TextEditingController();
  final purlColor = Color(0xff7a49e7);
  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: purlColor),
      borderRadius: BorderRadius.circular(0.0),
    );
  }

  @override
  void dispose() {
    _pinPutController.dispose();
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
                      text: 'Enter 4 digit code',
                      fontSize: 22,
                      weight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PinPut(
                    fieldsCount: 4,
                    controller: _pinPutController,
                    submittedFieldDecoration: _pinPutDecoration.copyWith(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    selectedFieldDecoration: _pinPutDecoration.copyWith(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    keyboardType: TextInputType.number,
                    followingFieldDecoration: _pinPutDecoration.copyWith(
                      border: Border.all(
                        color: Colors.grey.withOpacity(.5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      'Resend OTP',
                      style: TextStyle(color: purlColor),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  UnicornOutlineButton(
                    child: CommonText(
                      text: 'Next',
                    ),
                    colors: [purlColor, purlColor],
                    strokeWidth: 2,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPasswordPage(),
                          ));
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
