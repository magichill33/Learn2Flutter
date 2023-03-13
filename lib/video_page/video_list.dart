import 'package:flutter/material.dart';
import 'package:fluttertest/video_page/video_controller.dart';
import 'package:player/video_view.dart';
import 'package:player/player.dart';
import '../nav2/mc_router.dart';

class VideoList extends StatefulWidget {
  const VideoList({Key? key}) : super(key: key);

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  late VideoController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoController();
    _controller.init().then((value) {
      print('ly-fresh data');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    print("ly-_VideoListState build model:${_controller.dataList}");
    return Scaffold(
        body: GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: _controller.dataList?.length,
      itemBuilder: (context, index) {
        // 实际羡慕中， 通过dateList[index]取出url
        // var url =
        //     'https://sample-videos.com/video123/flv/240/big_buck_bunny_240p_10mb.flv';
        return GestureDetector(
          child: AbsorbPointer(
            absorbing: true,
            child: _controller.dataList == null
                ? Container() // 加载提示或者骨架屏
                : VideoView(
                    Player()
                      ..setCommonDataSource(_controller.dataList![index].url ?? "",
                          type: SourceType.net, autoPlay: true),
                  ),
          ),
          onTap: () => router.push(
            name: McRouter.playerPage,
            arguments: _controller.dataList![index].url,
          ),
        );
      },
    ));
  }
}
