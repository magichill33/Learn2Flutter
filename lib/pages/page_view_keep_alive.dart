import 'package:flutter/material.dart';
import '../tools/KeepAliveWrapper.dart';

class PageViewKeepAlive extends StatefulWidget {
  const PageViewKeepAlive({Key? key}) : super(key: key);

  @override
  State<PageViewKeepAlive> createState() => _PageViewKeepAliveState();
}

class _PageViewKeepAliveState extends State<PageViewKeepAlive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('缓存pageview'),
        ),
        body: PageView.builder(
            itemCount: 10,
            itemBuilder: (context,index){
              return KeepAliveWrapper(child: MyContainer(num: index));
            }
            
        ));
  }
}

//自定义组件
class MyContainer extends StatefulWidget {
  final int num;
  const MyContainer({super.key, required this.num});

  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer>  {
  @override
  Widget build(BuildContext context) {
    print("_MyContainerState ${widget.num}");  //默认数据是没有缓存,每次滑动都会执行build
    return Center(
        child: Text(
          "第${widget.num}屏",
          style: Theme.of(context).textTheme.headline1,
        ));
  }
}

