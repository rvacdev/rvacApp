import 'package:flutter/material.dart';
import 'package:rvac/home_screen.dart';
import "package:rvac/volunteer.dart";
import 'package:rvac/contact_us.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const Volunteer(),
    const ContactUs(),
  ];

  void _onSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('River Valley Art Center'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.volunteer_activism),
            label: 'Volunteer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_support),
            label: 'Contact Us',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onSelected,
      ),
    );
  }
}
