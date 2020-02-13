import 'dart:async';
import 'package:flutter/material.dart';
import 'package:material_test/src/app.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';


class SecondPage extends StatefulWidget{

  @override
  SecondPageState createState() => SecondPageState();
  
}


class SecondPageState extends State <SecondPage> {

CalendarController _controller;

//NEW STUFF
String todoName = "Display the todo name here";

@override
void initState() {
FirebaseTodos.getTodo("info1").then(updateTodo);
super.initState();
_controller = CalendarController();
  
  }
  @override
   Widget build(context){
     return new Scaffold (
       backgroundColor: bgColor,
       appBar: new AppBar(title: new Text("$todoName"),
       backgroundColor: barColor,
       ),
     body: new Container(
       child: new Center(
         child: new Column(
           children: <Widget>[
             TableCalendar(calendarController: _controller,
             startingDayOfWeek: StartingDayOfWeek.monday,
             availableCalendarFormats: const {
             CalendarFormat.month: 'month',
             CalendarFormat.twoWeeks: 'Two weeks'
             
      },
      
             calendarStyle: CalendarStyle(
               todayColor: barColor, ),
                )
           ],
         ),
       ),
       
     ),
     );
  }

    updateTodo(Todo value) {
    var name = value.name;
    setState(() {
      todoName = name;
    });
  }
  
}

//NEW STUFF
class Todo {
  final String key;
  String name;

  Todo.fromJson(this.key, Map data) {
    name = data[ "name"];
    if(name == null) {
      name = "";
    } 
  }
}

class FirebaseTodos {
  static Future<StreamSubscription<Event>> getTodoStream(String todoKey,
      void onData(Todo todo)) async {
    String accountKey = await Preferences.getAccountKey();

    StreamSubscription<Event> subscription = FirebaseDatabase.instance
        .reference()
        .child("users")
        .child(accountKey)
        .child("userinfo")
        .child(todoKey)
        .onValue
        .listen((Event event) {
      var todo = new Todo.fromJson(event.snapshot.key, event.snapshot.value);
      onData(todo);
    });
      return subscription;
  }

    static Future<Todo> getTodo(String todoKey) async {
      Completer<Todo> completer = new Completer<Todo>();

      String accountKey = await Preferences.getAccountKey();

      FirebaseDatabase.instance
          .reference()
          .child("users")
          .child(accountKey)
          .child("userinfo")
          .child(todoKey)
          .once()
          .then((DataSnapshot snapshot) {
        var todo = new Todo.fromJson(snapshot.key, snapshot.value);
        completer.complete(todo);
      });
      return completer.future;
    }
}

class Preferences {
  static const String ACCOUNT_KEY = "accountKey";

  static Future<bool> setAccountKey(String accountKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(ACCOUNT_KEY, accountKey);
    return prefs.commit();
  }

  static Future<String> getAccountKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accountKey = prefs.getString(ACCOUNT_KEY);

    if(accountKey == null){
      accountKey = "0";
    }
    return accountKey;
  }
}