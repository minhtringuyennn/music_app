import 'package:flutter/material.dart';
import 'package:music_app/screens/base_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/data/const.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music App',
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        textTheme: GoogleFonts.quicksandTextTheme(
          Theme.of(context).textTheme,
        ),
        scaffoldBackgroundColor: darkGrey,
      ),
      home: BaseScreen(),
    );
  }
}
