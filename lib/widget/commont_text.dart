import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight weight;
  final List<Color> gradientColor;

  const CommonText({
    Key key,
    @required this.text,
    this.fontSize = 16,
    this.gradientColor = const [
      Color(0xff000000),
      Color(0xff000000),
    ],
    this.weight = FontWeight.w500,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ShaderMask(
        shaderCallback: (bounds) =>
            LinearGradient(colors: gradientColor).createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: fontSize,
              fontWeight: weight,
              color: Colors.white,
              height: 1.5),
        ),
      ),
    );
  }
}
