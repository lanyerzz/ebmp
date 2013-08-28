<%@ page import="com.app.bd.psnbasdoc.BdPsnbasdoc" %>

<g:hiddenField name="id" value="${bdPsnbasdocInstance?.id}" />
<g:hiddenField name="version" value="${bdPsnbasdocInstance?.version}" />


<div id="divname${pageId}" class="fieldcontain  required">
    <label for="name">
        <g:message code="bdPsnbasdoc.name.label" default="Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox myui" name="name" required="true" class="easyui-validatebox myui" value="${bdPsnbasdocInstance?.name}"/>

</div>


<div id="divusedname${pageId}" class="fieldcontain  ">
    <label for="usedname">
        <g:message code="bdPsnbasdoc.usedname.label" default="Usedname" />

    </label>
    <g:textField class="easyui-validatebox myui" name="usedname" value="${bdPsnbasdocInstance?.usedname}"/>

</div>

<div id="divsex${pageId}" class="fieldcontain  required">
    <label for="sex">
        <g:message code="bdPsnbasdoc.sex.label" default="Sex" />
        <span class="required-indicator">*</span>
    </label>
    <g:select name="sex" from="${[[index:'male',value:'男'],[index:'female',value:'女']]}"  optionKey="index" optionValue="value" required="true" value="${bdPsnbasdocInstance?.sex}"></g:select>

</div>


<div id="divbirthdate${pageId}" class="fieldcontain  required">
    <label for="birthdate">
        <g:message code="bdPsnbasdoc.birthdate.label" default="Birthdate" />
        <span class="required-indicator">*</span>
    </label>
    <input id="birthdate" name="birthdate" date class="easyui-datebox" value="${bdPsnbasdocInstance?.birthdate?.getTime()}" required="true">
</div>


<div id="divshenfenzhenghao${pageId}" class="fieldcontain  required">
    <label for="shenfenzhenghao">
        <g:message code="bdPsnbasdoc.shenfenzhenghao.label" default="Shenfenzhenghao" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox myui" name="shenfenzhenghao" required="true" class="easyui-validatebox myui" value="${bdPsnbasdocInstance?.shenfenzhenghao}"/>

</div>


<div id="divaddr${pageId}" class="fieldcontain  ">
    <label for="addr">
        <g:message code="bdPsnbasdoc.addr.label" default="Addr" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="addr" value="${bdPsnbasdocInstance?.addr}"/>

</div>


<div id="divemail${pageId}" class="fieldcontain  ">
    <label for="email">
        <g:message code="bdPsnbasdoc.email.label" default="Email" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="email" value="${bdPsnbasdocInstance?.email}"/>

</div>


<div id="divhomephone${pageId}" class="fieldcontain  ">
    <label for="homephone">
        <g:message code="bdPsnbasdoc.homephone.label" default="Homephone" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="homephone" value="${bdPsnbasdocInstance?.homephone}"/>

</div>


<div id="divjoinworkdate${pageId}" class="fieldcontain  ">
    <label for="joinworkdate">
        <g:message code="bdPsnbasdoc.joinworkdate.label" default="Joinworkdate" />
        
    </label>
    <input id="joinworkdate" name="joinworkdate" date class="easyui-datebox" value="${bdPsnbasdocInstance?.joinworkdate?.getTime()}">

</div>


<div id="divmobile${pageId}" class="fieldcontain  ">
    <label for="mobile">
        <g:message code="bdPsnbasdoc.mobile.label" default="Mobile" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="mobile" value="${bdPsnbasdocInstance?.mobile}"/>

</div>


<div id="divofficephone${pageId}" class="fieldcontain  ">
    <label for="officephone">
        <g:message code="bdPsnbasdoc.officephone.label" default="Officephone" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="officephone" value="${bdPsnbasdocInstance?.officephone}"/>

</div>


<div id="divpostalcode${pageId}" class="fieldcontain  ">
    <label for="postalcode">
        <g:message code="bdPsnbasdoc.postalcode.label" default="Postalcode" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="postalcode" value="${bdPsnbasdocInstance?.postalcode}"/>

</div>


<div id="divssnum${pageId}" class="fieldcontain  ">
    <label for="ssnum">
        <g:message code="bdPsnbasdoc.ssnum.label" default="Ssnum" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="ssnum" value="${bdPsnbasdocInstance?.ssnum}"/>

</div>




