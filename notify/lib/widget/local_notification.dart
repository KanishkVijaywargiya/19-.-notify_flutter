import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notify/pages/calender.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import '../local_notification_helper.dart';

class LocalNotification extends StatefulWidget {
  @override
  _LocalNotificationState createState() => _LocalNotificationState();
}

class _LocalNotificationState extends State<LocalNotification> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Calender',
      style: optionStyle,
    ),
    Text(
      'Index 2: Chat',
      style: optionStyle,
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  //instance;
  final notifications = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    /***  initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project ***/
    var initializationSettingsAndroid = AndroidInitializationSettings('icon');
    var initializationSettingsIOS = IOSInitializationSettings(onDidReceiveLocalNotification: (id, title, body, payload) => onSelectNotification(payload));
    notifications.initialize(InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS), onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async => await Navigator.push(context, MaterialPageRoute(builder: (context) => Calender(payload: payload)));
  
  @override
  Widget build(BuildContext context){
     return Scaffold(
      appBar: GradientAppBar(
        title: Text('Notify'),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        backgroundColorStart: Color(0xff34e89e),
        backgroundColorEnd: Color(0xfffff),
      ),
      floatingActionButton: FloatingActionButton(
        
          onPressed: () => showOngoingNotification(
              notifications,
              title: 'Tite', 
              body: 'Body'
          ),
          backgroundColor: Color(0xff34e89e),
          elevation: 10.0,
          hoverColor: Color(0xff0f3443),
          child: Icon(Icons.notifications_active),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home, color: Color(0xff34e89e),),
            backgroundColor: Colors.transparent,
            title: Text('Home', style: TextStyle(color: Color(0xff4ac29a)),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            activeIcon: Icon(Icons.calendar_today, color: Color(0xff34e89e),),
            backgroundColor: Colors.transparent,
            title: Text('Calender', style: TextStyle(color: Color(0xff4ac29a))),
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat,),
            activeIcon: Icon(Icons.chat, color: Color(0xff34e89e),),
            backgroundColor: Colors.transparent,
            title: Text('Chat', style: TextStyle(color: Color(0xff4ac29a))),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}