import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:table_calendar/table_calendar.dart';

  final barColor = const Color(0xFF1f2833);
  final bgColor = const Color(0xFFc5c6c7);
  final iconColor = const Color(0xFFedb5bf);

class HomePage extends StatelessWidget {

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
             CalendarFormat.month: '',
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
             
            new Text("${widget.value}"),

           ],
         ),
        ),
     );
   }
}

//create project
class CreateProject extends StatefulWidget{

  @override
  CreateProjectState createState() =>  CreateProjectState();
  
}


class  CreateProjectState extends State <CreateProject> {
final formKey = GlobalKey<FormState>();
var _textController = new TextEditingController();

 String name, people, description;

 

 

   Widget build(context){
     return new Scaffold (
       backgroundColor: bgColor,
       appBar: new AppBar(title: new Text('Create Project'),
       iconTheme: new IconThemeData(color: iconColor),
       centerTitle: true,
       backgroundColor: barColor,
       ),
       //form
       body:  Card (
         child: Padding(
           padding: EdgeInsets.all(8.0),
           child: Form(
             key: formKey,
             child: Column(
               mainAxisSize: MainAxisSize.min,
               children: <Widget>[
                 
                 TextFormField(
                   controller: _textController,
                   decoration: InputDecoration(
                    labelText: 'Project name:'
                   ),
                    
                   validator:  (input) => input.length > 15 ? 'Name max 15 characters' : null,
                    onSaved: (input) => name = input,

                   ),
                   TextFormField(
                   decoration: InputDecoration(
                    labelText: 'Project description:'
                   ),
                   validator:  (input) => input.length < 20 ? 'Description needs to be atleast 20 characters' : null,
                    onSaved: (input) => description = input,

                   ),
                   TextFormField(
                   decoration: InputDecoration(
                    labelText: 'People:'
                   ),
                   validator:  (input) => input.length > 30 ? 'Max 3 people' : null,
                   onSaved: (input) => people = input,
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: <Widget>[
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: RaisedButton(
                           onPressed: (){
                            
                            if(formKey.currentState.validate()){


                            
                            var route = new MaterialPageRoute(
                              builder: (BuildContext context) => 
                              new Projects(value: _textController.text),

                             
                            );
                             formKey.currentState.save();
                             Navigator.of(context).push(route);
                            }
                           // _submit();
                            
                            
                          // arttu on paskea
                           }, 
                           child: Text('Submit'),
                          ),
                          
                           
                       )
                     ],
                   )
               ],
             ),
             ),
         )
        ),
     );
   }
   
   /*void _submit(){
     if(formKey.currentState.validate()){
    formKey.currentState.save();
    
    
    print(name);
    print(description);
    print(people);
     
     }
   }
   */
}
