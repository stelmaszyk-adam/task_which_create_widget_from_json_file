import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_parser/child_element.dart';
import 'package:json_parser/object_to/component_to.dart';
import 'package:json_parser/object_to/root_elements_to.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  List<Screen> _screenLists;
  Widget _finalWidget;

  List data;

  void loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/example.json');

    RootElementsTO element = RootElementsTO.fromJson(json.decode(jsonText));

    Map<String, ComponentTO> componentsMap = element.components
        .map((key, value) => MapEntry(key, ComponentTO.fromJson(value)));

    Map componentsChildrenMap = componentsMap.map((key, value) {
      Map<String, dynamic> help =
          value.states['default'] ?? value.states['active'];

      var children = help['children'][0];

      if (children['children'] != null) {
        for (var hel in (children['children'] as List)) {
          if (hel['text'] != null) {
            children = ComponentChildren.fromJson(hel);
            break;
          }
        }
      }

      return MapEntry(
          key,
          children.toString() == "Instance of 'ComponentChildren'"
              ? children
              : ComponentChildren.fromJson(children));
    });

    Map<String, Panel> panelMap = element.flows.panels.map((key, value) {
      Panel panel = Panel.fromJson(value);

      panel.children = panel.children
          .map((children) => PanelChildren(
              children.name,
              children.type,
              children.height,
              children.width,
              children.x,
              children.y,
              children.componentName,
              children.myComponentChildren =
                  componentsChildrenMap[children.componentName]))
          .toList();

      return MapEntry(key, panel);
    });

    List<Screen> screenLists = [];

    element.flows.screens.forEach((key, value) {
      Screen screen = Screen.fromJson(value);
      screen.children = screen.children
          .map((children) => ScreenChildren(children.layoutName, children.name,
              children.type, children.myPanel = panelMap[children.layoutName]))
          .toList();
      screenLists.add(screen);
    });

    setState(() {
      _screenLists = screenLists;
    });

    createWidget();
  }

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  void createSingleWidget(Screen screen) async {
    List<Widget> widget = screen.children.map((children) {
      List<Widget> childrenWidget = children.myPanel.children.map((child) {
        ComponentChildren componentChildren = child.myComponentChildren;
        return Expanded(
            flex: 1,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  componentChildren != null ? Text("TEXT: " + componentChildren.text.toString() ?? "") : Container(),
                  Text("Type: " + (componentChildren != null ? componentChildren.type.toString() : child.type.toString())),
                  Text(
                      "Height: " + (componentChildren != null ? componentChildren.height.toString() : child.height.toString())),
                  Text("Width: " +(componentChildren != null ? componentChildren.width.toString() : child.width.toString())),
                  Text("X: " + (componentChildren != null ? componentChildren.x.toString() : child.x.toString())),
                  Text("Y: " + (componentChildren != null ? componentChildren.y.toString() : child.y.toString())),
                ],
              ),
            ));
      }).toList();
      return Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                color: Colors.orange,
                child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: childrenWidget),
              ),
            ),
          ));
    }).toList();
    Column column = Column(children: widget);

    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ChildElement(
          widget: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(screen.name),
        ),
        body: column,
      ));
    }));
  }

  void createWidget() {
    Widget finalWidget = ListView.separated(
      padding: const EdgeInsets.all(1),
      itemCount: _screenLists.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            onTap: () {
              createSingleWidget(_screenLists[index]);
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.red,
                  border: Border.all(
                    width: 2.0,
                    color: Colors.black,
                  )),
              height: 75,
              child: Text(_screenLists[index].name),
            ));
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
    setState(() {
      _finalWidget = finalWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: _finalWidget != null
            ? _finalWidget
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Load...',
                    ),
                  ],
                ),
              ));
  }
}
