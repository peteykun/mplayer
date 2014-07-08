package mplayer

class PlaylistsController {
  
    def beforeInterceptor = [action:this.&checkUser]
  
    def checkUser() {
      if(!session.registeredUser) {
        redirect(controller:'registeredUser',action:'login')
        return false
      }
    }

    def create() {
      Playlist p = new Playlist(
        name: params.name,
        creator: session.registeredUser
      ).save()

      render(contentType: "application/json") {
        playlist(id: p.id,
        name: p.name)
      }
    }

    def index() {

      // def playlists = Playlist.findAll('from Playlist as p where p.creator = :creator order by p.name', [creator: session.registeredUser])

      // render playlists as JSON

      render 'nothing to see here'
    }

    def show(Playlist playlistInstance) {
      render(contentType: "application/json") {
        playlist(id: playlistInstance.id,
        name: playlistInstance.name,
        tracks: playlistInstance.tracks)
      }
    }

    def addSong() {
      def playlist = Playlist.get(params.playlist_id)
      def song = Track.get(params.track_id)

      if(!(song in playlist.tracks)) {
        song.addToPlaylists(playlist).save(flush: true)
        render 'added'
      } else {
        render 'already present'
      }
    }

    def addAlbum() {
      def playlist = Playlist.get(params.playlist_id)
      def album = Album.get(params.album_id)

      for(song in album.tracks) {
        if(!(song in playlist.tracks)) {
          song.addToPlaylists(playlist).save(flush: true)
        }
      }
      
      render 'added'
    }
}
