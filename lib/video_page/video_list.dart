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
    _controller.init();
    print('ly- title: ${_controller.model.title}');
    print('ly- url: ${_controller.model.url}');
    print('ly- playCount: ${_controller.model.playCount}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: 15,
      itemBuilder: (context, index) {
        // 实际羡慕中， 通过dateList[index]取出url
        // var url =
        //     'https://sample-videos.com/video123/flv/240/big_buck_bunny_240p_10mb.flv';
        return GestureDetector(
          child: AbsorbPointer(
            absorbing: true,
            child: VideoView(
              Player()
                ..setCommonDataSource('asset/videos/test.flv',
                    type: SourceType.asset, autoPlay: true),
            ),
          ),
          onTap: () => router.push(
            name: McRouter.playerPage,
            arguments: _controller.model.url,
          ),
        );
      },
    ));
  }
}