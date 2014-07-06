<%@ page import="mplayer.Track" %>



<div class="fieldcontain ${hasErrors(bean: trackInstance, field: 'filePayload', 'error')} ">
	<label for="filePayload">
		<g:message code="track.filePayload.label" default="File Payload" />
		
	</label>
	<input type="file" id="filePayload" name="filePayload" />

</div>

<div class="fieldcontain ${hasErrors(bean: trackInstance, field: 'disc', 'error')} required">
	<label for="disc">
		<g:message code="track.disc.label" default="Disc" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="disc" type="number" value="${trackInstance.disc}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: trackInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="track.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${trackInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: trackInstance, field: 'track', 'error')} required">
	<label for="track">
		<g:message code="track.track.label" default="Track" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="track" type="number" value="${trackInstance.track}" required=""/>

</div>

