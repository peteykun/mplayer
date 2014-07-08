<%@ page import="mplayer.Playlist" %>



<div class="fieldcontain ${hasErrors(bean: playlistInstance, field: 'creator', 'error')} required">
	<label for="creator">
		<g:message code="playlist.creator.label" default="Creator" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="creator" name="creator.id" from="${mplayer.RegisteredUser.list()}" optionKey="id" required="" value="${playlistInstance?.creator?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: playlistInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="playlist.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${playlistInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: playlistInstance, field: 'tracks', 'error')} ">
	<label for="tracks">
		<g:message code="playlist.tracks.label" default="Tracks" />
		
	</label>
	<g:select name="tracks" from="${mplayer.Track.list()}" multiple="multiple" optionKey="id" size="5" value="${playlistInstance?.tracks*.id}" class="many-to-many"/>

</div>
