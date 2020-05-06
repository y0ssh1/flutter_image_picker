// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'asset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Asset _$AssetFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'image':
      return _Image.fromJson(json);
    case 'movie':
      return _Movie.fromJson(json);

    default:
      throw FallThroughError();
  }
}

class _$AssetTearOff {
  const _$AssetTearOff();

  _Image image(
      {String identifier,
      int width,
      int height,
      int orientation,
      double longitude,
      double latitude,
      double timestamp}) {
    return _Image(
      identifier: identifier,
      width: width,
      height: height,
      orientation: orientation,
      longitude: longitude,
      latitude: latitude,
      timestamp: timestamp,
    );
  }

  _Movie movie(
      {String identifier,
      int width,
      int height,
      int orientation,
      double longitude,
      double latitude,
      double timestamp,
      double duration}) {
    return _Movie(
      identifier: identifier,
      width: width,
      height: height,
      orientation: orientation,
      longitude: longitude,
      latitude: latitude,
      timestamp: timestamp,
      duration: duration,
    );
  }
}

// ignore: unused_element
const $Asset = _$AssetTearOff();

mixin _$Asset {
  String get identifier;
  int get width;
  int get height;
  int get orientation;
  double get longitude;
  double get latitude;
  double get timestamp;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result image(String identifier, int width, int height, int orientation,
            double longitude, double latitude, double timestamp),
    @required
        Result movie(
            String identifier,
            int width,
            int height,
            int orientation,
            double longitude,
            double latitude,
            double timestamp,
            double duration),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result image(String identifier, int width, int height, int orientation,
        double longitude, double latitude, double timestamp),
    Result movie(String identifier, int width, int height, int orientation,
        double longitude, double latitude, double timestamp, double duration),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result image(_Image value),
    @required Result movie(_Movie value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result image(_Image value),
    Result movie(_Movie value),
    @required Result orElse(),
  });
  Map<String, dynamic> toJson();
  $AssetCopyWith<Asset> get copyWith;
}

abstract class $AssetCopyWith<$Res> {
  factory $AssetCopyWith(Asset value, $Res Function(Asset) then) =
      _$AssetCopyWithImpl<$Res>;
  $Res call(
      {String identifier,
      int width,
      int height,
      int orientation,
      double longitude,
      double latitude,
      double timestamp});
}

class _$AssetCopyWithImpl<$Res> implements $AssetCopyWith<$Res> {
  _$AssetCopyWithImpl(this._value, this._then);

  final Asset _value;
  // ignore: unused_field
  final $Res Function(Asset) _then;

  @override
  $Res call({
    Object identifier = freezed,
    Object width = freezed,
    Object height = freezed,
    Object orientation = freezed,
    Object longitude = freezed,
    Object latitude = freezed,
    Object timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      identifier:
          identifier == freezed ? _value.identifier : identifier as String,
      width: width == freezed ? _value.width : width as int,
      height: height == freezed ? _value.height : height as int,
      orientation:
          orientation == freezed ? _value.orientation : orientation as int,
      longitude: longitude == freezed ? _value.longitude : longitude as double,
      latitude: latitude == freezed ? _value.latitude : latitude as double,
      timestamp: timestamp == freezed ? _value.timestamp : timestamp as double,
    ));
  }
}

abstract class _$ImageCopyWith<$Res> implements $AssetCopyWith<$Res> {
  factory _$ImageCopyWith(_Image value, $Res Function(_Image) then) =
      __$ImageCopyWithImpl<$Res>;
  @override
  $Res call(
      {String identifier,
      int width,
      int height,
      int orientation,
      double longitude,
      double latitude,
      double timestamp});
}

class __$ImageCopyWithImpl<$Res> extends _$AssetCopyWithImpl<$Res>
    implements _$ImageCopyWith<$Res> {
  __$ImageCopyWithImpl(_Image _value, $Res Function(_Image) _then)
      : super(_value, (v) => _then(v as _Image));

  @override
  _Image get _value => super._value as _Image;

  @override
  $Res call({
    Object identifier = freezed,
    Object width = freezed,
    Object height = freezed,
    Object orientation = freezed,
    Object longitude = freezed,
    Object latitude = freezed,
    Object timestamp = freezed,
  }) {
    return _then(_Image(
      identifier:
          identifier == freezed ? _value.identifier : identifier as String,
      width: width == freezed ? _value.width : width as int,
      height: height == freezed ? _value.height : height as int,
      orientation:
          orientation == freezed ? _value.orientation : orientation as int,
      longitude: longitude == freezed ? _value.longitude : longitude as double,
      latitude: latitude == freezed ? _value.latitude : latitude as double,
      timestamp: timestamp == freezed ? _value.timestamp : timestamp as double,
    ));
  }
}

@JsonSerializable()
class _$_Image implements _Image {
  _$_Image(
      {this.identifier,
      this.width,
      this.height,
      this.orientation,
      this.longitude,
      this.latitude,
      this.timestamp});

  factory _$_Image.fromJson(Map<String, dynamic> json) =>
      _$_$_ImageFromJson(json);

  @override
  final String identifier;
  @override
  final int width;
  @override
  final int height;
  @override
  final int orientation;
  @override
  final double longitude;
  @override
  final double latitude;
  @override
  final double timestamp;

  bool _diddisplayDuration = false;
  String _displayDuration;

  @override
  String get displayDuration {
    if (_diddisplayDuration == false) {
      _diddisplayDuration = true;
      _displayDuration = this.maybeMap(
          movie: (movie) {
            if (movie.duration == null) {
              return '0:00';
            }
            final minutes = (movie.duration ~/ 60).toString().padLeft(2, '0');
            final seconds =
                (movie.duration % 60).ceil().toString().padLeft(2, '0');
            return '$minutes:$seconds';
          },
          orElse: () => '');
    }
    return _displayDuration;
  }

  bool _didtype = false;
  String _type;

  @override
  String get type {
    if (_didtype == false) {
      _didtype = true;
      _type = this.map(image: (_) => 'image', movie: (_) => 'movie');
    }
    return _type;
  }

  @override
  String toString() {
    return 'Asset.image(identifier: $identifier, width: $width, height: $height, orientation: $orientation, longitude: $longitude, latitude: $latitude, timestamp: $timestamp, displayDuration: $displayDuration, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Image &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.width, width) ||
                const DeepCollectionEquality().equals(other.width, width)) &&
            (identical(other.height, height) ||
                const DeepCollectionEquality().equals(other.height, height)) &&
            (identical(other.orientation, orientation) ||
                const DeepCollectionEquality()
                    .equals(other.orientation, orientation)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(width) ^
      const DeepCollectionEquality().hash(height) ^
      const DeepCollectionEquality().hash(orientation) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(timestamp);

  @override
  _$ImageCopyWith<_Image> get copyWith =>
      __$ImageCopyWithImpl<_Image>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result image(String identifier, int width, int height, int orientation,
            double longitude, double latitude, double timestamp),
    @required
        Result movie(
            String identifier,
            int width,
            int height,
            int orientation,
            double longitude,
            double latitude,
            double timestamp,
            double duration),
  }) {
    assert(image != null);
    assert(movie != null);
    return image(
        identifier, width, height, orientation, longitude, latitude, timestamp);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result image(String identifier, int width, int height, int orientation,
        double longitude, double latitude, double timestamp),
    Result movie(String identifier, int width, int height, int orientation,
        double longitude, double latitude, double timestamp, double duration),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (image != null) {
      return image(identifier, width, height, orientation, longitude, latitude,
          timestamp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result image(_Image value),
    @required Result movie(_Movie value),
  }) {
    assert(image != null);
    assert(movie != null);
    return image(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result image(_Image value),
    Result movie(_Movie value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (image != null) {
      return image(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ImageToJson(this)..['runtimeType'] = 'image';
  }
}

abstract class _Image implements Asset {
  factory _Image(
      {String identifier,
      int width,
      int height,
      int orientation,
      double longitude,
      double latitude,
      double timestamp}) = _$_Image;

  factory _Image.fromJson(Map<String, dynamic> json) = _$_Image.fromJson;

  @override
  String get identifier;
  @override
  int get width;
  @override
  int get height;
  @override
  int get orientation;
  @override
  double get longitude;
  @override
  double get latitude;
  @override
  double get timestamp;
  @override
  _$ImageCopyWith<_Image> get copyWith;
}

abstract class _$MovieCopyWith<$Res> implements $AssetCopyWith<$Res> {
  factory _$MovieCopyWith(_Movie value, $Res Function(_Movie) then) =
      __$MovieCopyWithImpl<$Res>;
  @override
  $Res call(
      {String identifier,
      int width,
      int height,
      int orientation,
      double longitude,
      double latitude,
      double timestamp,
      double duration});
}

class __$MovieCopyWithImpl<$Res> extends _$AssetCopyWithImpl<$Res>
    implements _$MovieCopyWith<$Res> {
  __$MovieCopyWithImpl(_Movie _value, $Res Function(_Movie) _then)
      : super(_value, (v) => _then(v as _Movie));

  @override
  _Movie get _value => super._value as _Movie;

  @override
  $Res call({
    Object identifier = freezed,
    Object width = freezed,
    Object height = freezed,
    Object orientation = freezed,
    Object longitude = freezed,
    Object latitude = freezed,
    Object timestamp = freezed,
    Object duration = freezed,
  }) {
    return _then(_Movie(
      identifier:
          identifier == freezed ? _value.identifier : identifier as String,
      width: width == freezed ? _value.width : width as int,
      height: height == freezed ? _value.height : height as int,
      orientation:
          orientation == freezed ? _value.orientation : orientation as int,
      longitude: longitude == freezed ? _value.longitude : longitude as double,
      latitude: latitude == freezed ? _value.latitude : latitude as double,
      timestamp: timestamp == freezed ? _value.timestamp : timestamp as double,
      duration: duration == freezed ? _value.duration : duration as double,
    ));
  }
}

@JsonSerializable()
class _$_Movie implements _Movie {
  _$_Movie(
      {this.identifier,
      this.width,
      this.height,
      this.orientation,
      this.longitude,
      this.latitude,
      this.timestamp,
      this.duration});

  factory _$_Movie.fromJson(Map<String, dynamic> json) =>
      _$_$_MovieFromJson(json);

  @override
  final String identifier;
  @override
  final int width;
  @override
  final int height;
  @override
  final int orientation;
  @override
  final double longitude;
  @override
  final double latitude;
  @override
  final double timestamp;
  @override
  final double duration;

  bool _diddisplayDuration = false;
  String _displayDuration;

  @override
  String get displayDuration {
    if (_diddisplayDuration == false) {
      _diddisplayDuration = true;
      _displayDuration = this.maybeMap(
          movie: (movie) {
            if (movie.duration == null) {
              return '0:00';
            }
            final minutes = (movie.duration ~/ 60).toString().padLeft(2, '0');
            final seconds =
                (movie.duration % 60).ceil().toString().padLeft(2, '0');
            return '$minutes:$seconds';
          },
          orElse: () => '');
    }
    return _displayDuration;
  }

  bool _didtype = false;
  String _type;

  @override
  String get type {
    if (_didtype == false) {
      _didtype = true;
      _type = this.map(image: (_) => 'image', movie: (_) => 'movie');
    }
    return _type;
  }

  @override
  String toString() {
    return 'Asset.movie(identifier: $identifier, width: $width, height: $height, orientation: $orientation, longitude: $longitude, latitude: $latitude, timestamp: $timestamp, duration: $duration, displayDuration: $displayDuration, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Movie &&
            (identical(other.identifier, identifier) ||
                const DeepCollectionEquality()
                    .equals(other.identifier, identifier)) &&
            (identical(other.width, width) ||
                const DeepCollectionEquality().equals(other.width, width)) &&
            (identical(other.height, height) ||
                const DeepCollectionEquality().equals(other.height, height)) &&
            (identical(other.orientation, orientation) ||
                const DeepCollectionEquality()
                    .equals(other.orientation, orientation)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(identifier) ^
      const DeepCollectionEquality().hash(width) ^
      const DeepCollectionEquality().hash(height) ^
      const DeepCollectionEquality().hash(orientation) ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(duration);

  @override
  _$MovieCopyWith<_Movie> get copyWith =>
      __$MovieCopyWithImpl<_Movie>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result image(String identifier, int width, int height, int orientation,
            double longitude, double latitude, double timestamp),
    @required
        Result movie(
            String identifier,
            int width,
            int height,
            int orientation,
            double longitude,
            double latitude,
            double timestamp,
            double duration),
  }) {
    assert(image != null);
    assert(movie != null);
    return movie(identifier, width, height, orientation, longitude, latitude,
        timestamp, duration);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result image(String identifier, int width, int height, int orientation,
        double longitude, double latitude, double timestamp),
    Result movie(String identifier, int width, int height, int orientation,
        double longitude, double latitude, double timestamp, double duration),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (movie != null) {
      return movie(identifier, width, height, orientation, longitude, latitude,
          timestamp, duration);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result image(_Image value),
    @required Result movie(_Movie value),
  }) {
    assert(image != null);
    assert(movie != null);
    return movie(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result image(_Image value),
    Result movie(_Movie value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (movie != null) {
      return movie(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MovieToJson(this)..['runtimeType'] = 'movie';
  }
}

abstract class _Movie implements Asset {
  factory _Movie(
      {String identifier,
      int width,
      int height,
      int orientation,
      double longitude,
      double latitude,
      double timestamp,
      double duration}) = _$_Movie;

  factory _Movie.fromJson(Map<String, dynamic> json) = _$_Movie.fromJson;

  @override
  String get identifier;
  @override
  int get width;
  @override
  int get height;
  @override
  int get orientation;
  @override
  double get longitude;
  @override
  double get latitude;
  @override
  double get timestamp;
  double get duration;
  @override
  _$MovieCopyWith<_Movie> get copyWith;
}
