import 'package:flutter/material.dart';

import './widget/swiper.dart';

class PageViewSwiper extends StatefulWidget {
  const PageViewSwiper({Key? key}) : super(key: key);

  @override
  State<PageViewSwiper> createState() => _PageViewSwiperState();
}

class _PageViewSwiperState extends State<PageViewSwiper> {
  List<String> list = [];
  int _currentIndex = 0;
  late int SIZE;

  @override
  void initState() {
    super.initState();
    list = const [
      "https://www.itying.com/images/flutter/1.png",
      "https://www.itying.com/images/flutter/2.png",
      "https://www.itying.com/images/flutter/3.png",
    ];
    SIZE = list.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自动轮播'),
      ),
      // body: ListView(
      //   children: [Swiper(list: list)],
      // ));
      body: Swiper(list: list),
    );
  }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//       appBar: AppBar(
//         title: Text('PageViewSwiper'),
//       ),
//       body: Stack(
//         children: [
//           SizedBox(
//             height: 200,
//             child: PageView.builder(
//               onPageChanged: (index) {
//                 setState(() {
//                   _currentIndex = index % SIZE;
//                 });
//               },
//               itemCount: 1000,
//               itemBuilder: (context, index) {
//                 return list[index % SIZE];
//               },
//             ),
//           ),
//           Positioned(
//               left: 0,
//               right: 0, //设置 left:0 right:0就会站满整行
//               bottom: 2,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: List.generate(SIZE, (index) {
//                   return Container(
//                     margin: const EdgeInsets.all(5),
//                     width: 10,
//                     height: 10,
//                     decoration: BoxDecoration(
//                         color:
//                             _currentIndex == index ? Colors.red : Colors.grey,
//                         shape: BoxShape.circle),
//                   );
//                 }).toList(),
//               ))
//         ],
//       ));
// }
}
