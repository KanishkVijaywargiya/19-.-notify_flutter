import 'package:flutter/material.dart';
import 'package:notify/widget/local_notification.dart';

//1].
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.greenAccent.shade100
      ),  
      home: LocalNotification(),
        
    );
  }
}