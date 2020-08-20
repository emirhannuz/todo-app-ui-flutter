import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewTask extends StatefulWidget {
  final Color color;
  final String categoryName;
  NewTask({this.color = Colors.blue, this.categoryName});
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
            child: Column(
              children: <Widget>[
                _pageControlPanel(),
                SizedBox(height: 24),
                _inputFieldsContainer(),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: _createButton(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _createButton() {
    return Container(
      width: double.infinity,
      height: 70,
      child: RaisedButton(
        onPressed: () {},
        child: Text('Create', style: TextStyle(fontSize: 20)),
        color: widget.color,
        textColor: Colors.white,
        elevation: 5,
      ),
    );
  }

  Widget _inputFieldsContainer() {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: widget.color),
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "What are you planning?",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                TextField(
                  textCapitalization: TextCapitalization.sentences,
                  cursorColor: widget.color,
                  maxLength: 255,
                  maxLines: 5,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: widget.color),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                _textField(
                    hintText: "DateTime picker",
                    icon: FontAwesomeIcons.calendarAlt),
                _textField(
                    hintText: "Add note", icon: FontAwesomeIcons.stickyNote),
                _textField(
                    hintText: "Category",
                    icon: FontAwesomeIcons.tag,
                    categoryName: widget.categoryName),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textField({IconData icon, String hintText, String categoryName}) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        textInputAction: TextInputAction.done,
        initialValue: widget.categoryName != null ? categoryName : "",
        cursorColor: widget.color,
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: widget.color,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: widget.color),
          ),
          hintText: hintText,
          focusColor: widget.color,
          icon: Icon(icon),
        ),
      ),
    );
  }

  Widget _pageControlPanel() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 16, 8, 0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox.shrink(),
            Text(
              "New task",
              style: TextStyle(fontSize: 24),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.clear,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
