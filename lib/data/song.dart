class SongList {
  List<Song> songList;

  SongList(this.songList);

  factory SongList.fromJson(List<dynamic> listJson) {
    List<Song> songList =
        listJson.map((value) => Song.fromJson(value)).toList();
    return SongList(songList);
  }
}

class Song {
  final String songName;
  final String songAuthor;

  Song(this.songName, this.songAuthor);

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(json["name"].toString(), json["author"].toString());
  }
}
