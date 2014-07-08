
<%@ page import="mplayer.Playlist" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'playlist.label', default: 'Playlist')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
    
		<div id="list-playlist" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="playlist.creator.label" default="Creator" /></th>
					
						<g:sortableColumn property="name" title="${message(code: 'playlist.name.label', default: 'Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${playlistInstanceList}" status="i" var="playlistInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${playlistInstance.id}">${fieldValue(bean: playlistInstance, field: "creator")}</g:link></td>
					
						<td>${fieldValue(bean: playlistInstance, field: "name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${playlistInstanceCount ?: 0}" />
			</div>

      <br>

      <g:form>
        <fieldset class="buttons">
          <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
        </fieldset>
      </g:form>
		</div>
	</body>
</html>
