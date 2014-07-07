package mplayer

import grails.converters.JSON

import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.Path;

import org.jaudiotagger.audio.*;
import org.jaudiotagger.tag.*;
import org.jaudiotagger.tag.images.Artwork;

class TracksController {
  
    def beforeInterceptor = [action:this.&checkUser]
  
    def checkUser() {
      if(!session.registeredUser) {
        redirect(controller:'registeredUser',action:'login')
        return false
      }
    }

    def index() {
      def tracks = Track.list()

      render tracks as JSON
    }

    def show(Track trackInstance) {
      render trackInstance as JSON
    }

    def listen(Track trackInstance) {
      response.outputStream << trackInstance.filePayload
      response.outputStream.flush()
    }

    def synchronized create() {
      byte[] data = params.file.getBytes();
      File testFile = File.createTempFile("uploaded_song", ".mp3", null);
      FileOutputStream fos = new FileOutputStream(testFile);
      fos.write(data);

      AudioFile f = AudioFileIO.read(testFile);
      Tag tag = f.getTag();

      def title = tag.getFirst(FieldKey.TITLE)
      def artist_name = tag.getFirst(FieldKey.ARTIST)
      def album_name = tag.getFirst(FieldKey.ALBUM)
      def track_no = tag.getFirst(FieldKey.TRACK)
      def disc_no = tag.getFirst(FieldKey.DISC_NO)

      Artwork coverArt = tag.getFirstArtwork()
      byte[] imageInBytes = null

      if(coverArt != null) {
        File out = File.createTempFile("cover_art", ".jpg", null);
        ImageIO.write((BufferedImage) coverArt.getImage(), "jpg", out);
        imageInBytes = Files.readAllBytes(out.toPath())
      }

      Artist artist = Artist.findByName(artist_name)

      if(artist == null) {
        artist = new Artist(
          name: artist_name
        );

        artist.save();
      }

      Album album = Album.findByName(album_name)

      if(album == null ) {
        album = new Album(
          name: album_name,
          year: 2014,
          filePayload: imageInBytes,
          uploader: session.registeredUser
        );

        album.save();
      }

      // if(disc_no == null || disc_no?.trim())
        disc_no = 1

      Track track = new Track(
        title: title,
        artist: artist,
        album: album,
        track: track_no,
        disc: disc_no,
        filePayload: data
      );

      if(!track.save()) {
        render track.errors
      }
      else {
        render track;
      }

      // render "Title: " + title + "\n" +
      // "Artist: " + artist + "\n" +
      // "Album: " + album + "\n" +
      // "Track: " + track_no + "\n" +
      // "Disc: " + disc_no + "\n";
      //render "hi!"
    }
}
