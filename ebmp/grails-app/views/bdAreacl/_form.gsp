<%@ page import="com.app.bd.areacl.BdAreacl" %>

<g:hiddenField name="id" value="${bdAreaclInstance?.id}" />
<g:hiddenField name="version" value="${bdAreaclInstance?.version}" />


<div id="divareaclcode${pageId}}" class="fieldcontain  required">
    <label for="areaclcode">
        <g:message code="bdAreacl.areaclcode.label" default="Areaclcode" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField  name="areaclcode" required="true" class="easyui-validatebox myui" value="${bdAreaclInstance?.areaclcode}"/>
</div>


<div id="divareaclname${pageId}}" class="fieldcontain  required">
    <label for="areaclname">
        <g:message code="bdAreacl.areaclname.label" default="Areaclname" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox myui" name="areaclname" required="true"  value="${bdAreaclInstance?.areaclname}"/>
</div>


<div id="divmnecode${pageId}}" class="fieldcontain  ">
    <label for="mnecode">
        <g:message code="bdAreacl.mnecode.label" default="Mnecode" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="mnecode" value="${bdAreaclInstance?.mnecode}"/>
</div>



    <g:hiddenField name="pid" value="${bdAreaclInstance?.pid}"/>



