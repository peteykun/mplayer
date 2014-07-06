package mplayer

import grails.converters.JSON

class AlbumsController {

    def index() {
      def albums = Album.list()

      render albums as JSON
    }

    def show(Album albumInstance) {
      render albumInstance as JSON
    }

    def art(Album albumInstance) {
        response.outputStream << albumInstance.filePayload
        response.outputStream.flush()
    }
}
