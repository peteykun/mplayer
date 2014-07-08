<%@ page import="mplayer.RegisteredUser" %>


<%--
<div class="fieldcontain ${hasErrors(bean: registeredUserInstance, field: 'albums', 'error')} ">
	<label for="albums">
		<g:message code="registeredUser.albums.label" default="Albums" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${registeredUserInstance?.albums?}" var="a">
    <li><g:link controller="album" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="album" action="create" params="['registeredUser.id': registeredUserInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'album.label', default: 'Album')])}</g:link>
</li>
</ul>


</div>
--%>

<%--
<div class="fieldcontain ${hasErrors(bean: registeredUserInstance, field: 'artists', 'error')} ">
	<label for="artists">
		<g:message code="registeredUser.artists.label" default="Artists" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${registeredUserInstance?.artists?}" var="a">
    <li><g:link controller="artist" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="artist" action="create" params="['registeredUser.id': registeredUserInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'artist.label', default: 'Artist')])}</g:link>
</li>
</ul>


</div>
--%>


<div class="fieldcontain ${hasErrors(bean: registeredUserInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="registeredUser.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email" required="" value="${registeredUserInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: registeredUserInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="registeredUser.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${registeredUserInstance?.password}"/>

</div>

<%--
<div class="fieldcontain ${hasErrors(bean: registeredUserInstance, field: 'playlists', 'error')} ">
	<label for="playlists">
		<g:message code="registeredUser.playlists.label" default="Playlists" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${registeredUserInstance?.playlists?}" var="p">
    <li><g:link controller="playlist" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="playlist" action="create" params="['registeredUser.id': registeredUserInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'playlist.label', default: 'Playlist')])}</g:link>
</li>
</ul>


</div>
--%>
