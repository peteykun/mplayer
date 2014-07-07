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

      def artists = Artist.list(sort: 'name')

      render artists as JSON
    }

    def show(Artist artistInstance) {
      render(contentType: "application/json") {
        album(id: artistInstance.id,
        name: artistInstance.name,
        tracks: artistInstance.tracks)
      }
    }
}
