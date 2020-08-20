import 'package:flutter/material.dart';
import 'package:todo_app/screens/new_task_screen.dart';
import 'package:todo_app/screens/widgets/category_builder.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return NewTask();
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.menu,
                    size: 36,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Lists",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            CategoryBuilder(),
          ],
        ),
      ),
    );
  }
}
