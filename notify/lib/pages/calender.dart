import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class Calender extends StatefulWidget {
  final String payload;
  Calender({@required this.payload, Key key}): super(key: key);

  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text('Tasks - Day & Date of Events'),
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        backgroundColorStart: Color(0xff34e89e),
        backgroundColorEnd: Color(0xfffff),
      ),
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