package mplayer

class Album {
  String name

  byte[] filePayload

  static hasMany = [tracks: Track]

  static constraints = {
    filePayload(nullable: true, maxSize: 1073741824) 
  }

  String toString() {
    "${name}" 
  } 
}
