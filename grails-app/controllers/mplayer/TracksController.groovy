package mplayer

import groovy.json.JsonBuilder;

class TracksController {

    def index() {
      def tracks = Track.list()

      def tracks = new JsonBuilder()

      def root = tracks.tracks {
        id id
      } 
      //render(contentType: "application/json") {
      //  Track.list()
      //}
    }

    def listen(Track trackInstance) {
        response.outputStream << trackInstance.filePayload
        response.outputStream.flush()
    }
}
