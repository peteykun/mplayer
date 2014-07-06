
<%@ page import="mplayer.Track" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'track.label', default: 'Track')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-track" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-track" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="id" title="${message(code: 'track.id.label', default: 'ID')}" />
          
            <g:sortableColumn property="track" title="${message(code: 'track.track.label', default: 'Track')}" />
					
						<g:sortableColumn property="disc" title="${message(code: 'track.disc.label', default: 'Disc')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'track.title.label', default: 'Title')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${trackInstanceList}" status="i" var="trackInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${trackInstance.id}">${fieldValue(bean: trackInstance, field: "id")}</g:link></td>
          
            <td>${fieldValue(bean: trackInstance, field: "track")}</td>
					
						<td>${fieldValue(bean: trackInstance, field: "disc")}</td>
					
						<td>${fieldValue(bean: trackInstance, field: "title")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${trackInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
