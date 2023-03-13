import 'package:fijkplayer/fijkplayer.dart';

import 'player_platform_interface.dart';

class Player extends FijkPlayer {
  static const asset_url_suffix = "asset:///";

  void setCommonDataSource(
    String url, {
    SourceType type = SourceType.net,
    bool autoPlay = false,
    bool showCover = false,
  }) {
    if (type == SourceType.asset && !url.startsWith(asset_url_suffix)) {
      url = asset_url_suffix + url;
    }
    print("ly-setCommonDataSource: $url");
    setDataSource(url, autoPlay: autoPlay, showCover: showCover);
  }

  Future<String?> getPlatformVersion() {
    return PlayerPlatform.instance.getPlatformVersion();
  }
}

enum SourceType { net, asset }
