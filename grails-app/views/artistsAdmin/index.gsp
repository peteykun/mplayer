
<%@ page import="mplayer.Artist" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'artist.label', default: 'Artist')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-artist" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					  <g:sortableColumn property="id" title="${message(code: 'album.id.label', default: 'ID')}" />
						<g:sortableColumn property="name" title="${message(code: 'artist.name.label', default: 'Name')}" />
            <g:sortableColumn property="uploader" title="${message(code: 'album.uploader.label', default: 'Uploader')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${artistInstanceList}" status="i" var="artistInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
            <td><g:link action="show" id="${artistInstance.id}">${fieldValue(bean: artistInstance, field: "id")}</g:link></td>

						<td>${fieldValue(bean: artistInstance, field: "name")}</td>
            <td><%= artistInstance.uploader.email %></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${artistInstanceCount ?: 0}" />
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
