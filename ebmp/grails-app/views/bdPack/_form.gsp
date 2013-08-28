<%@ page import="com.app.bd.pack.BdPack" %>

<g:hiddenField name="id" value="${bdPackInstance?.id}" />
<g:hiddenField name="version" value="${bdPackInstance?.version}" />
<g:hiddenField name="bdCorp.id" value="${bdPackInstance?.bdCorp?.id}"></g:hiddenField>
<g:hiddenField name="pid" value="${bdPackInstance?.pid}"></g:hiddenField>








<span id="divcode${pageId}" class="fieldcontain  ">
    <label for="code">
        <g:message code="bdPack.code.label" default="Code" />
        
    </label>
    <g:textField class="easyui-validatebox" name="code" value="${bdPackInstance?.code}"/>

</span>



<span id="divname${pageId}" class="fieldcontain  ">
    <label for="name${pageId}">
        <g:message code="bdPack.name.label" default="Name" />
        
    </label>
    <g:textField  id="name${pageId}" class="easyui-validatebox myui" name="name" value="${bdPackInstance?.name}"/>

</span>

<span id="divmeasdoc${pageId}" class="fieldcontain  ">
    <label for="measdoc${pageId}">
        <g:message code="bdPack.measdoc.label" default="Name" />

    </label>
    <g:refTemplate code="refBdMeasdoc" model="[id:'measdoc',name:'measdoc.id',value:bdPackInstance?.measdoc?.id]" inForm="true"></g:refTemplate>


</span>
<span id="divhsl${pageId}" class="fieldcontain  ">
    <label for="hsl">
        <g:message code="bdPack.hsl.label" default="Name" />

    </label>
   <input id="hsl" name="hsl" class="easyui-numberbox myui" data-options="precision:2" value="${bdPackInstance?.hsl}">

</span>

<span id="divnote${pageId}" class="fieldcontain  ">
    <label for="note">
        <g:message code="bdPack.note.label" default="Note" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="note" value="${bdPackInstance?.note}"/>

</span>


<span id="divbdCorp${pageId}" class="fieldcontain  ">
    <label for="bdCorp">
        <g:message code="bdPack.bdCorp.label" default="Bd Corp" />

    </label>
    <input id="bdCorp" class="myui" value="${bdPackInstance?.bdCorp?.unitName}" readonly="">
</span>