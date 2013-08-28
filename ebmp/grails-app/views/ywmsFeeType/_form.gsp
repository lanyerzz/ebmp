<%@ page import="com.app.ywms.settle.feetype.YwmsFeeType" %>

<g:hiddenField name="id" value="${ywmsFeeTypeInstance?.id}" />
<g:hiddenField name="version" value="${ywmsFeeTypeInstance?.version}" />
<g:hiddenField name="pid" value="${ywmsFeeTypeInstance?.pid}"></g:hiddenField>






<span  class="fieldcontain  ">
    <label for="code${pageId}" class="required" >
        <g:message code="ywmsFeeType.code.label" default="Code" />
        
    </label>

    
    <input id="code${pageId}" name="code" class="easyui-validatebox" required=""  value="${ywmsFeeTypeInstance?.code}">
    
</span>



<span  class="fieldcontain  ">
    <label for="name${pageId}"  class="required">
        <g:message code="ywmsFeeType.name.label" default="Name" />
        
    </label>

    
    <input id="name${pageId}" name="name"  value="${ywmsFeeTypeInstance?.name}" class="easyui-validatebox" required="">
    
</span>

