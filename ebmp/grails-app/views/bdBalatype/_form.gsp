<%@ page import="com.app.bd.balatype.BdBalatype" %>

<g:hiddenField name="id" value="${bdBalatypeInstance?.id}" />
<g:hiddenField name="version" value="${bdBalatypeInstance?.version}" />

<g:hiddenField name="bdCorp.id" value="${bdBalatypeInstance?.bdCorp?.id}"></g:hiddenField>






<span id="divcode${pageId}" class="fieldcontain  ">
    <label for="code">
        <g:message code="bdBalatype.code.label" default="Code" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="code" value="${bdBalatypeInstance?.code}"/>

</span>


<span id="divname${pageId}" class="fieldcontain  ">
    <label for="name">
        <g:message code="bdBalatype.name.label" default="Name" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="name" value="${bdBalatypeInstance?.name}"/>

</span>


<span id="divsealflag${pageId}" class="fieldcontain  ">
    <label for="sealflag">
        <g:message code="bdBalatype.sealflag.label" default="Sealflag" />
        
    </label>
    <g:checkBox name="sealflag" value="${bdBalatypeInstance?.sealflag}" />

</span>

