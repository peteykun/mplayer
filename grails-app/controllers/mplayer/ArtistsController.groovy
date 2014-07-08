package mplayer

import grails.converters.JSON

class ArtistsController {
  
    def beforeInterceptor = [action:this.&checkUser]
  
    def checkUser() {
      if(!session.registeredUser) {
        redirect(controller:'registeredUser',action:'login')
        return false
      }
    }

    def index() {

      def artists = Artist.findAll('from Artist as a where a.uploader = :uploader order by a.name', [uploader: session.registeredUser])

      render artists as JSON
    }

    def show(Artist artistInstance) {
      playlist(contentType: "application/json") {
        album(id: artistInstance.id,
        name: artistInstance.name,
        tracks: artistInstance.tracks)
      }
    }
}
