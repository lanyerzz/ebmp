<%@ page import="com.app.bd.stordoc.BdStordoc" %>

<g:hiddenField name="id" value="${bdStordocInstance?.id}" />
<g:hiddenField name="version" value="${bdStordocInstance?.version}" />
<g:hiddenField name="bdCorp.id" value="${bdStordocInstance?.bdCorp?.id}"></g:hiddenField>





<span id="divcode" class="fieldcontain"  >
    <label for="code">
        <g:message code="bdStordoc.code.label" default="Code" />
        
    </label>
    %{--validatebox-invalid--}%
    <g:textField class="easyui-validatebox myui " name="code" value="${bdStordocInstance?.code}" required=""/>

</span>


<span id="divname${pageId}" class="fieldcontain  ">
    <label for="name">
        <g:message code="bdStordoc.name.label" default="Name" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="name" value="${bdStordocInstance?.name}" required=""/>

</span>

<br>


<span id="divcalbody${pageId}" class="fieldcontain  ">
    <label for="calbody">
        <g:message code="bdStordoc.calbody.label" default="Calbody" />
        
    </label>
    %{--<g:select id="calbody" name="calbody.id" from="${com.app.bd.calbody.BdCalbody.list()}" optionValue="calbodyName" optionKey="id" value="${bdStordocInstance?.calbody?.id}" class="many-to-one" noSelection="['null': '']"/>--}%
    <g:refTemplate code="refBdCalbody" model="[id:'calbody',name:'calbody.id',required:true,value:bdStordocInstance?.calbody?.id]"></g:refTemplate>
</span>


<span id="divsealflag${pageId}" class="fieldcontain  ">
    <label for="sealflag">
        <g:message code="bdStordoc.sealflag.label" default="Sealflag" />
        
    </label>
    <g:checkBox name="sealflag" class="checkbox" value="${bdStordocInstance?.sealflag}" />

</span>


<span id="divstoraddr${pageId}" class="fieldcontain  ">
    <label for="storaddr">
        <g:message code="bdStordoc.storaddr.label" default="Storaddr" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="storaddr" value="${bdStordocInstance?.storaddr}"/>

</span>

<span id="divmemo${pageId}" class="fieldcontain  ">
    <label for="memo">
        <g:message code="bdStordoc.memo.label" default="Memo" />

    </label>
    <g:textField class="easyui-validatebox myui" name="memo" value="${bdStordocInstance?.memo}"/>

</span>

<span id="divbdCorp${pageId}" class="fieldcontain  ">
    <label for="bdCorp">
        <g:message code="bdStordoc.bdCorp.label" default="Bd Corp" />

    </label>
    <input id="bdCorp" readonly="" class="myui" value="${bdStordocInstance?.bdCorp?.unitName}">
</span>
