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
  $.get(baseurl + "/albums/show/1.json", function(data) { loadPlaylist(data.tracks) });
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

  $('#now_playing_art img').attr('src', song.art);
  $('#now_playing_bg').css('background-image', "url('" + song.art + "')");

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

function loadAlbums(albums) {
  $('#albums').empty();
  var albumCount = 0;

  albums.forEach(function(album) {
    var html = '<div class="album">' +
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

  // Bind dropzone for uploads
  var myDropzone = new Dropzone("#albums", { url: baseurl + "/tracks/create", clickable: false});
});