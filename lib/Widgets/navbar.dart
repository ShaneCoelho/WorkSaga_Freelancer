import 'package:flutter/material.dart';
import 'package:worksaga_freelancer/Screens/homepage.dart';

class Navbar extends StatefulWidget {
  @override
  NavbarState createState() => NavbarState();
}

class NavbarState extends State<Navbar> {
  int _selectedItemIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Row(
          children: <Widget>[
            buildNavBarItem(Icons.home, 0),
            buildNavBarItem(Icons.card_giftcard, 1),
            buildNavBarItem(Icons.camera, 2),
            buildNavBarItem(Icons.person, 3),
          ],
        ),
        body: _children[_selectedItemIndex]);
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / _children.length,
        decoration: index == _selectedItemIndex
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 3, color: Colors.green),
                ),
                gradient: LinearGradient(colors: [
                  Colors.green.withOpacity(0.3),
                  Colors.green.withOpacity(0.015),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                color:
                    index == _selectedItemIndex ? Colors.green : Colors.white,
              )
            : BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectedItemIndex
              ? Color.fromARGB(255, 115, 199, 104)
              : Colors.grey,
        ),
      ),
    );
  }
}
