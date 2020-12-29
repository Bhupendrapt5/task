import 'package:finnovation_task/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpalshScreen extends StatefulWidget {
  SpalshScreen({Key key}) : super(key: key);

  @override
  _SpalshScreenState createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  Animation<double> rotateAnimation;
  Color backgroundColor = Color(0xFF050505);

  initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    _animation = Tween<double>(begin: 0.1, end: 2.2).animate(_controller);
    rotateAnimation = Tween<double>(begin: 0, end: 5).animate(_controller);
    _controller.forward();
    pageRout();
  }

  void pageRout() async {
    await Future.delayed(Duration(milliseconds: 2990));
    await Future.delayed(Duration(milliseconds: 10));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WelComePage()),
    );
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          backgroundColor: backgroundColor,
          body: Center(
            child: ScaleTransition(
              scale: _animation,
              child: Transform.rotate(
                angle: rotateAnimation.value,
                child: SvgPicture.asset(
                  'assets/crux-circle.svg',
                  color: Colors.white,
                  width: double.infinity,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
