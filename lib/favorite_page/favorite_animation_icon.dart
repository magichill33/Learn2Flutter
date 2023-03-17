import 'dart:math';

import 'package:flutter/material.dart';

class FavoriteAnimationIcon extends StatefulWidget {
  final Offset position;
  final double size;
  final Function? onAnimationComplete;

  const FavoriteAnimationIcon(
      {Key? key,
      required this.size,
      this.onAnimationComplete,
      required this.position})
      : super(key: key);

  @override
  State<FavoriteAnimationIcon> createState() => _FavoriteAnimationIconState();
}

class _FavoriteAnimationIconState extends State<FavoriteAnimationIcon>
    with TickerProviderStateMixin {
  //展示进度的值
  static const double appearValue = 0.1;

  //消失进度的值
  static const double dismissValue = 0.8;
  static const int _duration = 600;

  late AnimationController _animationController;
  final double angle = pi / 10 * (2 * Random().nextDouble() - 1);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: _duration),
      vsync: this,
    );
    _animationController.addListener(() {
      setState(() {});
    });
    startAnimation();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("ly33flutter _FavoriteAnimationState");
    var content = Icon(
      Icons.favorite,
      size: widget.size,
      color: Colors.redAccent,
    );

    var child = ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) => RadialGradient(
              colors: const [Color(0xFFEE6E6E), Color(0xFFF03F3F)],
              center: Alignment.topLeft.add(const Alignment(0.66, 0.66)))
          .createShader(bounds),
      child: Transform.rotate(
        angle: angle,
        child: Transform.scale(
          scale: scale,
          alignment: Alignment.bottomCenter,
          child: content,
        ),
      ),
    );

    return Positioned(
        top: widget.position.dy - widget.size / 2,
        left: widget.position.dx - widget.size / 2,
        child: Opacity(
          opacity: opacity,
          child: child,
        ));
  }

  double get opacity {
    if (value < appearValue) {
      return value / appearValue;
    }

    if (value < dismissValue) {
      return 1;
    }
    // 处于渐隐阶段，播放器透明度动画
    return (1 - value) / (1 - dismissValue);
  }

  double get scale {
    if (value < appearValue) {
      return 1 + appearValue - value;
    }

    if (value < dismissValue) {
      return 1;
    }

    return 1 + (value - dismissValue) / (1 - dismissValue);
  }

  double get value {
    return _animationController.value;
  }

  startAnimation() async {
    await _animationController.forward();
    widget.onAnimationComplete?.call();
  }
}
