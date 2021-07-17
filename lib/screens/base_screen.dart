import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:music_app/screens/home_screen.dart';
import 'package:music_app/screens/playlist.dart';
import 'package:music_app/screens/video.dart';
import 'package:music_app/screens/search.dart';
import 'package:music_app/data/const.dart';

import 'package:line_icons/line_icons.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen();

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ContactScreen(),
    AppScreen(),
    CalenderScreen(),
  ];

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: lightGrey, // navigation bar color
      statusBarColor: darkGrey, // status bar color
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: SizedBox(
        height: 90,
        child: BottomNavigationBar(
            selectedLabelStyle: TextStyle(fontSize: 18),
            unselectedLabelStyle: TextStyle(fontSize: 17),
            backgroundColor: lightGrey,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: primeOrange,
            unselectedItemColor: lighterGrey,
            
            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(LineIcons.home, size: 32),
                ),
                label: "Trang chủ",
              ),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(LineIcons.heart, size: 32),
                  ),
                  label: "Bộ sưu tập"),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(LineIcons.photoVideo, size: 32),
                ),
                label: "Video",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(LineIcons.search, size: 32),
                ),
                label: "Tìm kiếm",
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: (int index) => setState(() => _selectedIndex = index)),
      ),
    );
  }
}
