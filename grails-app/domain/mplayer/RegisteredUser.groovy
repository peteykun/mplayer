package mplayer

class RegisteredUser {
  String email;
  String password;

  static hasMany = [albums: Album, playlists: Playlist]

  static constraints = {
  }
}
