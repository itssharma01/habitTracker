import 'package:flutter/material.dart';
import 'package:habit_tracker/pages/habitspage.dart';
import 'package:habit_tracker/pages/homepage.dart';
import 'package:habit_tracker/pages/profilepage.dart';
import 'package:habit_tracker/pages/progresspage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: NavigationScreen(
        currIndx: 0,
      ),
    );
  }
}

class NavigationScreen extends StatefulWidget {
   NavigationScreen({required this.currIndx});
   int currIndx;

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}
  const List<Widget> screens = [
    Homepage(),
    Progresspage(),
    Habitpage(),
    Profilepage(),
  ];

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: widget.currIndx,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.deepPurpleAccent,
        currentIndex: widget.currIndx,
        onTap: (index) {
          setState(() {
             widget.currIndx = index;
          });
        },
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today),label: 'Progress'),
          BottomNavigationBarItem(icon: Icon(Icons.timeline),label: 'Habits'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
        ],
      ),
    );
  }
}

