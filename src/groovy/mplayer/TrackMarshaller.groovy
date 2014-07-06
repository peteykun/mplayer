package mplayer

import grails.converters.JSON
import mplayer.Track

class TrackMarshaller {
  void register() {
    JSON.registerObjectMarshaller(Track) { Track track ->
      return [
        id: track.id,
        track: track.track,
        disc: track.disc,
        title: track.title,
        artist: track.artist.name,
        album: track.album.name
      ]
    }
  }
}
