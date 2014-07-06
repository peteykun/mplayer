
<%@ page import="mplayer.Album" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'album.label', default: 'Album')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-album" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list album">
			
				<g:if test="${albumInstance?.filePayload}">
				<li class="fieldcontain">
					<span id="filePayload-label" class="property-label"><g:message code="album.filePayload.label" default="File Payload" /></span>

          <span class="property-value" aria-labelledby="property-label"><img src="${createLink(uri: '/albums/art/' + albumInstance.id)}" style="max-width: 300px;"></span>
					
				</li>
				</g:if>
			
				<g:if test="${albumInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="album.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${albumInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${albumInstance?.tracks}">
				<li class="fieldcontain">
					<span id="tracks-label" class="property-label"><g:message code="album.tracks.label" default="Tracks" /></span>
					
						<g:each in="${albumInstance.tracks}" var="t">
						<span class="property-value" aria-labelledby="tracks-label"><g:link controller="track" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[id: albumInstance.id, controller:'albumsAdmin', action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" controller="albumsAdmin" action="edit" id="${albumInstance.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
