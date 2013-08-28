<%@ page import="com.app.bd.purorg.BdPurorg" %>

<g:hiddenField name="id" value="${bdPurorgInstance?.id}" />
<g:hiddenField name="version" value="${bdPurorgInstance?.version}" />


<div id="divcode${pageId}" class="fieldcontain  required">
    <label for="code">
        <g:message code="bdPurorg.code.label" default="Code" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox" name="code" required="true" value="${bdPurorgInstance?.code}"/>
    <div id="code_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divname${pageId}" class="fieldcontain  ">
    <label for="name">
        <g:message code="bdPurorg.name.label" default="Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox" name="name" required="true" value="${bdPurorgInstance?.name}"/>
    <div id="name_message" hidden="" name="message" class="errors" role="status"></div>
</div>

<div id="divsealflag${pageId}" class="fieldcontain  ">
    <label for="sealflag">
        <g:message code="bdPurorg.sealflag.label" default="Sealflag" />

    </label>
    <g:checkBox name="sealflag" value="${bdPurorgInstance?.sealflag}" />
    <div id="sealflag_message" hidden="" name="message" class="errors" role="status"></div>
</div>

<div id="divmemo${pageId}" class="fieldcontain  ">
    <label for="memo">
        <g:message code="bdPurorg.memo.label" default="Memo" />
        
    </label>
    <g:textArea class="easyui-validatebox" name="memo" value="${bdPurorgInstance?.memo}" style="width:150px;height:100px;"/>
    <div id="memo_message" hidden="" name="message" class="errors" role="status"></div>
</div>





