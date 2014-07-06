package mplayer

class TracksController {

    def index() {
      def tracks = Track.list()

      render tracks
    }
}
