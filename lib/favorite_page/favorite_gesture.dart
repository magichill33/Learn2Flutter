import 'package:flutter/material.dart';
import 'package:fluttertest/favorite_page/favorite_animation_icon.dart';

class FavoriteGesture extends StatefulWidget {
  static const double defaultSize = 100;
  final Widget child;
  final double size;

  const FavoriteGesture(
      {Key? key, required this.child, this.size = defaultSize})
      : super(key: key);

  @override
  State<FavoriteGesture> createState() => _FavoriteGestureState();
}

class _FavoriteGestureState extends State<FavoriteGesture> {
  final GlobalKey _key = GlobalKey();

  //保存当前需要展示的icon
  List<Offset> iconOffsets = [];

  //temp表示最近的一次双击坐标
  Offset temp = Offset.zero;

  Offset _globalToLocal(Offset global) {
    RenderBox renderBox = _key.currentContext?.findRenderObject() as RenderBox;
    return renderBox.globalToLocal(global);
  }

  @override
  Widget build(BuildContext context) {
   // print("ly33flutter _FavoriteGestureState");
    var iconStack = Stack(
        children: iconOffsets
            .map((e) => FavoriteAnimationIcon(
                  key: Key(e.toString()),
                  size: widget.size,
                  position: e,
                  onAnimationComplete: () {
                    iconOffsets.remove(e);
                  },
                ))
            .toList());
    return GestureDetector(
      key: _key,
      child: Stack(
        children: [
          widget.child,
          iconStack,
        ],
      ),
      onDoubleTap: () {
        print("ly33flutter onDoubleTap");
        setState(() {
          iconOffsets.add(temp);
        });
      },
      onDoubleTapDown: (details) {
        print("ly33flutter onDoubleTapDown");
        temp = _globalToLocal(details.globalPosition);
        print("ly33flutter onDoubleTapDown temp:$temp");
      },
    );
  }
}
