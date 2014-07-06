package mplayer

class Track {
    String title
    int track
    int disc

    byte[] filePayload
    String fileType
    String fileName

    static belongsTo = [Artist, Album]

    static constraints = {
      filePayload(nullable: true, maxSize: 1073741824) 
    }
}
