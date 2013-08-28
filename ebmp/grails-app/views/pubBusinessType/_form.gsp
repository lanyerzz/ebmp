<%@ page import="com.app.pub.businesstype.PubBusinessType" %>

<g:hiddenField name="id" value="${pubBusinessTypeInstance?.id}" />
<g:hiddenField name="version" value="${pubBusinessTypeInstance?.version}" />



<span id="divcode${pageId}" class="fieldcontain  ">
    <label for="code">
        <g:message code="pubBusinessType.code.label" default="Code" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox myui" name="code" value="${pubBusinessTypeInstance?.code}" required="true"/>

</span>


<span id="divname${pageId}" class="fieldcontain  ">
    <label for="name">
        <g:message code="pubBusinessType.name.label" default="Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox myui" name="name" value="${pubBusinessTypeInstance?.name}" required="true"/>

</span>

