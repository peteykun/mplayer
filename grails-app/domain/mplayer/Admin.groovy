package mplayer

class Admin {
  String email;
  String password;

  static hasMany = [albums: Album, playlists: Playlist]

  static constraints = {
  }
}
