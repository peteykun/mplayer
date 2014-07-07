package mplayer

import grails.converters.JSON

class AlbumsController {

    def index() {
      def albums = Album.list()

      render albums as JSON
    }

    def show(Album albumInstance) {
      render(contentType: "application/json") {
        album(id: albumInstance.id,
        name: albumInstance.name,
        tracks: albumInstance.getTracks())
      }
    }

    def art(Album albumInstance) {
      if(albumInstance.filePayload != null) {
        response.outputStream << albumInstance.filePayload
        response.outputStream.flush()
      } else
        redirect(uri: '/assets/generic-album.jpg')
    }
}
