// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'selected_assets_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SelectedAssetsStateTearOff {
  const _$SelectedAssetsStateTearOff();

  _Loading loading() {
    return _Loading();
  }

  _SelectedAssetsState data(
      List<dynamic> assets, List<String> selectedIdentifiers) {
    return _SelectedAssetsState(
      assets,
      selectedIdentifiers,
    );
  }
}

// ignore: unused_element
const $SelectedAssetsState = _$SelectedAssetsStateTearOff();

mixin _$SelectedAssetsState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required
        Result data(List<dynamic> assets, List<String> selectedIdentifiers),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result data(List<dynamic> assets, List<String> selectedIdentifiers),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(_Loading value),
    @required Result data(_SelectedAssetsState value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(_Loading value),
    Result data(_SelectedAssetsState value),
    @required Result orElse(),
  });
}

abstract class $SelectedAssetsStateCopyWith<$Res> {
  factory $SelectedAssetsStateCopyWith(
          SelectedAssetsState value, $Res Function(SelectedAssetsState) then) =
      _$SelectedAssetsStateCopyWithImpl<$Res>;
}

class _$SelectedAssetsStateCopyWithImpl<$Res>
    implements $SelectedAssetsStateCopyWith<$Res> {
  _$SelectedAssetsStateCopyWithImpl(this._value, this._then);

  final SelectedAssetsState _value;
  // ignore: unused_field
  final $Res Function(SelectedAssetsState) _then;
}

abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

class __$LoadingCopyWithImpl<$Res>
    extends _$SelectedAssetsStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

class _$_Loading with DiagnosticableTreeMixin implements _Loading {
  _$_Loading();

  bool _didisFull = false;
  bool _isFull;

  @override
  bool get isFull {
    if (_didisFull == false) {
      _didisFull = true;
      _isFull = this.maybeMap(
          data: (data) => data.selectedIdentifiers.length >= 4,
          orElse: () => false);
    }
    return _isFull;
  }

  bool _didselectedAssets = false;
  List<dynamic> _selectedAssets;

  @override
  List<dynamic> get selectedAssets {
    if (_didselectedAssets == false) {
      _didselectedAssets = true;
      _selectedAssets = this.maybeMap(
          data: (data) {
            final assetMap = data.assets
                .asMap()
                .map((_, asset) => MapEntry(asset.identifier, asset as Asset));
            return data.selectedIdentifiers.map((id) => assetMap[id]).toList();
          },
          orElse: () => <Asset>[]);
    }
    return _selectedAssets;
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SelectedAssetsState.loading(isFull: $isFull, selectedAssets: $selectedAssets)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SelectedAssetsState.loading'))
      ..add(DiagnosticsProperty('isFull', isFull))
      ..add(DiagnosticsProperty('selectedAssets', selectedAssets));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required
        Result data(List<dynamic> assets, List<String> selectedIdentifiers),
  }) {
    assert(loading != null);
    assert(data != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result data(List<dynamic> assets, List<String> selectedIdentifiers),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(_Loading value),
    @required Result data(_SelectedAssetsState value),
  }) {
    assert(loading != null);
    assert(data != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(_Loading value),
    Result data(_SelectedAssetsState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SelectedAssetsState {
  factory _Loading() = _$_Loading;
}

abstract class _$SelectedAssetsStateCopyWith<$Res> {
  factory _$SelectedAssetsStateCopyWith(_SelectedAssetsState value,
          $Res Function(_SelectedAssetsState) then) =
      __$SelectedAssetsStateCopyWithImpl<$Res>;
  $Res call({List<dynamic> assets, List<String> selectedIdentifiers});
}

class __$SelectedAssetsStateCopyWithImpl<$Res>
    extends _$SelectedAssetsStateCopyWithImpl<$Res>
    implements _$SelectedAssetsStateCopyWith<$Res> {
  __$SelectedAssetsStateCopyWithImpl(
      _SelectedAssetsState _value, $Res Function(_SelectedAssetsState) _then)
      : super(_value, (v) => _then(v as _SelectedAssetsState));

  @override
  _SelectedAssetsState get _value => super._value as _SelectedAssetsState;

  @override
  $Res call({
    Object assets = freezed,
    Object selectedIdentifiers = freezed,
  }) {
    return _then(_SelectedAssetsState(
      assets == freezed ? _value.assets : assets as List<dynamic>,
      selectedIdentifiers == freezed
          ? _value.selectedIdentifiers
          : selectedIdentifiers as List<String>,
    ));
  }
}

class _$_SelectedAssetsState
    with DiagnosticableTreeMixin
    implements _SelectedAssetsState {
  _$_SelectedAssetsState(this.assets, this.selectedIdentifiers)
      : assert(assets != null),
        assert(selectedIdentifiers != null);

  @override
  final List<dynamic> assets;
  @override
  final List<String> selectedIdentifiers;

  bool _didisFull = false;
  bool _isFull;

  @override
  bool get isFull {
    if (_didisFull == false) {
      _didisFull = true;
      _isFull = this.maybeMap(
          data: (data) => data.selectedIdentifiers.length >= 4,
          orElse: () => false);
    }
    return _isFull;
  }

  bool _didselectedAssets = false;
  List<dynamic> _selectedAssets;

  @override
  List<dynamic> get selectedAssets {
    if (_didselectedAssets == false) {
      _didselectedAssets = true;
      _selectedAssets = this.maybeMap(
          data: (data) {
            final assetMap = data.assets
                .asMap()
                .map((_, asset) => MapEntry(asset.identifier, asset as Asset));
            return data.selectedIdentifiers.map((id) => assetMap[id]).toList();
          },
          orElse: () => <Asset>[]);
    }
    return _selectedAssets;
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SelectedAssetsState.data(assets: $assets, selectedIdentifiers: $selectedIdentifiers, isFull: $isFull, selectedAssets: $selectedAssets)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SelectedAssetsState.data'))
      ..add(DiagnosticsProperty('assets', assets))
      ..add(DiagnosticsProperty('selectedIdentifiers', selectedIdentifiers))
      ..add(DiagnosticsProperty('isFull', isFull))
      ..add(DiagnosticsProperty('selectedAssets', selectedAssets));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SelectedAssetsState &&
            (identical(other.assets, assets) ||
                const DeepCollectionEquality().equals(other.assets, assets)) &&
            (identical(other.selectedIdentifiers, selectedIdentifiers) ||
                const DeepCollectionEquality()
                    .equals(other.selectedIdentifiers, selectedIdentifiers)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(assets) ^
      const DeepCollectionEquality().hash(selectedIdentifiers);

  @override
  _$SelectedAssetsStateCopyWith<_SelectedAssetsState> get copyWith =>
      __$SelectedAssetsStateCopyWithImpl<_SelectedAssetsState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required
        Result data(List<dynamic> assets, List<String> selectedIdentifiers),
  }) {
    assert(loading != null);
    assert(data != null);
    return data(assets, selectedIdentifiers);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result data(List<dynamic> assets, List<String> selectedIdentifiers),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (data != null) {
      return data(assets, selectedIdentifiers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(_Loading value),
    @required Result data(_SelectedAssetsState value),
  }) {
    assert(loading != null);
    assert(data != null);
    return data(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(_Loading value),
    Result data(_SelectedAssetsState value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _SelectedAssetsState implements SelectedAssetsState {
  factory _SelectedAssetsState(
          List<dynamic> assets, List<String> selectedIdentifiers) =
      _$_SelectedAssetsState;

  List<dynamic> get assets;
  List<String> get selectedIdentifiers;
  _$SelectedAssetsStateCopyWith<_SelectedAssetsState> get copyWith;
}
