import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'asset.dart';

class ImageManager {
  static const _channel = const MethodChannel('image_manager');

  static String thumbnailChannel(String id, int width, int height) {
    return "image_manager/thumbnail/${id}_${width}_$height";
  }

  static Future<List<Asset>> getAssets() async {
      final List<dynamic> assets = await _channel.invokeMethod('fetchAssets');
      return compute(_parseAssets, assets);
  }

  static Future<void> requestThumbnail(
      String identifier,
      int width,
      int height,
      int rawWidth,
      int rawHeight,
      int orientation,
      int quality,
      String type
      ) async {
    return _channel.invokeMethod(
      "requestThumbnail", <String, dynamic>{
      "identifier": identifier,
      "width": width,
      "height": height,
      "rawWidth": rawWidth,
      "rawHeight": rawHeight,
      "orientation": orientation,
      "quality": quality,
      "type": type
    });
  }

  static Future<void> requestPermission() {
    return _channel.invokeMethod('requestPermission');
  }

  static List<Asset> _parseAssets(List<dynamic> assets) {
    return assets
        .map((asset) => Asset.fromJson(<String, dynamic>{'runtimeType': asset['type'], ...asset}))
        .toList();
  }
}