package mplayer

import grails.converters.JSON
import mplayer.Album

class AlbumMarshaller {
  void register() {
    JSON.registerObjectMarshaller(Album) { Album album ->
      return [
        id: album.id,
        name: album.name,
        tracks: album.tracks,
        cover_image_url: album.cover_image_url()
      ]
    }
  }
}
