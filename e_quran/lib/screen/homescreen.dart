import 'package:e_quran/screen/bookmark_surah_screen.dart';
import 'package:e_quran/screen/list_surah_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   int _selectedIndex = 0;
  final screens = [
    const ListSurahScreen(),
    const BookmarkScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  } 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(_selectedIndex),
       bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Surah",
          ),
          BottomNavigationBarItem(
              icon:Icon(Icons.bookmark), 
              label: "Bookmark"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}