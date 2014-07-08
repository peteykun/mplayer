/* The player */
var player = $('#now_playing_audio')[0];

/* Control elements */
var play_button = $('#play_button');
var back_button = $('#back_button');
var forward_button = $('#forward_button');
var seek_bar = $('#seek_bar');

/* Playlist vars */
var current_playlist = null;
var playlist_position = null;

var to_add_to_playlist = null;
var add_what = null;

/* Path */
var baseurl = '/mplayer';

function compare_tracks(a,b) {
  if (a.disc < b.disc || (a.disc == b.disc && a.track < b.track))
     return -1;
  if (a.disc > b.disc || (a.disc == b.disc && a.track > b.track))
    return 1;
  return 0;
}

function get_formatted_time(seconds) {
  var mm = Math.floor(seconds/60);
  var ss = Math.round(seconds%60);

  if (ss < 10)
    ss = '0' + ss;

  return mm + ':' + ss;
}

function play() {
  if (player.paused)
  {
    player.play();
    play_button.removeClass('fa-play').addClass('fa-pause');
  }
  else
  {
    player.pause();
    play_button.addClass('fa-play').removeClass('fa-pause');
  }
}

function stop() {
  // Reset the audio position
  player.currentTime = player.duration;

  // Update the seek bar
  play_button.addClass('fa-play').removeClass('fa-pause');
}

function seek(e) {
  var posX = e.pageX - $(this).offset().left;
  var Xlen = $(this).width();
  
  var progress = posX/Xlen;
  var position = progress * player.duration;

  $('#progress').width(progress*100 + '%');
  player.currentTime = position;
}

function echoPosition() {
  var progress = player.currentTime/player.duration;
  $('#progress').width(progress*100 + '%');

  $('#played_duration').html(get_formatted_time(player.currentTime));
}

function loadPlaylist(playlist) {
  $('#playlist').empty();
  current_playlist = playlist;
  current_playlist.sort(compare_tracks);

  var songCount = 0;

  playlist.forEach(function(song) {
    var html = '<li draggable="true" class="song' + ((songCount === 0 && player.paused) ? ' active' : '') + '" data-index="' + songCount + '" data-id="' + song.id + '">' +
        ((songCount === 0 && player.paused) ? '<div id="played_duration">0:00</div>' : '') +
        '<div class="title">' + song.title + '</div><br>' +
        '<div class="artist">' + song.artist + '</div>' +

        '<div class="duration">' + get_formatted_time(0) + '</div>' +
        '<div class="clearfix"></div>' +
      '</li>';

    setTimeout(function() { $(html).hide().appendTo("#playlist").fadeIn(250) }, songCount*100);
    songCount++;
  });

  if(player.paused && songCount > 0)
    playSong(0);
}

function loadClickedPlaylist(e) {
  $.get(baseurl + "/" + $(this).data('type') + "s/show/" + $(this).data('id') + ".json", function(data) { loadPlaylist(data.album.tracks) });
}

function playSong(index) {
  var song = current_playlist[index];
  playlist_position = index;

  if(!player.paused)
    play();

  $("source").attr("src", song.url);
  player.load();

  $('.song').removeClass('active');
  $('#played_duration').remove();
  $($('.song')[index]).addClass('active').prepend('<div id="played_duration">0:00</div>');

  var target = $($('.song')[index]);

  if(target.offset() !== undefined)
    $('#playlist').animate({
      scrollTop: $('#playlist').scrollTop() + target.offset().top - ($('#playlist').offset().top + 8)
    }, 500);

  $('#now_playing_track').html(song.title);
  $('#now_playing_artist').html(song.artist);

  $('#now_playing_art img').attr('src', song.cover_image_url);
  $('#now_playing_bg').css('background-image', "url('" + song.cover_image_url + "')");

  play();
}

function playClickedSong(e) {
  var index = $($(this)[0]).data("index");
  playSong(index);
}

function next() {
  if(playlist_position < current_playlist.length - 1)
    playSong(playlist_position + 1);
  else
    stop();
}

function previous() {
  if (player.currentTime < 5) {
    if (playlist_position > 0)
      playSong(playlist_position - 1);

    else if (playlist_position === 0)
      playSong(0);
  }

  else {
    playSong(playlist_position);
  }
}

function highlight_menu_item(name) {
  $(".active.item").removeClass('active');
  $(name).addClass('active');
}

function fetchAlbums(method) {
  if (typeof method === 'undefined') { method = 'index'; }

  $.get(baseurl + "/albums/" + method + ".json", function(data) { loadAlbums(data) });
}

function fetchArtists() {
  $.get(baseurl + "/artists.json", function(data) { loadArtists(data) });
}

function fetchPlaylists() {
  $.get(baseurl + "/playlists/index.json", function(data) { console.log(data) });
}

function fetchPlaylist(id) {
  $.get(baseurl + "/playlists/show/" + id + ".json", function(data) { loadPlaylist(data.playlist.tracks) });
}

function loadArtists(albums) {
  $('#albums').empty();
  var albumCount = 0;

  albums.forEach(function(album) {
    var html = '<div class="album" data-id="' + album.id + '" data-type="artist">' +
          '<div class="album_art">' +
            '<img src="' + album.cover_image_url + '">' +
          '</div>' +

          '<div class="album_name">' +
            album.name +
          '</div>' +
        '</div>';

    setTimeout(function() { $(html).hide().appendTo("#albums").fadeIn(250) }, albumCount*100);
    albumCount++;
  });
}

function loadAlbums(albums) {
  $('#albums').empty();
  var albumCount = 0;

  albums.forEach(function(album) {
    var html = '<div draggable="true" class="album" data-id="' + album.id + '" data-type="album">' +
          '<div class="album_art">' +
            '<img src="' + album.cover_image_url + '">' +
          '</div>' +

          '<div class="album_name">' +
            album.name +
          '</div>' +
        '</div>';

    setTimeout(function() { $(html).hide().appendTo("#albums").fadeIn(250) }, albumCount*100);
    albumCount++;
  });
}

function filterView(search_string) {
  $('.album').each(function() {
    var content = $(this).children('.album_name').html().toLowerCase();
    var search = search_string.toLowerCase();

    if(content.indexOf(search) > -1) {
      $(this).show();
    } else {
      $(this).hide();
    }
  });
}

$(function() {
  // Fetch and load albums
  fetchAlbums();

  // Bind the play, back and forward button
  play_button.on('click', play);
  back_button.on('click', previous);
  forward_button.on('click', next);

  // Bind the seek bar
  seek_bar.on('click', seek);

  // Echo duration every 100ms
  setInterval(echoPosition, 100);

  // Set the ended callback
  player.addEventListener('ended', next);

  // Bind albums
  $('#albums').on('click', '.album', loadClickedPlaylist);

  // Bind songs (click)
  $('#playlist').on('click', '.song', playClickedSong);

  // Bind songs (drag to playlist)
  $('#playlist').on('dragstart', '.song', function(e) {
    add_what = 'song';
    to_add_to_playlist = $(this).data('id');
  });

  // Bind albums (drag to playlist)
  $('#albums').on('dragstart', '.album', function(e) {
    add_what = 'album';
    to_add_to_playlist = $(this).data('id');
  });

  var set_up = false;

  // Bind dropzone for uploads
  var myDropzone = new Dropzone("#albums", { url: baseurl + "/tracks/create", clickable: false});

  myDropzone.on("dragenter", function(file) {
    $('#overlay').fadeIn(400, function() {
      // Set up upload progress bar
      if(!set_up)
        $(".dial").knob();
    
      $("#overlay input").css('opacity', 1);
      $(".dial").val(0).trigger('change');
      set_up = true;
    });
  });

  // Disable when required
  $('#playlist').on('mouseenter', '.song',  function() { myDropzone.disable() });
  $('#playlist').on('mouseleave', '.song',  function() { myDropzone.enable()  });
  $('#albums'  ).on('mouseenter', '.album', function() { myDropzone.disable() });
  $('#albums'  ).on('mouseleave', '.album', function() { myDropzone.enable()  });

  var myOverlayzone = new Dropzone("#overlay", { url: baseurl + "/tracks/create", clickable: false, parallelUploads: 1});

  myOverlayzone.on("dragleave", function(file) {
    $('#overlay').fadeOut();
  });

  myOverlayzone.on("queuecomplete", function(file) {
    $('#overlay').fadeOut();
    fetchAlbums("recentlyAdded");
    highlight_menu_item("#recently_added");
  });

  myOverlayzone.on("totaluploadprogress", function(total_upload_progress, totalBytes, totalBytesSent) {
    if(total_upload_progress > $(".dial").val())
      $(".dial").val(total_upload_progress).trigger('change');
  });

  // Bind left menu items
  $("#all_albums").on('click', function() {
    fetchAlbums();
    highlight_menu_item("#all_albums");
  });

  $("#all_artists").on('click', function() {
    fetchArtists();
    highlight_menu_item("#all_artists");
  });

  $("#recently_played").on('click', function() {
    fetchAlbums("recentlyPlayed");
    highlight_menu_item("#recently_played");
  });

  $("#recently_added").on('click', function() {
    fetchAlbums("recentlyAdded");
    highlight_menu_item("#recently_added");
  });

  // Bind playlists
  $("#playlists").on('click', '.playlist', function() {
    fetchPlaylist($(this).data('id'));
    // highlight_menu_item($(this));
  });

  $("#playlists").on('dragleave', '.playlist', function() {
    $(this).removeClass('active');
  });

  $("#playlists").on('drop', '.playlist', function(e) {
    e.preventDefault();
    
    var playlist_id = $(this).data('id');
    console.log("Track #" + to_add_to_playlist + " to be added to Playlist #" + playlist_id);

    if(add_what === 'song')
      $.post(baseurl + '/playlists/addSong', { playlist_id: playlist_id, track_id: to_add_to_playlist })
    else
      $.post(baseurl + '/playlists/addAlbum', { playlist_id: playlist_id, album_id: to_add_to_playlist })
    
    $(this).removeClass('active');
  });

  $("#playlists").on('dragover', '.playlist', function(e) {
    $(this).addClass('active');
    e.preventDefault();
  });

  // Bind the upload dialog
  $("#upload_songs").on('click', function() {
    $("#upload_dialog").show();
    $("#dialog_container").fadeIn();
  });

  // Bind the new playlist dialog
  $("#new_playlist").on('click', function() {
    $("#new_playlist_dialog").show();
    $("#new_playlist_dialog input").val('');
    $("#dialog_container").fadeIn();
  });

  // Bind the create playlist button
  $("#create_playlist_button").on('click', function() {
    $.post(baseurl + "/playlists/create.json", {name: $("#playlist_name").val()}, function(data) {
      $('<li class="playlist rect item" data-id="' + data.playlist.id + '">' + data.playlist.name + '</li>').insertBefore("#new_playlist_sep");
    });

    $("#dialog_container").fadeOut(400, function() {
      $(".dialog").hide();
    });
  });

  $(".dismiss").on('click', function() {
    $("#dialog_container").fadeOut(400, function() {
      $(".dialog").hide();
    });
  });

  // Bind search
  $('#search').on('input propertychange paste', function() {
    filterView($('#search').val());
  });

});