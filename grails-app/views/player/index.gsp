<!doctype html>
<html>
  <head>
    <asset:stylesheet src="player.css"/>
    <asset:stylesheet src="font-awesome.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>

  <body unselectable="yes" onselectstart="return false">
    <div id="left_panel">
      <ul>
        <li class="head">Library <i class="fa fa-music"></i></li>
        <li class="active item">All Albums</li>
        <li class="item">All Artists</li>
        <li class="separator"></li>
        <li class="item">Recently Played</li>
        <li class="item">Recently Added</li>
      </ul>

      <ul>
        <li class="head">Playlists <i class="fa fa-bars"></i></li>
        <li class="item">Pefume</li>
        <li class="item">Pocket Monsters</li>
        <li class="item">Anime music</li>
      </ul>

      <ul>
        <li class="head">Add Music <i class="fa fa-plus"></i></li>
        <li class="item">mPlayer Store</li>
        <li class="item">Upload songs</li>
        <li class="item">Add from YouTube</li>
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

    <asset:javascript src="jquery-1.11.1.min.js"/>
    <asset:javascript src="dropzone.js"/>
    <asset:javascript src="player.js"/>
  </body>
</html>