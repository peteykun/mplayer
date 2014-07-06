
<%@ page import="mplayer.Track" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'track.label', default: 'Track')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-track" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list track">
			
				<g:if test="${trackInstance?.filePayload}">
				<li class="fieldcontain">
					<span id="filePayload-label" class="property-label"><g:message code="track.filePayload.label" default="Track" /></span>

          <span class="property-value" aria-labelledby="property-label"><a href="${createLink(uri: '/tracks/listen/' + trackInstance.id)}" target="_blank">Listen</a></span>
					
				</li>
				</g:if>
			
				<g:if test="${trackInstance?.disc}">
				<li class="fieldcontain">
					<span id="disc-label" class="property-label"><g:message code="track.disc.label" default="Disc" /></span>
					
						<span class="property-value" aria-labelledby="disc-label"><g:fieldValue bean="${trackInstance}" field="disc"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trackInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="track.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${trackInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trackInstance?.track}">
				<li class="fieldcontain">
					<span id="track-label" class="property-label"><g:message code="track.track.label" default="Track" /></span>
					
						<span class="property-value" aria-labelledby="track-label"><g:fieldValue bean="${trackInstance}" field="track"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[id: trackInstance.id, controller:'tracksAdmin', action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" controller="tracksAdmin" action="edit" id="${trackInstance.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
