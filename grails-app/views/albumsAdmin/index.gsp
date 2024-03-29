
<%@ page import="mplayer.Album" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'album.label', default: 'Album')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-album" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
            <g:sortableColumn property="id" title="${message(code: 'album.id.label', default: 'ID')}" />
						<g:sortableColumn property="name" title="${message(code: 'album.name.label', default: 'Name')}" />
            <g:sortableColumn property="uploader" title="${message(code: 'album.uploader.label', default: 'Uploader')}" />
            <g:sortableColumn property="uploaded" title="${message(code: 'album.uploaded.label', default: 'Uploaded')}" />
            <g:sortableColumn property="listened" title="${message(code: 'album.listened.label', default: 'Last Listened To')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${albumInstanceList}" status="i" var="albumInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${albumInstance.id}">${fieldValue(bean: albumInstance, field: "id")}</g:link></td>
					
						<td>${fieldValue(bean: albumInstance, field: "name")}</td>
            <td><%= albumInstance.uploader.email %></td>
            <td>${fieldValue(bean: albumInstance, field: "uploaded")}</td>
            <td>${fieldValue(bean: albumInstance, field: "listened")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${albumInstanceCount ?: 0}" />
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
