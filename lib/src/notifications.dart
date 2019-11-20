import 'package:flutter/material.dart';
import 'package:material_test/src/app.dart';

class NotificationsPage extends StatelessWidget {
     Widget build(context){
     return new Scaffold (
      backgroundColor: bgColor,
      appBar: new AppBar(
        iconTheme: new IconThemeData(color: iconColor),
         centerTitle: true,
         title: new Text('Notifications'),
       backgroundColor: barColor,
       ),
     body: new Container(
       child: new Center(
         child: new Column(
         )
         ),
       ),
     );
   }
}
