import 'package:asset_list/asset_thumbnail.dart';
import 'package:asset_list/image_picker.dart';
import 'package:asset_list/plugin/image_manager/asset.dart';
import 'package:asset_list/plugin/image_manager/image_manager.dart';
import 'package:asset_list/selected_assets_state.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Asset> assets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: assets.map((asset) => AspectRatio(
          aspectRatio: 1,
          child: AssetThumbnailWidget(
              asset: asset,
              width: 500,
              height: 500,
            ),
        )
        ).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await ImageManager.requestPermission();
          final selectedAssets = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => ImagePicker(assets: assets)));
          if (selectedAssets != null) {
            setState(() {
              assets = selectedAssets;
            });
          }
        },
        tooltip: 'show image picker',
        child: Icon(Icons.photo_album),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
