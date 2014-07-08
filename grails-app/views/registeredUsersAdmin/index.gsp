
<%@ page import="mplayer.RegisteredUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'registeredUser.label', default: 'RegisteredUser')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
    
		<div id="list-registeredUser" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="email" title="${message(code: 'registeredUser.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'registeredUser.password.label', default: 'Password')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${registeredUserInstanceList}" status="i" var="registeredUserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${registeredUserInstance.id}">${fieldValue(bean: registeredUserInstance, field: "email")}</g:link></td>
					
						<td>${fieldValue(bean: registeredUserInstance, field: "password")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${registeredUserInstanceCount ?: 0}" />
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
