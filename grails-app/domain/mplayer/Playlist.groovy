package mplayer

class Playlist {
  RegisteredUser creator
  String name

  static hasMany = [tracks: Track]

  static constraints = {
  }

  String toString() {
    return name;
  }
}
