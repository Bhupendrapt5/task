import 'package:flutter/material.dart';

class UnicornOutlineButton extends StatelessWidget {
  final _GradientPainter _painter;
  final Widget _child;
  final VoidCallback _callback;
  final List<Color> _bgColor;

  UnicornOutlineButton({
    @required double strokeWidth,
    @required List<Color> colors,
    List<Color> bgColor = const [
      Color(0xffffff),
      Color(0xffffff),
    ],
    @required Widget child,
    @required VoidCallback onPressed,
  })  : this._painter = _GradientPainter(
          strokeWidth: strokeWidth,
          colors: colors,
        ),
        this._child = child,
        this._bgColor = bgColor,
        this._callback = onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _painter,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _callback,
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: _callback,
          child: Container(
            constraints: BoxConstraints(minWidth: 88, minHeight: 48),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                colors: _bgColor,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  final Paint _paint = Paint();
  final double strokeWidth;
  final List<Color> colors;

  _GradientPainter({@required double strokeWidth, @required List<Color> colors})
      : this.strokeWidth = strokeWidth,
        this.colors = colors;

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
    Rect outerRect = Offset.zero & size;
    var outerRRect = RRect.fromRectAndRadius(outerRect, Radius.circular(5));

    // create inner rectangle smaller by strokeWidth
    Rect innerRect = Rect.fromLTWH(strokeWidth, strokeWidth,
        size.width - strokeWidth * 2, size.height - strokeWidth * 2);
    var innerRRect =
        RRect.fromRectAndRadius(innerRect, Radius.circular(5 - strokeWidth));

    // apply gradient shader
    _paint.shader = LinearGradient(colors: colors).createShader(outerRect);

    // create difference between outer and inner paths and draw it
    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
