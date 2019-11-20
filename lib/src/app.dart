import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:table_calendar/table_calendar.dart';


  final barColor = const Color(0xFF1f2833);
  final bgColor = const Color(0xFFc5c6c7);
  final iconColor = const Color(0xFFedb5bf);
  final yeetColor = const Color(0xFF2F4F4F);

class HomePage extends StatelessWidget {
  //kikkeli
  Widget build(context){
    return new Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: Column(           
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            MaterialButton(
              padding: EdgeInsets.all(20.0),
              color: iconColor,
              splashColor: barColor,
              minWidth: 300,
              elevation: 8,
               shape: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(10)
               ),
               
               


              child: Text('Create Project'),
              onPressed: () {
                     Navigator.of(context).pushNamed("/CreateProject");
              },
            )
            ]
          )
        )
      ),
      backgroundColor: bgColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: barColor,
        child: Icon(Icons.audiotrack, color: iconColor),
        onPressed: (){
         /* setState(() {
            myValue += 1;
          });*/
        },
      ),

//hampurilainen
      drawer: new Drawer(
        child: Container(color: barColor,
        child: new ListView(
          children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text("Pepega"),
            accountEmail: new Text("pepe.ga@edu.xamk.fi"),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                fit: BoxFit.fill,
                image: new NetworkImage("https://cdn.vox-cdn.com/thumbor/sju_qQOu_hFwDaCCHllhMOXNunQ=/0x0:1000x949/1200x0/filters:focal(0x0:1000x949):no_upscale()/cdn.vox-cdn.com/uploads/chorus_asset/file/10838129/feelsbadman.jpg"),
              ),
            ),
          ),
          
            new ListTile(
              title: new Text('Calendar', style: TextStyle(color: Colors.white)),
              trailing:  new Icon(Icons.arrow_upward, color: iconColor,),
              onTap: () {
                Navigator.of(context).pop(); 
                Navigator.of(context).pushNamed("/SecondPage");
                },
              
              
            ),
              new ListTile(
              title: new Text('Projects', style: TextStyle(color: Colors.white)),
              trailing:  new Icon(Icons.arrow_drop_up, color: iconColor,),
              onTap: () {
                Navigator.of(context).pop(); 
                Navigator.of(context).pushNamed("/Projects");
                },
            ),
              new Divider(),
              new ListTile(
              title: new Text('Close', style: TextStyle(color: Colors.white),),
              trailing:  new Icon(Icons.cancel, color: iconColor,),
              onTap: () => Navigator.of(context).pop(),
            ),
                           new ListTile(
              title: new Text('Log Out', style: TextStyle(color: Colors.white)),
              trailing:  new Icon(Icons.cancel, color: iconColor,),
              onTap: () {
                Navigator.of(context).pop(); 
                Navigator.of(context).pushNamed("/LoginPage");
                },
            ),
          ],
        ),
        ),
      ),

//yläpalkki
      appBar: AppBar(
        centerTitle: true,
        title: Text("Yeet machine 2000"),
        backgroundColor: barColor,
        iconTheme: new IconThemeData(color: iconColor),
       /* leading: Builder(
          builder: (BuildContext context){
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: (){Scaffold.of(context).openDrawer(); }
            );
          },
        ),*/
        actions: <Widget>[
          Builder(
          builder: (BuildContext context){
            return IconButton(
              icon: const Icon(Icons.notifications,),
              onPressed: () => Navigator.of(context).pushNamed("/NotificationsPage",)
            );
          },
        ),
        ]
        ),
      );
  }
}

class SecondPage extends StatefulWidget{

  @override
  SecondPageState createState() => SecondPageState();
  
}


class SecondPageState extends State <SecondPage> {

CalendarController _controller;

void initState(){

super.initState();
_controller = CalendarController();
  
  }
  
   Widget build(context){
     return new Scaffold (
       backgroundColor: bgColor,
       appBar: new AppBar(title: new Text('Calendar'),
       backgroundColor: barColor,
       ),
     body: new Container(
       child: new Center(
         child: new Column(
           children: <Widget>[
             TableCalendar(calendarController: _controller,
             startingDayOfWeek: StartingDayOfWeek.monday,
             availableCalendarFormats: const {
             CalendarFormat.month: '2',
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
}

//notifications
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

//projects
class Projects extends StatefulWidget{
  
 final String value;

  Projects({Key key, this.value}) : super(key: key);
  @override
  ProjectsState createState() =>  ProjectsState();
  
}


class  ProjectsState extends State <Projects> {

 
   Widget build(context){
     return new Scaffold (
       backgroundColor: bgColor,
       appBar: new AppBar(title: new Text('Projects'),
       iconTheme: new IconThemeData(color: iconColor),
       centerTitle: true,
       backgroundColor: barColor,
       ),
          body: new Center(
         child: new Column(
           children: <Widget>[
             
            new Text("Insert many pröjects here pls"),
            
            
             
           ],
         ),
        ),
     );
   }
}

//create project
