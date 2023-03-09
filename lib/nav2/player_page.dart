import 'package:flutter/material.dart';
import 'package:player/player.dart';
import 'package:player/video_view.dart';

class PlayerPage extends StatefulWidget {
  final String url;

  const PlayerPage(this.url, {Key? key}) : super(key: key);

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  @override
  Widget build(BuildContext context) {
    var player = Player();
    print('video url is :${widget.url}');
    player.setCommonDataSource(widget.url,
        type: SourceType.net, autoPlay: true);
    return GestureDetector(
      child: VideoView(player),
    );
  }
}
