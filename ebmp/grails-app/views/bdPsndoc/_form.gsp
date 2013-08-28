<%@ page import="com.app.bd.psndoc.BdPsndoc" %>

<g:hiddenField name="id" value="${bdPsndocInstance?.id}" />
<g:hiddenField name="version" value="${bdPsndocInstance?.version}" />
<input type="hidden" id="bdDeptdoc" name="bdDeptdoc.id" value="${bdPsndocInstance?.bdDeptdoc?.id}">

<span id="divpsncode${pageId}" class="fieldcontain  required">
    <label for="psncode">
        <g:message code="bdPsndoc.psncode.label" default="Psncode" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox myui" name="psncode" required="true"  value="${bdPsndocInstance?.psncode}"/>

</span>


<span id="divpsnname${pageId}" class="fieldcontain  required">
    <label for="psnname">
        <g:message code="bdPsndoc.psnname.label" default="Psnname" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox myui" name="psnname" required="true" value="${bdPsndocInstance?.psnname}"/>

</span>

<br>
<span id="divamcode${pageId}" class="fieldcontain  ">
    <label for="amcode">
        <g:message code="bdPsndoc.amcode.label" default="Amcode" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="amcode" value="${bdPsndocInstance?.amcode}"/>

</span>



<span id="divbdPsncl${pageId}" class="fieldcontain  ">
    <label for="bdPsncl">
        <g:message code="bdPsndoc.bdPsncl.label" default="Bd Psncl" />
        
    </label>
    <g:refTemplate code="refBdPsncl" model="[id:'bdPsncl',name:'bdPsncl.id',value:bdPsndocInstance?.bdPsncl?.id,text:bdPsndocInstance?.bdPsncl?.name]"></g:refTemplate>

</span>
<br>

<span id="divclerkcode${pageId}" class="fieldcontain  ">
    <label for="clerkcode">
        <g:message code="bdPsndoc.clerkcode.label" default="Clerkcode" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="clerkcode" value="${bdPsndocInstance?.clerkcode}"/>

</span>


<span id="divclerkflag${pageId}" class="fieldcontain  ">
    <label for="clerkflag">
        <g:message code="bdPsndoc.clerkflag.label" default="Clerkflag" />
        
    </label>
    <g:checkBox name="clerkflag" value="${bdPsndocInstance?.clerkflag}" />

</span>

<br>
<span id="divindocflag${pageId}" class="fieldcontain  ">
    <label for="indocflag">
        <g:message code="bdPsndoc.indocflag.label" default="Indocflag" />
        
    </label>
    <g:checkBox name="indocflag" class="checkbox" value="${bdPsndocInstance?.indocflag}" />

</span>


<span id="divindutydate${pageId}" class="fieldcontain  ">
    <label for="indutydate">
        <g:message code="bdPsndoc.indutydate.label" default="Indutydate" />
        
    </label>
    <input id="indutydate" name="indutydate" date class="myui" value="${bdPsndocInstance?.indutydate?.getTime()}">

</span>
<br>

<span id="divinnercode${pageId}" class="fieldcontain  ">
    <label for="innercode">
        <g:message code="bdPsndoc.innercode.label" default="Innercode" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="innercode" value="${bdPsndocInstance?.innercode}"/>

</span>


<span id="divjobrank${pageId}" class="fieldcontain  ">
    <label for="jobrank">
        <g:message code="bdPsndoc.jobrank.label" default="Jobrank" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="jobrank" value="${bdPsndocInstance?.jobrank}"/>

</span>
<br>

<span id="divjobseries${pageId}" class="fieldcontain  ">
    <label for="jobseries">
        <g:message code="bdPsndoc.jobseries.label" default="Jobseries" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="jobseries" value="${bdPsndocInstance?.jobseries}"/>

</span>


<span id="divmaxinnercode${pageId}" class="fieldcontain  ">
    <label for="maxinnercode">
        <g:message code="bdPsndoc.maxinnercode.label" default="Maxinnercode" />
        
    </label>
    <g:field name="maxinnercode" value="${fieldValue(bean: bdPsndocInstance, field: 'maxinnercode')}"/>

</span>

<br>
<span id="divoutdutydate${pageId}" class="fieldcontain  ">
    <label for="outdutydate">
        <g:message code="bdPsndoc.outdutydate.label" default="Outdutydate" />
        
    </label>
    <input id="outdutydate" name="outdutydate" date value="${bdPsndocInstance?.outdutydate?.getTime()}" class="myui">

</span>


<span id="divpsnclscope${pageId}" class="fieldcontain  ">
    <label for="psnclscope">
        <g:message code="bdPsndoc.psnclscope.label" default="Psnclscope" />
        
    </label>
    <g:field name="psnclscope" value="${fieldValue(bean: bdPsndocInstance, field: 'psnclscope')}"/>

</span>

<br>
<span id="divsealdate${pageId}" class="fieldcontain  ">
    <label for="sealdate">
        <g:message code="bdPsndoc.sealdate.label" default="Sealdate" />
        
    </label>
    <g:checkBox name="sealdate" value="${bdPsndocInstance?.sealdate}" />

</span>

