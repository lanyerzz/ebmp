<%@ page import="com.app.bd.cumandoc.BdCumandoc" %>

<g:hiddenField name="id" value="${bdCumandocInstance?.id}" />
<g:hiddenField name="version" value="${bdCumandocInstance?.version}" />

<div id="divpkAreacl${pageId}" class="fieldcontain  ">
    <label for="pkAreacl">
        <g:message code="bdCubasdoc.pkAreacl.label" default="Pk Areacl" />

    </label>
    <g:select id="pkAreacl" name="pkAreacl.id" from="${com.app.bd.areacl.BdAreacl.list()}" optionKey="id" optionValue="areaclname" value="${bdCumandocInstance?.pkCubasdoc?.pkAreacl?.id}" class="many-to-one" noSelection="['null': '']" disabled="true"/>
    <div id="pkAreacl_message" hidden="" name="message" class="errors" role="status"></div>
</div>

<span id="divcustcode${pageId}" class="fieldcontain  required">
    <label for="custcode">
        <g:message code="bdCubasdoc.custcode.label" default="Custcode" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox" name="custcode" required="true" class="easyui-validatebox" value="${bdCumandocInstance?.pkCubasdoc?.custcode}" disabled="true"/>
    <div id="custcode_message" hidden="" name="message" class="errors" role="status"></div>
</span>


<div id="divcustname${pageId}" class="fieldcontain  required">
    <label for="custname">
        <g:message code="bdCubasdoc.custname.label" default="Custname" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox" name="custname" required="true" class="easyui-validatebox" value="${bdCumandocInstance?.pkCubasdoc?.custname}" disabled="true"/>
    <div id="custname_message" hidden="" name="message" class="errors" role="status"></div>
</div>

<div id="divcustprop${pageId}" class="fieldcontain  ">
    <label for="custprop">
        <g:message code="bdCubasdoc.custprop.label" default="Custprop" />

    </label>
    <g:select style="width:160px" name="custprop" from="${[[index:0,value:'外部单位'],[index:1,value:'内部公司']]}" optionKey="index" optionValue="value" noSelection="['':'-选择客商类型-']" value="${bdCumandocInstance?.pkCubasdoc?.custprop}" disabled="true"/>
    <div id="custprop_message" hidden="" name="message" class="errors" role="status"></div>
</div>

<div id="divblockUp${pageId}" class="fieldcontain  ">
    <label for="blockUp">
        <g:message code="bdCubasdoc.blockUp.label" default="Block Up" />

    </label>
    <g:checkBox name="blockUp" value="${bdCumandocInstance?.pkCubasdoc?.blockUp}" disabled="true"/>
    <div id="blockUp_message" hidden="" name="message" class="errors" role="status"></div>
</div>

<div id="divcustshortname${pageId}" class="fieldcontain  ">
    <label for="custshortname">
        <g:message code="bdCubasdoc.custshortname.label" default="Custshortname" />

    </label>
    <g:textField class="easyui-validatebox" name="custshortname" value="${bdCumandocInstance?.pkCubasdoc?.custshortname}" disabled="true"/>
    <div id="custshortname_message" hidden="" name="message" class="errors" role="status"></div>
</div>

<span id="divengname${pageId}" class="fieldcontain  ">
    <label for="engname">
        <g:message code="bdCubasdoc.engname.label" default="Engname" />

    </label>
    <g:textField class="easyui-validatebox" name="engname" value="${bdCumandocInstance?.pkCubasdoc?.engname}" disabled="true"/>
    <div id="engname_message" hidden="" name="message" class="errors" role="status"></div>
</span>



<div id="diviscustomer${pageId}" class="fieldcontain  ">
    <label for="iscustomer">
        <g:message code="bdCumandoc.iscustomer.label" default="Iscustomer" />
        
    </label>
    <g:checkBox name="iscustomer" value="${bdCumandocInstance?.iscustomer}" />
    <div id="iscustomer_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divisvender${pageId}" class="fieldcontain  ">
    <label for="isvender">
        <g:message code="bdCumandoc.isvender.label" default="Isvender" />
        
    </label>
    <g:checkBox name="isvender" value="${bdCumandocInstance?.isvender}" />
    <div id="isvender_message" hidden="" name="message" class="errors" role="status"></div>
</div>








