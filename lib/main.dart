import 'package:flutter/material.dart';
import 'package:todo_app/screens/home_screen.dart';

// TODOtarih ve zaman picker, button
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App UI',
      theme: ThemeData(
        primaryColor: Color(0xFF3EBACE),
        accentColor: Colors.blueAccent,
        scaffoldBackgroundColor: Color(0xFFFAFAFA),
      ),
      home: HomeScreen(),
    );
  }
}
