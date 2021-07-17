import 'package:flutter/material.dart';
import 'package:music_app/data/const.dart';

import 'package:line_icons/line_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: darkGrey,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Text(
                    "M",
                    style: TextStyle(
                      color: primeOrange,
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                    ),
                  ),
                  Text(
                    "UVI",
                    style: TextStyle(
                      color: primeOrange,
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                    ),
                  )
                ],
              ),
            ),
            IconButton(
              icon: Icon(LineIcons.cog, color: Colors.white, size: 40),
              onPressed: () => print("setting pressed"),
            ),
          ],
        ),
      ),
    );
  }
}
