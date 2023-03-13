// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) => VideoModel(
      title: json['title'] as String,
      url: json['url'] as String,
      playCount: json['playCount'] as int,
    );

Map<String, dynamic> _$VideoModelToJson(VideoModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'playCount': instance.playCount,
    };
