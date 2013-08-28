<%@ page import="com.app.bd.psncl.BdPsncl" %>

<g:hiddenField name="id" value="${bdPsnclInstance?.id}" />
<g:hiddenField name="version" value="${bdPsnclInstance?.version}" />


<div id="divpid${pageId}" class="fieldcontain  " hidden="true">
    <label for="pid">
        <g:message code="bdPsncl.pid.label" default="Pid" />

    </label>
    <g:textField class="easyui-validatebox  myui" name="pid" value="${bdPsnclInstance?.pid}"/>

</div>

<div id="divcode${pageId}" class="fieldcontain  required">
    <label for="code">
        <g:message code="bdPsncl.code.label" default="Code" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField  name="code" required="true" class="easyui-validatebox myui" value="${bdPsnclInstance?.code}"/>

</div>


<div id="divname${pageId}" class="fieldcontain  required">
    <label for="name">
        <g:message code="bdPsncl.name.label" default="Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField  name="name" required="true" class="easyui-validatebox myui" value="${bdPsnclInstance?.name}"/>

</div>




<div id="divpsnclscope${pageId}" class="fieldcontain  ">
    <label for="psnclscope">
        <g:message code="bdPsncl.psnclscope.label" default="Psnclscope" />
        
    </label>
    <g:select name="psnclscope" from="${[[index:0,value:'在职'],[index:1,value:'试用期'],[index:2,value:'离职']]}" optionKey="index" optionValue="value" value="${bdPsnclInstance?.psnclscope}"></g:select>

</div>


<div id="divsealflag${pageId}" class="fieldcontain  ">
    <label for="sealflag">
        <g:message code="bdPsncl.sealflag.label" default="Sealflag" />
        
    </label>
    <g:checkBox name="sealflag" value="${bdPsnclInstance?.sealflag}" />

</div>

<div id="divmemo${pageId}" class="fieldcontain  ">
    <label for="memo">
        <g:message code="bdPsncl.memo.label" default="Memo" />

    </label>
    <g:textArea class="easyui-validatebox myui" name="memo" value="${bdPsnclInstance?.memo}"/>

</div>