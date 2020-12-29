import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BgHalfCirlce extends StatelessWidget {
  final double height;
  const BgHalfCirlce({Key key, this.height = 200}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.2,
      child: SvgPicture.asset(
        'assets/login-bg-texture.svg',
        height: height,
      ),
    );
  }
}
