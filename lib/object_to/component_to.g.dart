// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'component_to.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComponentTO _$ComponentTOFromJson(Map<String, dynamic> json) {
  return ComponentTO(
    json['height'] as int,
    json['width'] as int,
    json['type'] as String,
    json['states'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$ComponentTOToJson(ComponentTO instance) =>
    <String, dynamic>{
      'height': instance.height,
      'width': instance.width,
      'type': instance.type,
      'states': instance.states,
    };

ComponentChildren _$ComponentChildrenFromJson(Map<String, dynamic> json) {
  return ComponentChildren(
    json['x'] as int,
    json['y'] as int,
    json['width'] as int,
    json['height'] as int,
    json['type'] as String,
    json['text'] as String,
  );
}

Map<String, dynamic> _$ComponentChildrenToJson(ComponentChildren instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'width': instance.width,
      'height': instance.height,
      'type': instance.type,
      'text': instance.text,
    };
