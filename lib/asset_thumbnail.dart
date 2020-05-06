import 'dart:typed_data';

import 'package:asset_list/plugin/image_manager/asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AssetThumbnailWidget extends StatelessWidget {
  final Asset asset;
  final int width;
  final int height;

  const AssetThumbnailWidget({Key key, this.asset, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ByteData>(
      key: Key(asset.identifier),
      future: asset.thumbnailByteData(width, height),
      builder: (_, snapshot) {
        return !snapshot.hasData
            ? Container(color: Colors.grey)
            : Container(
          color: Colors.grey,
          constraints: BoxConstraints.expand(),
          child: Image.memory(
            snapshot.data.buffer.asUint8List(),
            fit: BoxFit.cover,
            gaplessPlayback: true,
          ),
        );
      },
    );
  }
}
