package mplayer

class Artist {
    String name

    static hasMany = [tracks: Track]

    static constraints = {
    }
}
