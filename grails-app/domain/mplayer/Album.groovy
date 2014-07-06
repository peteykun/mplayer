package mplayer

class Album {
    String name

    byte[] filePayload
    String fileType
    String fileName

    static hasMany = [tracks: Track]

    static constraints = {
      filePayload(nullable: true, maxSize: 1073741824) 
    }
}
