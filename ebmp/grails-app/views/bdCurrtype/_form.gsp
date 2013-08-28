<%@ page import="com.app.bd.currtype.BdCurrtype" %>



<div id="divcurrtypecode${pageId}}" class="fieldcontain ${hasErrors(bean: bdCurrtypeInstance, field: 'currtypecode', 'error')} ">
	<label for="currtypecode">
		<g:message code="bdCurrtype.currtypecode.label" default="Currtypecode" />
        <span class="required-indicator">*</span>
	</label>
	<g:textField name="currtypecode" maxlength="10" value="${bdCurrtypeInstance?.currtypecode}" class="easyui-validatebox" required="true"/>
    <div id="currtypecode_message" hidden="" name="message" class="errors" role="status"></div>
</div>

<div id="divcurrtypename${pageId}}" class="fieldcontain ${hasErrors(bean: bdCurrtypeInstance, field: 'currtypename', 'error')} ">
	<label for="currtypename">
		<g:message code="bdCurrtype.currtypename.label" default="Currtypename"  required="true"/>
        <span class="required-indicator">*</span>
	</label>
	<g:textField name="currtypename" maxlength="40" value="${bdCurrtypeInstance?.currtypename}" class="easyui-validatebox" />
    <div id="currtypename_message" hidden="" name="message" class="errors" role="status"></div>
</div>

<div id="divcurrtypesign${pageId}}" class="fieldcontain ${hasErrors(bean: bdCurrtypeInstance, field: 'currtypesign', 'error')} ">
	<label for="currtypesign">
		<g:message code="bdCurrtype.currtypesign.label" default="Currtypesign" />
		
	</label>
	<g:textField name="currtypesign" maxlength="10" value="${bdCurrtypeInstance?.currtypesign}"/>
    <div id="currtypesign_message" hidden="" name="message" class="errors" role="status"></div>
</div>

<div id="divcurrbusidigit${pageId}}" class="fieldcontain ${hasErrors(bean: bdCurrtypeInstance, field: 'currbusidigit', 'error')} ">
	<label for="currbusidigit">
		<g:message code="bdCurrtype.currbusidigit.label" default="Currbusidigit" />
		
	</label>
	<g:field name="currbusidigit" class="easyui-numberbox" suffix="%" data-options="min:0,precision:2" value="${bdCurrtypeInstance.currbusidigit}"/>
    <div id="currbusidigit_message" hidden="" name="message" class="errors" role="status"></div>
</div>

<div id="divcurrdigit${pageId}}" class="fieldcontain ${hasErrors(bean: bdCurrtypeInstance, field: 'currdigit', 'error')} ">
	<label for="currdigit">
		<g:message code="bdCurrtype.currdigit.label" default="Currdigit" />
		
	</label>
	<g:field name="currdigit" class="easyui-numberbox" suffix="%" data-options="min:0,precision:2" value="${bdCurrtypeInstance.currdigit}"/>
    <div id="currdigit_message" hidden="" name="message" class="errors" role="status"></div>
</div>

