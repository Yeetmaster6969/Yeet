import 'package:flutter/material.dart';
import "src/app.dart";

void main() { 
  runApp(
    new MaterialApp(
      theme: ThemeData(fontFamily: "Mansalva"),
      home: new HomePage(),
      routes: <String, WidgetBuilder> {
        "/SecondPage": (BuildContext context) => new SecondPage(),
        "/Projects": (BuildContext context) => new Projects(),
        "/CreateProject": (BuildContext context) => new CreateProject(),
        "/NotificationsPage": (BuildContext context) => new NotificationsPage()
        
      }
    )
  );
}
