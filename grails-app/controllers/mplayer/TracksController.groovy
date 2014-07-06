package mplayer

import grails.converters.JSON

class TracksController {

    def index() {
      def tracks = Track.list()

      render tracks as JSON
    }

    def show(Track trackInstance) {
      render trackInstance as JSON
    }

    def listen(Track trackInstance) {
        response.outputStream << trackInstance.filePayload
        response.outputStream.flush()
    }
}
