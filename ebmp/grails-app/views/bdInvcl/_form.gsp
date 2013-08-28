<%@ page import="com.app.bd.invcl.BdInvcl" %>

<g:hiddenField name="id" value="${bdInvclInstance?.id}" />
<g:hiddenField name="version" value="${bdInvclInstance?.version}" />


<div id="divinvclassCode${pageId}" class="fieldcontain  required">
    <label for="invclassCode">
        <g:message code="bdInvcl.invclassCode.label" default="Invclass Code" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField  name="invclassCode" required="true" class="easyui-validatebox myui" value="${bdInvclInstance?.invclassCode}"/>
</div>


<div id="divinvclassName${pageId}" class="fieldcontain  required">
    <label for="invclassName">
        <g:message code="bdInvcl.invclassName.label" default="Invclass Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField  name="invclassName" required="true" class="easyui-validatebox myui" value="${bdInvclInstance?.invclassName}"/>
</div>


<div id="divforinvName${pageId}" class="fieldcontain  ">
    <label for="forinvName">
        <g:message code="bdInvcl.forinvName.label" default="Forinv Name" />
        
    </label>
    <g:textField class="easyui-validatebox" name="forinvName" value="${bdInvclInstance?.forinvName}"/>
</div>



    <g:hiddenField name="pid" value="${bdInvclInstance?.pid}"/>


<div id="divsealFlag${pageId}" class="fieldcontain  ">
    <label for="sealFlag">
        <g:message code="bdInvcl.sealFlag.label" default="Seal Flag" />
        
    </label>
    <g:checkBox name="sealFlag" value="${bdInvclInstance?.sealFlag}" />
</div>

