package mplayer

class Track {
  String title
  int track
  int disc
  Artist artist
  Album album

  byte[] filePayload

  static hasMany = [playlists: Playlist]
  static belongsTo = Playlist

  static constraints = {
    filePayload(nullable: true, maxSize: 1073741824) 
  }

  String toString() {
    "${title}" 
  }

  String url() {
    "http://localhost:8080/mplayer/tracks/listen/" + id
  }
}
