import 'package:flutter/material.dart';

class ChildElement extends StatefulWidget {
  final Widget widget;
  ChildElement({@required this.widget, Key key}) : super(key: key);

  @override
  _ChildElementState createState() => _ChildElementState();
}

class _ChildElementState extends State<ChildElement> {
  @override
  Widget build(BuildContext context) {
    return widget.widget;
  }
}
