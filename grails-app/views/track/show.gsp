
<%@ page import="mplayer.Track" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'track.label', default: 'Track')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-track" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-track" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list track">
			
				<g:if test="${trackInstance?.filePayload}">
				<li class="fieldcontain">
					<span id="filePayload-label" class="property-label"><g:message code="track.filePayload.label" default="File Payload" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${trackInstance?.disc}">
				<li class="fieldcontain">
					<span id="disc-label" class="property-label"><g:message code="track.disc.label" default="Disc" /></span>
					
						<span class="property-value" aria-labelledby="disc-label"><g:fieldValue bean="${trackInstance}" field="disc"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trackInstance?.fileName}">
				<li class="fieldcontain">
					<span id="fileName-label" class="property-label"><g:message code="track.fileName.label" default="File Name" /></span>
					
						<span class="property-value" aria-labelledby="fileName-label"><g:fieldValue bean="${trackInstance}" field="fileName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${trackInstance?.fileType}">
				<li class="fieldcontain">
					<span id="fileType-label" class="property-label"><g:message code="track.fileType.label" default="File Type" /></span>
					
						<span class="property-value" aria-labelledby="fileType-label"><g:fieldValue bean="${trackInstance}" field="fileType"/></span>
					
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
			<g:form url="[resource:trackInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${trackInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
