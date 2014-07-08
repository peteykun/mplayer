package mplayer

class PlaylistsController {
  
    def beforeInterceptor = [action:this.&checkUser]
  
    def checkUser() {
      if(!session.registeredUser) {
        redirect(controller:'registeredUser',action:'login')
        return false
      }
    }

    def index() {

      // def playlists = Playlist.findAll('from Playlist as p where p.creator = :creator order by p.name', [creator: session.registeredUser])

      // render playlists as JSON

      render 'nothing to see here'
    }

    def show(Playlist playlistInstance) {
      render(contentType: "application/json") {
        album(id: playlistInstance.id,
        name: playlistInstance.name,
        tracks: playlistInstance.tracks)
      }
    }
}
