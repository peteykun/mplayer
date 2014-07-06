<%@ page import="mplayer.Artist" %>



<div class="fieldcontain ${hasErrors(bean: artistInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="artist.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${artistInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: artistInstance, field: 'tracks', 'error')} ">
	<label for="tracks">
		<g:message code="artist.tracks.label" default="Tracks" />
		
	</label>
	<g:select name="tracks" from="${mplayer.Track.list()}" multiple="multiple" optionKey="id" size="5" value="${artistInstance?.tracks*.id}" class="many-to-many"/>

</div>

