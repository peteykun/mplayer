package mplayer

import grails.converters.JSON
import mplayer.Artist

class ArtistMarshaller {
  void register() {
    JSON.registerObjectMarshaller(Artist) { Artist artist ->
      return [
        id: artist.id,
        name: artist.name,
        cover_image_url: Track.findByArtist(artist).album.cover_image_url()
      ]
    }
  }
}
