package mplayer

class Playlist {
    RegisteredUser creator;

    static hasMany = [tracks: Track]

    static constraints = {
    }
}
