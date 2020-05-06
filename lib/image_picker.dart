import 'dart:typed_data';

import 'package:asset_list/plugin/image_manager/asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:asset_list/selected_assets_state.dart';
import 'package:flutter/cupertino.dart';

import 'asset_thumbnail.dart';

class ImagePicker extends StatelessWidget {
  final List<Asset> assets;

  const ImagePicker({Key key, this.assets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<SelectedAssetsStateNotifier,
        SelectedAssetsState>(
      create: (_) => SelectedAssetsStateNotifier(assets),
      child: _ImagePicker(),
    );
  }
}

class _ImagePicker extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<_ImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('最近の項目'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                final assets = context
                    .read<SelectedAssetsStateNotifier>()
                    .selectedAssets;
                Navigator.of(context).pop(assets);
              },
              child: Text('確定'),
            )
          ],
        ),
        body: context.watch<SelectedAssetsState>().map(
            loading: (_) => Container(
              color: Colors.white,
              child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator()),
                  )),
            ),
            data: (data) => GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    childAspectRatio: 1),
                itemBuilder: (context, index) {
                  final Asset selectedAsset = data.assets[index];
                  final displayIndex = context.select((SelectedAssetsStateNotifier notifier) =>
                      notifier.displaySelectedIndex(index).toString());
                  final isSelected = context.select((SelectedAssetsStateNotifier notifier) =>
                      notifier.isSelected(index));
                  return InkWell(
                    onTap: () => context
                        .read<SelectedAssetsStateNotifier>()
                        .onTap(selectedAsset),
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        AssetThumbnailWidget(
                          asset: selectedAsset,
                          width: 300,
                          height: 300,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Visibility(
                              visible: selectedAsset.maybeMap(
                                  movie: (_) => true, orElse: () => false),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                      height: 23,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            colors: [
                                              Colors.black,
                                              Colors.transparent
                                            ],
                                          ))),
                                  Container(
                                    padding: const EdgeInsets.only(right: 4),
                                    width: double.infinity,
                                    child: Text(
                                      selectedAsset.displayDuration,
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )
                                ],
                              )),
                        ),
                        Visibility(
                          visible: data.isFull && !isSelected,
                          child: Container(color: Colors.white70),
                        ),
                        Visibility(
                          visible: isSelected,
                          child: Container(color: Colors.black54),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Visibility(
                            visible: isSelected,
                            child: Padding(
                              padding: EdgeInsets.all(6),
                              child: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(12.5)),
                                child: Center(
                                  child: Text(
                                    displayIndex.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }, itemCount: data.assets.length)
        ));
  }
}