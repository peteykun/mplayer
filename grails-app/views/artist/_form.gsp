<%@ page import="mplayer.Artist" %>



<div class="fieldcontain ${hasErrors(bean: artistInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="artist.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${artistInstance?.name}"/>

</div>

