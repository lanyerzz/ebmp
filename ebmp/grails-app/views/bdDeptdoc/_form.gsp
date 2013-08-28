<%@ page import="com.app.bd.deptdoc.BdDeptdoc" %>

<g:hiddenField name="id" value="${bdDeptdocInstance?.id}" />
<g:hiddenField name="version" value="${bdDeptdocInstance?.version}" />


<div id="divdeptCode${pageId}" class="fieldcontain  required">
    <label for="deptCode">
        <g:message code="bdDeptdoc.deptCode.label" default="Dept Code" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox" name="deptCode" required="true" class="easyui-validatebox" value="${bdDeptdocInstance?.deptCode}"/>
    <div id="deptCode_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divdeptName${pageId}" class="fieldcontain  required">
    <label for="deptName">
        <g:message code="bdDeptdoc.deptName.label" default="Dept Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox" name="deptName" required="true" class="easyui-validatebox" value="${bdDeptdocInstance?.deptName}"/>
    <div id="deptName_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divaddr${pageId}" class="fieldcontain  ">
    <label for="addr">
        <g:message code="bdDeptdoc.addr.label" default="Addr" />
        
    </label>
    <g:textField class="easyui-validatebox" name="addr" value="${bdDeptdocInstance?.addr}"/>
    <div id="addr_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divcanceled${pageId}" class="fieldcontain  ">
    <label for="canceled">
        <g:message code="bdDeptdoc.canceled.label" default="Canceled" />
        
    </label>
    <g:checkBox name="canceled" value="${bdDeptdocInstance?.canceled}" />
    <div id="canceled_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divfatherId${pageId}" class="fieldcontain  " hidden="">
    <label for="fatherId">
        <g:message code="bdDeptdoc.fatherId.label" default="Father Id" />
        
    </label>
    <g:textField class="easyui-validatebox" name="fatherId" value="${bdDeptdocInstance?.fatherId}"/>
    <div id="fatherId_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divphone${pageId}" class="fieldcontain  ">
    <label for="phone">
        <g:message code="bdDeptdoc.phone.label" default="Phone" />
        
    </label>
    <g:textField class="easyui-validatebox" name="phone" value="${bdDeptdocInstance?.phone}"/>
    <div id="phone_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divremcode${pageId}" class="fieldcontain  ">
    <label for="remcode">
        <g:message code="bdDeptdoc.remcode.label" default="Remcode" />
        
    </label>
    <g:textField class="easyui-validatebox" name="remcode" value="${bdDeptdocInstance?.remcode}"/>
    <div id="remcode_message" hidden="" name="message" class="errors" role="status"></div>
</div>

<div id="divmemo${pageId}" class="fieldcontain  ">
    <label for="memo">
        <g:message code="bdDeptdoc.memo.label" default="Memo" />

    </label>
    <g:textArea class="easyui-validatebox" name="memo" value="${bdDeptdocInstance?.memo}" style="width:100pt;height:100pt;"/>
    <div id="memo_message" hidden="" name="message" class="errors" role="status"></div>
</div>