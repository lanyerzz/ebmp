<%@ page import="com.app.bd.measdoc.BdMeasdoc" %>

<g:hiddenField name="id" value="${bdMeasdocInstance?.id}" />
<g:hiddenField name="version" value="${bdMeasdocInstance?.version}" />


<div id="divshortname${pageId}" class="fieldcontain  required">
    <label for="shortname">
        <g:message code="bdMeasdoc.shortname.label" default="Shortname" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox" name="shortname" required="true" class="easyui-validatebox" value="${bdMeasdocInstance?.shortname}"/>
    <div id="shortname_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divmeasname${pageId}" class="fieldcontain  required">
    <label for="measname">
        <g:message code="bdMeasdoc.measname.label" default="Measname" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox" name="measname" required="true" class="easyui-validatebox" value="${bdMeasdocInstance?.measname}"/>
    <div id="measname_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divbasecodeflag${pageId}" class="fieldcontain  ">
    <label for="basecodeflag">
        <g:message code="bdMeasdoc.basecodeflag.label" default="Basecodeflag" />
        
    </label>
    <g:checkBox name="basecodeflag" value="${bdMeasdocInstance?.basecodeflag}" />
    <div id="basecodeflag_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divoppdimen${pageId}" class="fieldcontain  ">
    <label for="oppdimen">
        <g:message code="bdMeasdoc.oppdimen.label" default="Oppdimen" />
        
    </label>
    <g:textField class="easyui-validatebox" name="oppdimen" value="${bdMeasdocInstance?.oppdimen}"/>
    <div id="oppdimen_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divscalefactor${pageId}" class="fieldcontain  ">
    <label for="scalefactor">
        <g:message code="bdMeasdoc.scalefactor.label" default="Scalefactor" />
        
    </label>
    <g:field name="scalefactor" class="easyui-numberbox" value="${fieldValue(bean: bdMeasdocInstance, field: 'scalefactor')}"/>
    <div id="scalefactor_message" hidden="" name="message" class="errors" role="status"></div>
</div>

