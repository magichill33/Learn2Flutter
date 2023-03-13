import 'dart:convert';

import 'package:fluttertest/video_page/server_data.dart';
import 'package:fluttertest/video_page/video_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VideoController {
  VideoModel? model;

  Future<void> init() async {
    // 首先判断一级缓存——即内存中是否有数据
    print('ly- init video controller');
    if (model == null) {
      print('ly- init model is null');
      model = await fetchVideoData();
    }
  }

  // 缺点：
  // 1、需要针对json的每个字段创建get方法，一旦字段多了会非常繁琐
  // 2、需要保证map的字段和json的字段完全一致， 容易出错

  // 从服务端拉取视频Json字符串类型表示的视频数据
  Future<VideoModel> fetchVideoData() async {
    var sp = await SharedPreferences.getInstance();
    var modelStr = sp.getString("videModel");
    if (modelStr != null && modelStr.isEmpty) {
      //从二级缓存中找到数据直接使用；
      print('ly- 2/use sp data');
      return VideoModel.fromJson(jsonDecode(modelStr));
    } else {
      var jsonStr = ServerData.fetchDataFromServer();
      var model = jsonDecode(jsonStr);
      sp.setString('videoModel', jsonStr);
      print('ly- 3/fetch data from server');
      return VideoModel.fromJson(model);
    }
  }
}
