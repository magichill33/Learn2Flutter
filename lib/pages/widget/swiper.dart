import 'dart:async';

import 'package:flutter/material.dart';

import 'image.dart';

class Swiper extends StatefulWidget {
  final double width;
  final double height;
  final List<String> list;

  const Swiper(
      {Key? key,
      this.height = 200,
      this.width = double.infinity,
      required this.list})
      : super(key: key);

  @override
  State<Swiper> createState() => _SwiperState();
}

class _SwiperState extends State<Swiper> {
  int _currentIndex = 0;
  List<Widget> pageList = [];
  late PageController _pageController;
  late Timer timer;
  late final int SIZE;

  @override
  void initState() {
    super.initState();
    SIZE = widget.list.length;
    for (var i = 0; i < SIZE; i++) {
      pageList.add(ImagePage(
        src: widget.list[i],
        width: widget.width,
        height: widget.height,
      ));
    }
    _pageController = PageController(initialPage: 0);

    timer = Timer.periodic(const Duration(seconds: 5), (t) {
      _pageController.animateToPage((_currentIndex + 1) % SIZE,
          duration: const Duration(microseconds: 200), curve: Curves.linear);
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
              controller: _pageController,
              itemCount: 1000,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index % SIZE;
                });
              },
              itemBuilder: (context, index) {
                return pageList[index % SIZE];
              }),
        ),
        Positioned(
            left: 0,
            right: 0, //设置 left:0 right:0就会站满整行
            bottom: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(pageList.length, (index) {
                return Container(
                  margin: const EdgeInsets.all(5),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      color: _currentIndex == index ? Colors.blue : Colors.grey,
                      shape: BoxShape.circle //圆
                    // borderRadius: BorderRadius.circular(5) //圆
                  ),
                );
              }).toList(),
            ))

      ],
    );
  }
}
