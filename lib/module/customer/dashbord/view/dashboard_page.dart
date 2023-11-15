import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/module/customer/home/view/home_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  static const pageName = "DashBoardPage";

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Scaffold(
            resizeToAvoidBottomInset: false,

        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: screenHeight * 0.02),
          child: Container(
            width: screenWidth * 0.8,
            height: kBottomNavigationBarHeight * 0.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(32, 12, 53, 86)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.home,
                      color: _currentIndex == 0
                          ? Colors.orange.shade300
                          : Colors.grey),
                  onPressed: () => _onTabTapped(0),
                ),
                IconButton(
                  icon: Icon(Icons.bar_chart,
                      color: _currentIndex == 1
                          ? Colors.orange.shade300
                          : Colors.grey),
                  onPressed: () => _onTabTapped(1),
                ),
                IconButton(
                  icon: Icon(Icons.health_and_safety_rounded,
                      color: _currentIndex == 2
                          ? Colors.orange.shade300
                          : Colors.grey),
                  onPressed: () => _onTabTapped(2),
                ),
                IconButton(
                  icon: Icon(Icons.person,
                      color: _currentIndex == 3
                          ? Colors.orange.shade300
                          : Colors.grey),
                  onPressed: () => _onTabTapped(3),
                ),
              ],
            ),
          ),
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: const [
            HomePage(),
            //  Scaffold(backgroundColor: Colors.amber,),
            Scaffold(
              backgroundColor: Colors.cyan,
            ),
            Scaffold(
              backgroundColor: Colors.green,
            ),
            Scaffold(
              backgroundColor: Colors.green,
            )
          ],
        ));
  }
}
