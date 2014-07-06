<%@ page import="mplayer.Track" %>
<%@ page import="mplayer.Album" %>
<%@ page import="mplayer.Artist" %>



<div class="fieldcontain ${hasErrors(bean: trackInstance, field: 'track', 'error')} required">
  <label for="track">
    <g:message code="track.track.label" default="Track" />
    <span class="required-indicator">*</span>
  </label>
  <g:field name="track" type="number" value="${trackInstance.track}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: trackInstance, field: 'disc', 'error')} required">
	<label for="disc">
		<g:message code="track.disc.label" default="Disc" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="disc" type="number" value="${trackInstance.disc}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: trackInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="track.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${trackInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: trackInstance, field: 'filePayload', 'error')} ">
  <label for="filePayload">
    <g:message code="track.filePayload.label" default="File Payload" />
    
  </label>
  <input type="file" id="filePayload" name="filePayload" />

</div>

<div class="fieldcontain ${hasErrors(bean: tracksInstance, field: 'album', 'error')} required">
  <label for="album">
    <g:message code="track.album.label" default="Album" />
    <span class="required-indicator">*</span>
  </label>
  <g:select id="album" name="album.id" from="${Album.list()}" optionKey="id" required="" value="${trackInstance?.album?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: trackInstance, field: 'artist', 'error')} required">
  <label for="artist">
    <g:message code="track.artist.label" default="Artist" />
    <span class="required-indicator">*</span>
  </label>
  <g:select id="artist" name="artist.id" from="${Artist.list()}" optionKey="id" required="" value="${trackInstance?.artist?.id}" class="many-to-one"/>

</div>

