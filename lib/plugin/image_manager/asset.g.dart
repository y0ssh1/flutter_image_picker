// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Image _$_$_ImageFromJson(Map<String, dynamic> json) {
  return _$_Image(
    identifier: json['identifier'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
    orientation: json['orientation'] as int,
    longitude: (json['longitude'] as num)?.toDouble(),
    latitude: (json['latitude'] as num)?.toDouble(),
    timestamp: (json['timestamp'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_ImageToJson(_$_Image instance) => <String, dynamic>{
      'identifier': instance.identifier,
      'width': instance.width,
      'height': instance.height,
      'orientation': instance.orientation,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'timestamp': instance.timestamp,
    };

_$_Movie _$_$_MovieFromJson(Map<String, dynamic> json) {
  return _$_Movie(
    identifier: json['identifier'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
    orientation: json['orientation'] as int,
    longitude: (json['longitude'] as num)?.toDouble(),
    latitude: (json['latitude'] as num)?.toDouble(),
    timestamp: (json['timestamp'] as num)?.toDouble(),
    duration: (json['duration'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_MovieToJson(_$_Movie instance) => <String, dynamic>{
      'identifier': instance.identifier,
      'width': instance.width,
      'height': instance.height,
      'orientation': instance.orientation,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'timestamp': instance.timestamp,
      'duration': instance.duration,
    };
