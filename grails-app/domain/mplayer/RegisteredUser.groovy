package mplayer

class RegisteredUser {
  String email;
  String password;

  static hasMany = [albums: Album, artists: Artist, playlists: Playlist]

  static constraints = {
  }

  String toString() {
    return email;
  }
}
