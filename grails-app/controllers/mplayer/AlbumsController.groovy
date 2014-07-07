package mplayer

import grails.converters.JSON

class AlbumsController {
  
    def beforeInterceptor = [action:this.&checkUser]
  
    def checkUser() {
      if(!session.registeredUser) {
        redirect(controller:'registeredUser',action:'login')
        return false
      }
    }

    def index() {
      def albums = Album.findAll('from Album as a where a.uploader = :uploader order by a.name', [uploader: session.registeredUser])

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
