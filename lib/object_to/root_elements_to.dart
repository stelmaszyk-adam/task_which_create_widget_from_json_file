import 'package:json_annotation/json_annotation.dart';
import 'package:json_parser/object_to/component_to.dart';

part 'root_elements_to.g.dart';

@JsonSerializable()
class RootElementsTO {
  String appName;
  Flows flows;
  Map<String, dynamic> components;

  RootElementsTO(this.appName);

  factory RootElementsTO.fromJson(Map<String, dynamic> json) =>
      _$RootElementsTOFromJson(json);

  Map<String, dynamic> toJson() => _$RootElementsTOToJson(this);
}

@JsonSerializable()
class Flows {
  Map<String, dynamic> screens;
  Map<String, dynamic> panels;

  Flows(this.screens, this.panels);

  factory Flows.fromJson(Map<String, dynamic> json) => _$FlowsFromJson(json);

  Map<String, dynamic> toJson() => _$FlowsToJson(this);
}

@JsonSerializable()
class Screen {
  String name;
  List<ScreenChildren> children;
  String type;

  Screen(this.name, this.children, this.type);

  factory Screen.fromJson(Map<String, dynamic> json) => _$ScreenFromJson(json);

  Map<String, dynamic> toJson() => _$ScreenToJson(this);
}

@JsonSerializable()
class ScreenChildren {
  String layoutName;
  String name;
  String type;
  Panel myPanel;

  ScreenChildren(this.layoutName, this.name, this.type, this.myPanel);

  factory ScreenChildren.fromJson(Map<String, dynamic> json) =>
      _$ScreenChildrenFromJson(json);

  Map<String, dynamic> toJson() => _$ScreenChildrenToJson(this);
}

@JsonSerializable()
class Panel {
  String type;
  List<PanelChildren> children;
  int height;
  int width;
  int x;
  int y;

  Panel(this.type, this.children, this.height, this.width, this.x, this.y);

  factory Panel.fromJson(Map<String, dynamic> json) => _$PanelFromJson(json);

  Map<String, dynamic> toJson() => _$PanelToJson(this);
}

@JsonSerializable()
class PanelChildren {
  String name;
  String type;
  int height;
  int width;
  int x;
  int y;
  String componentName;
  ComponentChildren myComponentChildren;

  PanelChildren(this.name, this.type, this.height, this.width, this.x, this.y,
      this.componentName, this.myComponentChildren);

  factory PanelChildren.fromJson(Map<String, dynamic> json) =>
      _$PanelChildrenFromJson(json);

  Map<String, dynamic> toJson() => _$PanelChildrenToJson(this);
}
