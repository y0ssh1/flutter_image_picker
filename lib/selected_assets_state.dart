import 'package:flutter/foundation.dart';
import 'package:asset_list/plugin/image_manager/asset.dart';
import 'package:asset_list/plugin/image_manager/image_manager.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'selected_assets_state.freezed.dart';

@freezed
abstract class SelectedAssetsState with _$SelectedAssetsState {
  factory SelectedAssetsState.loading() = _Loading;
  factory SelectedAssetsState.data(List<Asset> assets, List<String> selectedIdentifiers) = _SelectedAssetsState;

  @late
  bool get isFull => this.maybeMap(
      data: (data) => data.selectedIdentifiers.length >= 4,
      orElse: () => false
  );
}

class SelectedAssetsStateNotifier extends StateNotifier<SelectedAssetsState> {
  SelectedAssetsStateNotifier(List<Asset> selectedAssets) : super(SelectedAssetsState.loading()) {
    ImageManager.getAssets()
        .then((assets) {
          state = SelectedAssetsState.data(
              assets,
              selectedAssets.map((asset) => asset.identifier).toList()
          );
        });
  }

  void onTap(Asset asset) {
    state = state.maybeMap(
        data: (data) => SelectedAssetsState.data(
          data.assets,
          data.selectedIdentifiers.contains(asset.identifier)
              ? data.selectedIdentifiers.where((i) => i != asset.identifier).toList()
              : [...data.selectedIdentifiers, asset.identifier]
        ),
        orElse: () => state
    );
  }
  
  bool isSelected(int assetIndex) {
    return displaySelectedIndex(assetIndex) != 0;
  }
  
  int displaySelectedIndex(int assetIndex) {
    return state.maybeMap(
        data: (data) => data.selectedIdentifiers.indexOf(data.assets[assetIndex].identifier) + 1,
        orElse: () => 0
    );
  }

  List<Asset> get selectedAssets => state.maybeMap(
      data: (data) {
        final assetMap = data.assets.asMap()
            .map((_, asset) => MapEntry(asset.identifier, asset));
        return data.selectedIdentifiers.map((id) => assetMap[id]).toList().cast<Asset>();
      },
      orElse: () => <Asset>[]
  );
}