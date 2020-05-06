import 'dart:async';

import 'package:asset_list/plugin/image_manager/image_manager.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'asset.freezed.dart';
part 'asset.g.dart';

@freezed
abstract class Asset with _$Asset {
  factory Asset.image({
    String identifier,
    int width,
    int height,
    int orientation,
    double longitude,
    double latitude,
    double timestamp
  }) = _Image;

  factory Asset.movie({
    String identifier,
    int width,
    int height,
    int orientation,
    double longitude,
    double latitude,
    double timestamp,
    double duration
  }) = _Movie;

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);

  @late
  String get displayDuration => this.maybeMap(
      movie: (movie) {
        if (movie.duration == null) { return '0:00'; }
        final minutes = (movie.duration ~/ 60).toString().padLeft(2, '0');
        final seconds = (movie.duration % 60).ceil().toString().padLeft(2, '0');
        return '$minutes:$seconds';
      },
      orElse: () => ''
  );

  @late
  String get type => this.map(image: (_) => 'image', movie: (_) => 'movie');
}

extension AssetExtension on Asset {
  Future<ByteData> thumbnailByteData(int width, int height) async {
    Completer completer = new Completer<ByteData>();
    final channel = ImageManager.thumbnailChannel(this.identifier, width, height);

    ServicesBinding.instance.defaultBinaryMessenger.setMessageHandler(channel, (ByteData message) async {
      completer.complete(message);
      ServicesBinding.instance.defaultBinaryMessenger.setMessageHandler(channel, null);
      return message;
    });

    await ImageManager.requestThumbnail(identifier, width, height, this.width, this.height, orientation, 100, type);
    return completer.future;
  } 
}