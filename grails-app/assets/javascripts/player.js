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
    var html = '<li class="song' + ((songCount === 0 && player.paused) ? ' active' : '') + '" data-index="' + songCount + '"">' +
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

  console.log(song);
  $("source").attr("src", song.url);
  player.load();

  $('.song').removeClass('active');
  $('#played_duration').remove();
  $($('.song')[index]).addClass('active').prepend('<div id="played_duration">0:00</div>');

  var target = $($('.song')[index]);

  console.log($('#playlist').length);

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

function fetchAlbums() {
  $.get(baseurl + "/albums.json", function(data) { loadAlbums(data) });
}

function fetchArtists() {
  $.get(baseurl + "/artists.json", function(data) { loadArtists(data) });
}

function loadArtists(albums) {
  $(".active.item").removeClass('active');
  $("#all_artists").addClass('active');

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
  $(".active.item").removeClass('active');
  $("#all_albums").addClass('active');

  $('#albums').empty();
  var albumCount = 0;

  albums.forEach(function(album) {
    var html = '<div class="album" data-id="' + album.id + '" data-type="album">' +
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

  // Bind songs
  $('#playlist').on('click', '.song', playClickedSong);

  var set_up = false;

  // Bind dropzone for uploads
  var myDropzone = new Dropzone("#albums", { url: baseurl + "/tracks/create", clickable: false});

  myDropzone.on("dragenter", function(file) {
    $('#overlay').fadeIn(400, function() {
      // Set up upload progress bar
      if(!set_up)
        $(".dial").knob();
        $("#overlay input").css('opacity', 1);

      set_up = true;
    });
  });

  var myOverlayzone = new Dropzone("#overlay", { url: baseurl + "/tracks/create", clickable: false, parallelUploads: 1});

  /*
  myOverlayzone.on("dragleave", function(file) {
    $('#overlay').fadeOut();
  });
  */

  myOverlayzone.on("queuecomplete", function(file) {
    $('#overlay').fadeOut();
    fetchAlbums();
  });

  myOverlayzone.on("totaluploadprogress", function(total_upload_progress, totalBytes, totalBytesSent) {
    $(".dial").val(total_upload_progress).trigger('change');
  });

  // Bind left menu items
  $("#all_albums").on('click', fetchAlbums);
  $("#all_artists").on('click', fetchArtists);

  // Bind the upload dialog
  $("#upload_songs").on('click', function() {
    $("#dialog_container").fadeIn();
  })

  $(".dismiss").on('click', function() {
    $("#dialog_container").fadeOut();
  })
});