<%@ page import="com.app.pub.ref.PubRefResource" %>

<g:hiddenField name="id" value="${pubRefResourceInstance?.id}" />
<g:hiddenField name="version" value="${pubRefResourceInstance?.version}" />


<div id="divresourceCode${pageId}" class="fieldcontain  ">
    <label for="resourceCode">
        <g:message code="pubRefResource.resourceCode.label" default="参照编码" />
        <span class="required-indicator">*</span>
    </label>
    <g:if test="${ac=='edit'}">
        <g:textField class="easyui-validatebox" name="resourceCode" value="${pubRefResourceInstance?.resourceCode}" required="" disabled=""/>
    </g:if>
    <g:else>
        <g:textField class="easyui-validatebox" name="resourceCode" value="${pubRefResourceInstance?.resourceCode}" required=""/>
    </g:else>

</div>


<div id="divresourceName${pageId}" class="fieldcontain  ">
    <label for="resourceName">
        <g:message code="pubRefResource.resourceName.label" default="参照名称" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox" name="resourceName" value="${pubRefResourceInstance?.resourceName}" required=""/>
</div>


<div id="divpath${pageId}" class="fieldcontain  ">
    <label for="path">
        <g:message code="pubRefResource.path.label" default="路径" />
        
    </label>
    <g:textField class="easyui-validatebox" style="width: 200px" name="path" value="${pubRefResourceInstance?.path}" required=""/>
</div>

