import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app/screens/new_task_screen.dart';

class TodosScreen extends StatefulWidget {
  final String categoryName;
  final int taskCount;
  final IconData icon;
  final Color iconColor;

  TodosScreen({this.categoryName, this.taskCount, this.icon, this.iconColor});
  @override
  _TodosScreenState createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: widget.iconColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return NewTask(
                  color: widget.iconColor,
                  categoryName: widget.categoryName,
                );
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        color: widget.iconColor,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              _pageControlPanel(),
              _categoryInfo(),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36),
                      topRight: Radius.circular(36),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, -3),
                        blurRadius: 8,
                        spreadRadius: -5,
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Late",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        _todos(
                            todo: "Call Max",
                            date: "2015 - April 29",
                            status: -1),
                        _todos(
                            todo: "Read a Book",
                            date: "2015 - April 29",
                            status: -1),
                        SizedBox(height: 24),
                        Text(
                          "Today",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        _todos(
                            todo: "Practice Piano", date: "16:00", status: 0),
                        _todos(todo: "Learn Spanish", date: "17:00", status: 0),
                        SizedBox(height: 24),
                        Text(
                          "Done",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        _todos(
                            todo: "Finalize pressntation",
                            date: "16:00",
                            status: 1),
                        _todos(todo: "Learn Spanish", date: "17:00", status: 1),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _todos({String todo, String date, int status}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 200,
                  child: Text(
                    todo,
                    style: TextStyle(
                      fontSize: 20,
                      color: status == 1 ? widget.iconColor : Colors.black,
                      decoration: status == 1
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 16,
                    color: status == -1
                        ? Colors.red
                        : status == 1 ? Colors.grey : Colors.black,
                  ),
                )
              ],
            ),
            Checkbox(
              activeColor: widget.iconColor,
              value: status == 1,
              onChanged: (value) {},
            )
          ],
        ),
      ],
    );
  }

  Widget _pageControlPanel() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 16, 8, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.white,
            ),
          ),
          Icon(
            FontAwesomeIcons.ellipsisV,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _categoryInfo() {
    return Container(
      height: 230,
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: EdgeInsets.only(top: 40, left: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Icon(
                widget.icon,
                color: widget.iconColor,
                size: 36,
              ),
            ),
            SizedBox(height: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.categoryName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  widget.taskCount.toString() + " Tasks",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
