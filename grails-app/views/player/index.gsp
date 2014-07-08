<!doctype html>
<html>
  <head>
    <asset:stylesheet src="player.css"/>
    <asset:stylesheet src="font-awesome.css"/>
    <asset:stylesheet src="dropzone.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>MPlayer</title>
  </head>

  <body unselectable="yes" onselectstart="return false">
    <div id="left_panel">

      <ul>
        <li class="head">Library <i class="fa fa-music"></i></li>
        <li class="active item" id="all_albums">All Albums</li>
        <li class="item" id="all_artists">All Artists</li>
        <li class="separator"></li>
        <li class="item" id="recently_played">Recently Played</li>
        <li class="item" id="recently_added">Recently Added</li>
      </ul>


      <input type="text" id="search" placeholder="Search view" autocomplete="off">

      <ul id="playlists">
        <li class="head">Playlists <i class="fa fa-bars"></i></li>
        
        <g:each in="${playlists}">
          <li class="playlist rect item" data-id="<%= it.id %>"><%= it.name %></li>
        </g:each>

        <li class="separator" id="new_playlist_sep"></li>
        <li class="rect item" id="new_playlist">New Playlist</li>
      </ul>

      <ul>
        <li class="head">Manage <i class="fa fa-plus"></i></li>
        <a class="list" href="${createLink(uri: '/logout')}"><li class="rect item">Log out</li></a>
        <li class="rect item" id="upload_songs">Upload songs</li>
      </ul>
    </div>

    <div id="right_panel">
      <div id="now_playing_bg">
        <div id="now_playing">
          <div id="now_playing_art">
            <asset:image src="generic-album.jpg" alt="Cover Art"/>
          </div>

          <div id="now_playing_track">
            &nbsp;
          </div>

          <div id="now_playing_artist">
            &nbsp;
          </div>

          <div id="now_playing_controls">
            <i id="back_button" class="fa fa-backward fa-2x"></i>
            <i id="play_button" class="fa fa-play fa-4x"></i>
            <i id="forward_button" class="fa fa-forward fa-2x"></i>

            <div class="clearfix"></div>

            <div id="seek_bar"><div id="progress"></div></div>

            <audio id="now_playing_audio">
              <source type="audio/mpeg">
              Your browser does not support the audio element.
            </audio>

            <div class="clearfix"></div>
          </div>
        </div>
      </div>

      <ul id="playlist">
      </ul>

    </div>

    <div id="albums">
      <!--
      <div class="album">
        <div class="album_art">
          <img src="images/cover.jpg">
        </div>

        <div class="album_name">
          Level 3
        </div>
      </div>
      -->
    </div>

    <div id="overlay">
      <div id="progress_wheel">
        <input type="text" value="0" data-thickness=".2" data-skin="tron" data-fgColor="#ffec03" data-width="100%" class="dial" data-readOnly="true">
      </div>
    </div>

    <div id="dialog_container">
      <div class="dialog" id="upload_dialog">
        To upload songs to your library, simply drag them anywhere into the library.<br><br><br>

        <a href="#" class="dismiss button">Dismiss</a>
      </div>

      <div class="dialog" id="new_playlist_dialog">
        Great, we'll set up a new playlist for you!<br>
        It needs a name, though.<br><br>

        <input type="text" id="playlist_name" placeholder="Playlist Name"><br><br>

        <a href="#" id="create_playlist_button" class="button">Create Playlist</a>&nbsp;&nbsp;&nbsp;<a href="#" class="dismiss button" style="background-color: #b94a48;">Nervermind</a>
      </div>
    </div>

    <asset:javascript src="application.js"/>  <!-- jQuery -->
    <asset:javascript src="player.js"/>
    <asset:javascript src="dropzone.js"/>
    <asset:javascript src="jquery.knob.min.js"/>
  </body>
</html>