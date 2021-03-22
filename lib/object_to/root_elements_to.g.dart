// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'root_elements_to.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RootElementsTO _$RootElementsTOFromJson(Map<String, dynamic> json) {
  return RootElementsTO(
    json['appName'] as String,
  )
    ..flows = json['flows'] == null
        ? null
        : Flows.fromJson(json['flows'] as Map<String, dynamic>)
    ..components = json['components'] as Map<String, dynamic>;
}

Map<String, dynamic> _$RootElementsTOToJson(RootElementsTO instance) =>
    <String, dynamic>{
      'appName': instance.appName,
      'flows': instance.flows,
      'components': instance.components,
    };

Flows _$FlowsFromJson(Map<String, dynamic> json) {
  return Flows(
    json['screens'] as Map<String, dynamic>,
    json['panels'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$FlowsToJson(Flows instance) => <String, dynamic>{
      'screens': instance.screens,
      'panels': instance.panels,
    };

Screen _$ScreenFromJson(Map<String, dynamic> json) {
  return Screen(
    json['name'] as String,
    (json['children'] as List)
        ?.map((e) => e == null
            ? null
            : ScreenChildren.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['type'] as String,
  );
}

Map<String, dynamic> _$ScreenToJson(Screen instance) => <String, dynamic>{
      'name': instance.name,
      'children': instance.children,
      'type': instance.type,
    };

ScreenChildren _$ScreenChildrenFromJson(Map<String, dynamic> json) {
  return ScreenChildren(
    json['layoutName'] as String,
    json['name'] as String,
    json['type'] as String,
    json['myPanel'] == null
        ? null
        : Panel.fromJson(json['myPanel'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ScreenChildrenToJson(ScreenChildren instance) =>
    <String, dynamic>{
      'layoutName': instance.layoutName,
      'name': instance.name,
      'type': instance.type,
      'myPanel': instance.myPanel,
    };

Panel _$PanelFromJson(Map<String, dynamic> json) {
  return Panel(
    json['type'] as String,
    (json['children'] as List)
        ?.map((e) => e == null
            ? null
            : PanelChildren.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['height'] as int,
    json['width'] as int,
    json['x'] as int,
    json['y'] as int,
  );
}

Map<String, dynamic> _$PanelToJson(Panel instance) => <String, dynamic>{
      'type': instance.type,
      'children': instance.children,
      'height': instance.height,
      'width': instance.width,
      'x': instance.x,
      'y': instance.y,
    };

PanelChildren _$PanelChildrenFromJson(Map<String, dynamic> json) {
  return PanelChildren(
    json['name'] as String,
    json['type'] as String,
    json['height'] as int,
    json['width'] as int,
    json['x'] as int,
    json['y'] as int,
    json['componentName'] as String,
    json['myComponentChildren'] == null
        ? null
        : ComponentChildren.fromJson(
            json['myComponentChildren'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PanelChildrenToJson(PanelChildren instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'height': instance.height,
      'width': instance.width,
      'x': instance.x,
      'y': instance.y,
      'componentName': instance.componentName,
      'myComponentChildren': instance.myComponentChildren,
    };
