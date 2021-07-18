import 'package:flutter/material.dart';
import 'package:music_app/data/const.dart';
import 'package:music_app/data/song.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:line_icons/line_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SongList? data;

  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }

  Future<String> getJson() async {
    var _jsonData = await http.get(
      Uri.parse(
        'http://www.json-generator.com/api/json/get/bTWrUihbdu?indent=2',
      ),
    );
    return _jsonData.body;
  }

  void _getUser() async {
    String _jsonData = await getJson();
    SongList _data = SongList.fromJson(json.decode(_jsonData));

    await Future.delayed(const Duration(milliseconds: 550));

    setStateIfMounted(() => data = _data);
    print('done fetching');

    //data!.songList.forEach((song) => print('${song.songName}'));
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: data == null
          ? _loadScreen()
          : SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildTitleButton("Bài hát"),
                  _buildSong(0),
                  _buildSong(1),
                  _buildSong(2),
                  _buildTitleButton("Top 100"),
                  buildHorizontalLIst(),
                  _buildTitleButton("Top 200"),
                  buildHorizontalLIst(),
                  _buildTitleButton("Top 300"),
                  buildHorizontalLIst(),
                  _buildTitleButton("Top 400"),
                  buildHorizontalLIst(),
                  _buildTitleButton("Top 500"),
                  buildHorizontalLIst(),
                  _buildTitleButton("Top 600"),
                  buildHorizontalLIst(),
                  _buildTitleButton("Top 700"),
                  buildHorizontalLIst(),
                  _buildTitleButton("Top 800"),
                  buildHorizontalLIst(),
                  _buildTitleButton("Top 900"),
                  buildHorizontalLIst(),
                  _buildTitleButton("Top 1000"),
                  buildHorizontalLIst(),
                ],
              ),
            ),
    );
  }

  Padding buildHorizontalLIst() {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: SizedBox(
        height: 170,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 50,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: FittedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage('https://picsum.photos/400'),
                            fit: BoxFit.cover),
                        color: primeOrange,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(
                    width: 150,
                    height: 25,
                    child: Text(
                      data!.songList[index].songName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    height: 25,
                    child: Text(
                      data!.songList[index].songAuthor,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        color: lighterGrey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildSong(index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage('https://picsum.photos/400'),
                        fit: BoxFit.cover),
                    color: primeOrange,
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(width: 22),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 190,
                    child: Text(
                      data!.songList[index].songName,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    data!.songList[index].songAuthor,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      fontSize: 18,
                      color: lighterGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.more_horiz_rounded,
              size: 26,
              color: Colors.white,
            ),
            onPressed: () => print("Pressed more"),
          )
        ],
      ),
    );
  }

  Padding _buildTitleButton(text) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 20),
      child: GestureDetector(
        onTap: () => print("Pressed Playlist"),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: Colors.white,
              size: 35,
            ),
          ],
        ),
      ),
    );
  }

  Center _loadScreen() {
    return Center(
      child: SizedBox(
        width: 60,
        height: 60,
        child: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(primeOrange),
          strokeWidth: 5,
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: darkGrey,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.all(10),
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
              onPressed: () => print("Pressed setting"),
            ),
          ],
        ),
      ),
    );
  }
}
