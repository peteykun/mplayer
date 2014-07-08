package mplayer

class PlayerController {
  
    def beforeInterceptor = [action:this.&checkUser]
  
    def checkUser() {
      if(!session.registeredUser) {
        redirect(controller:'registeredUser',action:'login')
        return false
      }
    }

    def index() {
      def playlists = Playlist.findAllWhere(creator: session.registeredUser)

      [playlists: playlists]
    }
}
