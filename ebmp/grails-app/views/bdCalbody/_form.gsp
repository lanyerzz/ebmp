<%@ page import="com.app.bd.calbody.BdCalbody" %>

<g:hiddenField name="id" value="${bdCalbodyInstance?.id}" />
<g:hiddenField name="version" value="${bdCalbodyInstance?.version}" />

<g:hiddenField name="bdCorp.id" value="${bdCalbodyInstance?.bdCorp?.id}"></g:hiddenField>






<span id="divcalbodyCode" class="fieldcontain  required " >
    <label for="calbodyCode" id="label_calbodyCode"  >
        <g:message code="bdCalbody.calbodyCode.label" default="Code" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox myui" name="calbodyCode"   value="${bdCalbodyInstance?.calbodyCode}" />

</span>


<span id="divname${pageId}" class="fieldcontain  required">
    <label for="calbodyName">
        <g:message code="bdCalbody.calbodyName.label" default="Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox myui" name="calbodyName" required="true"  value="${bdCalbodyInstance?.calbodyName}"/>

</span>


<span id="divareacl${pageId}" class="fieldcontain  ">
    <label for="areacl">
        <g:message code="bdCalbody.areacl.label" default="Areacl" />
        
    </label>
    <g:refTemplate code="refBdAreacl" model="[id:'areacl',name:'areacl.id',value:bdCalbodyInstance?.areacl?.id,text:bdCalbodyInstance?.areacl?.name]"></g:refTemplate>
</span>





<span id="divsealFlag${pageId}" class="fieldcontain  ">
    <label for="sealFlag">
        <g:message code="bdCalbody.sealFlag.label" default="Seal Flag" />
        
    </label>
    <g:checkBox name="sealFlag" value="${bdCalbodyInstance?.sealFlag}" />

</span>


<span id="divvnote${pageId}" class="fieldcontain  ">
    <label for="vnote">
        <g:message code="bdCalbody.vnote.label" default="Vnote" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="vnote" value="${bdCalbodyInstance?.vnote}"/>

</span>
<span id="divbdCorp${pageId}" class="fieldcontain  ">
    <label for="bdCorp">
        <g:message code="bdCalbody.bdCorp.label" default="Bd Corp" />

    </label>
    <input id="bdCorp"  canSave="false" class="myui"  value="${bdCalbodyInstance?.bdCorp?.unitName}" readonly=""/>

</span>
