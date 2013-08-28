<%@ page import="com.app.bd.banktype.BdBanktype" %>

<g:hiddenField name="id" value="${bdBanktypeInstance?.id}" />
<g:hiddenField name="version" value="${bdBanktypeInstance?.version}" />


<div id="divbanktypecode${pageId}" class="fieldcontain  ">
    <label for="banktypecode">
        <g:message code="bdBanktype.banktypecode.label" default="Banktypecode" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox myui" name="banktypecode" value="${bdBanktypeInstance?.banktypecode}"/>
    <div id="banktypecode_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divbanktypename${pageId}" class="fieldcontain  ">
    <label for="banktypename">
        <g:message code="bdBanktype.banktypename.label" default="Banktypename" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox myui" name="banktypename" value="${bdBanktypeInstance?.banktypename}"/>
    <div id="banktypename_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divamcode${pageId}" class="fieldcontain  ">
    <label for="amcode">
        <g:message code="bdBanktype.amcode.label" default="Amcode" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="amcode" value="${bdBanktypeInstance?.amcode}"/>
    <div id="amcode_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divsealflag${pageId}" class="fieldcontain  ">
    <label for="sealflag">
        <g:message code="bdBanktype.sealflag.label" default="Sealflag" />
        
    </label>
    <g:checkBox name="sealflag" value="${bdBanktypeInstance?.sealflag}" />
    <div id="sealflag_message" hidden="" name="message" class="errors" role="status"></div>
</div>

