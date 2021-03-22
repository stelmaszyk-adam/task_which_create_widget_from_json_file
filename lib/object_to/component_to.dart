import 'package:json_annotation/json_annotation.dart';

part 'component_to.g.dart';

@JsonSerializable()
class ComponentTO {
  int height;
  int width;
  String type;
  Map<String, dynamic> states;

  ComponentTO(this.height, this.width, this.type, this.states);

  factory ComponentTO.fromJson(Map<String, dynamic> json) =>
      _$ComponentTOFromJson(json);

  Map<String, dynamic> toJson() => _$ComponentTOToJson(this);
}

@JsonSerializable()
class ComponentChildren {
  int x;
  int y;
  int width;
  int height;
  String type;
  String text;

  ComponentChildren(
      this.x, this.y, this.width, this.height, this.type, this.text);

  factory ComponentChildren.fromJson(Map<String, dynamic> json) =>
      _$ComponentChildrenFromJson(json);

  Map<String, dynamic> toJson() => _$ComponentChildrenToJson(this);
}
