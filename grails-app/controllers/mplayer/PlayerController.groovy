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
      if(!session.registeredUser.isAttached())
        session.registeredUser.attach()

      def playlists = session.registeredUser.getPlaylists()

      [playlists: playlists]
    }
}
