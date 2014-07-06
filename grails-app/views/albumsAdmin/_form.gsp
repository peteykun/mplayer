<%@ page import="mplayer.Album" %>



<div class="fieldcontain ${hasErrors(bean: albumInstance, field: 'filePayload', 'error')} ">
	<label for="filePayload">
		<g:message code="album.filePayload.label" default="File Payload" />
		
	</label>
	<input type="file" id="filePayload" name="filePayload" />

</div>

<div class="fieldcontain ${hasErrors(bean: albumInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="album.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${albumInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: albumInstance, field: 'tracks', 'error')} ">
	<label for="tracks">
		<g:message code="album.tracks.label" default="Tracks" />
		
	</label>
	<g:select name="tracks" from="${mplayer.Track.list()}" multiple="multiple" optionKey="id" size="5" value="${albumInstance?.tracks*.id}" class="many-to-many"/>

</div>

