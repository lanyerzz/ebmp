<%@ page import="com.app.bd.bankdoc.BdBankdoc" %>

<g:hiddenField name="id" value="${bdBankdocInstance?.id}" />
<g:hiddenField name="version" value="${bdBankdocInstance?.version}" />


<span id="divbankdoccode${pageId}" class="fieldcontain  ">
    <label for="bankdoccode">
        <g:message code="bdBankdoc.bankdoccode.label" default="Bankdoccode" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox myui" name="bankdoccode" value="${bdBankdocInstance?.bankdoccode}"/>
</span>


<span id="divbankdocname${pageId}" class="fieldcontain  ">
    <label for="bankdocname">
        <g:message code="bdBankdoc.bankdocname.label" default="Bankdocname" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox myui" name="bankdocname" value="${bdBankdocInstance?.bankdocname}"/>
</span>


<span id="divshortname${pageId}" class="fieldcontain  ">
    <label for="shortname">
        <g:message code="bdBankdoc.shortname.label" default="Shortname" />

    </label>
    <g:textField class="easyui-validatebox myui" name="shortname" value="${bdBankdocInstance?.shortname}"/>
</span>

<span id="divaddress${pageId}" class="fieldcontain  ">
    <label for="address">
        <g:message code="bdBankdoc.address.label" default="Address" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="address" value="${bdBankdocInstance?.address}"/>
</span>


<span id="divamcode${pageId}" class="fieldcontain  ">
    <label for="amcode">
        <g:message code="bdBankdoc.amcode.label" default="Amcode" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="amcode" value="${bdBankdocInstance?.amcode}"/>
</span>


<span id="divbanktype${pageId}" class="fieldcontain  ">
    <label for="banktype${pageId}">
        <g:message code="bdBankdoc.banktype.label" default="Banktype" />
        
    </label>
    <g:refTemplate code="refBdBanktype" model="[id:'banktype',name:'banktype.id',value:bdBankdocInstance?.banktype?.id]"/>
</span>


<span id="divlinkman1${pageId}" class="fieldcontain  ">
    <label for="linkman1">
        <g:message code="bdBankdoc.linkman1.label" default="Linkman1" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="linkman1" value="${bdBankdocInstance?.linkman1}"/>
</span>


<span id="divlinkman2${pageId}" class="fieldcontain  ">
    <label for="linkman2">
        <g:message code="bdBankdoc.linkman2.label" default="Linkman2" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="linkman2" value="${bdBankdocInstance?.linkman2}"/>
</span>


<span id="divlinkman3${pageId}" class="fieldcontain  ">
    <label for="linkman3">
        <g:message code="bdBankdoc.linkman3.label" default="Linkman3" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="linkman3" value="${bdBankdocInstance?.linkman3}"/>
</span>


<span id="divphone1${pageId}" class="fieldcontain  ">
    <label for="phone1">
        <g:message code="bdBankdoc.phone1.label" default="Phone1" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="phone1" value="${bdBankdocInstance?.phone1}"/>
</span>


<span id="divphone2${pageId}" class="fieldcontain  ">
    <label for="phone2">
        <g:message code="bdBankdoc.phone2.label" default="Phone2" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="phone2" value="${bdBankdocInstance?.phone2}"/>
</span>


<span id="divphone3${pageId}" class="fieldcontain  ">
    <label for="phone3">
        <g:message code="bdBankdoc.phone3.label" default="Phone3" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="phone3" value="${bdBankdocInstance?.phone3}"/>
</span>



    <g:hiddenField  name="pid" value="${bdBankdocInstance?.pid}"/>

<span id="divsealflag${pageId}" class="fieldcontain  ">
    <label for="sealflag">
        <g:message code="bdBankdoc.sealflag.label" default="Sealflag" />
        
    </label>
    <g:checkBox name="sealflag" value="${bdBankdocInstance?.sealflag}" />
</span>




