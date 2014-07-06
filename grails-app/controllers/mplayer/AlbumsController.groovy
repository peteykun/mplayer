package mplayer

class AlbumsController {

    def index() { }

    def art(Album albumInstance) {
        response.outputStream << albumInstance.filePayload
        response.outputStream.flush()
    }
}
