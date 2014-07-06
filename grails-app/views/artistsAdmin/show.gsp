
<%@ page import="mplayer.Artist" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'artist.label', default: 'Artist')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-artist" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list artist">
			
				<g:if test="${artistInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="artist.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${artistInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${artistInstance?.tracks}">
				<li class="fieldcontain">
					<span id="tracks-label" class="property-label"><g:message code="artist.tracks.label" default="Tracks" /></span>
					
						<g:each in="${artistInstance.tracks}" var="t">
						<span class="property-value" aria-labelledby="tracks-label"><g:link controller="track" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[id: artistInstance.id, controller:'artistsAdmin', action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" controller="artistsAdmin" action="edit" id="${artistInstance.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
