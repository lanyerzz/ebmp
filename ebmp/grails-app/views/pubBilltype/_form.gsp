<%@ page import="com.app.pub.billtype.PubBilltype" %>

<g:hiddenField name="id" value="${pubBilltypeInstance?.id}" />
<g:hiddenField name="version" value="${pubBilltypeInstance?.version}" />


<div id="divbilltypecode${pageId}" class="fieldcontain  ">
    <label for="billtypecode">
        <g:message code="pubBilltype.billtypecode.label" default="Billtypecode" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox" name="billtypecode" value="${pubBilltypeInstance?.billtypecode}"/>
    <div id="billtypecode_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divbilltypename${pageId}" class="fieldcontain  ">
    <label for="billtypename">
        <g:message code="pubBilltype.billtypename.label" default="Billtypename" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox" name="billtypename" value="${pubBilltypeInstance?.billtypename}"/>
    <div id="billtypename_message" hidden="" name="message" class="errors" role="status"></div>
</div>

