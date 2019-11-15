import 'package:flutter/material.dart';
import "src/app.dart";
import "src/login_page.dart";

void main() { 
  runApp(
    new MaterialApp(
      theme: ThemeData(fontFamily: "Mansalva"),
      home: new LoginPage(),
      routes: <String, WidgetBuilder> {
        "/HomePage": (BuildContext context) => new HomePage(),
        "/SecondPage": (BuildContext context) => new SecondPage(),
        "/Projects": (BuildContext context) => new Projects(),
        "/CreateProject": (BuildContext context) => new CreateProject(),
        "/NotificationsPage": (BuildContext context) => new NotificationsPage(),
        "/LoginPage": (BuildContext context) => new LoginPage(),
        
      }
    )
  );
}
