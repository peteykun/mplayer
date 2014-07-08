package mplayer

class Artist {
  String name
  RegisteredUser uploader

  static hasMany = [tracks: Track]

  static constraints = {
  }

  String toString() {
    "${name}" 
  } 
}
