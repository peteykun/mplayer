import util.marshalling.CustomObjectMarshallers
import mplayer.TrackMarshaller
import mplayer.AlbumMarshaller
import mplayer.ArtistMarshaller

// Place your Spring DSL code here
beans = {
  customObjectMarshallers( CustomObjectMarshallers ) {
    marshallers = [
      new TrackMarshaller(),
      new AlbumMarshaller(),
      new ArtistMarshaller()
    ]
  }
}
