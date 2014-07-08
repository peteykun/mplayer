
<%@ page import="mplayer.RegisteredUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'registeredUser.label', default: 'RegisteredUser')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-registeredUser" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list registeredUser">
			
				<g:if test="${registeredUserInstance?.albums}">
				<li class="fieldcontain">
					<span id="albums-label" class="property-label"><g:message code="registeredUser.albums.label" default="Albums" /></span>
					
						<g:each in="${registeredUserInstance.albums}" var="a">
						<span class="property-value" aria-labelledby="albums-label"><g:link controller="album" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${registeredUserInstance?.artists}">
				<li class="fieldcontain">
					<span id="artists-label" class="property-label"><g:message code="registeredUser.artists.label" default="Artists" /></span>
					
						<g:each in="${registeredUserInstance.artists}" var="a">
						<span class="property-value" aria-labelledby="artists-label"><g:link controller="artist" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${registeredUserInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="registeredUser.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${registeredUserInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${registeredUserInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="registeredUser.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${registeredUserInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${registeredUserInstance?.playlists}">
				<li class="fieldcontain">
					<span id="playlists-label" class="property-label"><g:message code="registeredUser.playlists.label" default="Playlists" /></span>
					
						<g:each in="${registeredUserInstance.playlists}" var="p">
						<span class="property-value" aria-labelledby="playlists-label"><g:link controller="playlist" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>

			<g:form url="[id: registeredUserInstance.id, controller: 'registeredUsersAdmin', action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" controller="registeredUsersAdmin" action="edit" id="${registeredUserInstance.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
