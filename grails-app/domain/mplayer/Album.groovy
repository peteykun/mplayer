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

  String cover_image_url() {
    'http://localhost:8080/mplayer/albums/art/' + id
  }
}
