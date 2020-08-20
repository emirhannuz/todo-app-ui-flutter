import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app/screens/todos_screen.dart';

class CategoryBuilder extends StatefulWidget {
  @override
  _CategoryBuilderState createState() => _CategoryBuilderState();
}

class _CategoryBuilderState extends State<CategoryBuilder> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildCategoryRowContainer(
            buildCategoryContainer1: _buildCategoryContainer(
              categoryName: "All",
              taskCount: 25,
              icon: FontAwesomeIcons.listAlt,
              iconColor: Colors.blue,
            ),
            buildCategoryContainer2: _buildCategoryContainer(
              categoryName: "Work",
              taskCount: 14,
              icon: FontAwesomeIcons.briefcase,
              iconColor: Colors.orange,
            ),
          ),
          _buildCategoryRowContainer(
            buildCategoryContainer1: _buildCategoryContainer(
              categoryName: "Music",
              taskCount: 6,
              icon: FontAwesomeIcons.headphones,
              iconColor: Colors.green,
            ),
            buildCategoryContainer2: _buildCategoryContainer(
              categoryName: "Travel",
              taskCount: 1,
              icon: FontAwesomeIcons.planeDeparture,
              iconColor: Colors.red[300],
            ),
          ),
          _buildCategoryRowContainer(
            buildCategoryContainer1: _buildCategoryContainer(
              categoryName: "Study",
              taskCount: 2,
              icon: FontAwesomeIcons.school,
              iconColor: Colors.purple,
            ),
            buildCategoryContainer2: _buildCategoryContainer(
              categoryName: "Home",
              taskCount: 14,
              icon: FontAwesomeIcons.home,
              iconColor: Colors.red,
            ),
          ),
          _buildCategoryRowContainer(
            buildCategoryContainer1: _buildCategoryContainer(
              categoryName: "Hobby",
              taskCount: 2,
              icon: FontAwesomeIcons.palette,
              iconColor: Colors.yellow,
            ),
            buildCategoryContainer2: _buildCategoryContainer(
              categoryName: "Shop",
              taskCount: 4,
              icon: FontAwesomeIcons.shoppingCart,
              iconColor: Colors.cyan,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryRowContainer(
      {@required Widget buildCategoryContainer1,
      @required Widget buildCategoryContainer2}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 180,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            buildCategoryContainer1,
            buildCategoryContainer2,
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryContainer(
      {String categoryName, int taskCount, IconData icon, Color iconColor}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return TodosScreen(
                categoryName: categoryName,
                taskCount: taskCount,
                icon: icon,
                iconColor: iconColor,
              );
            },
          ),
        );
      },
      child: Container(
        height: 160,
        width: (MediaQuery.of(context).size.width - 48) / 2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              offset: Offset(2, 2),
              blurRadius: 5,
              spreadRadius: -5,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 0, 10),
          child: Stack(
            children: <Widget>[
              Icon(
                icon,
                size: 36,
                color: iconColor,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    categoryName,
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: 3),
                  Text(
                    taskCount.toString() + " Tasks",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
