package mplayer

import grails.converters.JSON

class ArtistsController {

    def index() {
      def artists = Artist.list()

      render artists as JSON
    }

    def show(Artist artistInstance) {
      render artistInstance as JSON
    }
}
