<%@ page import="com.app.ywms.bd.berthage.YBerthage" %>

<g:hiddenField name="id" value="${YBerthageInstance?.id}" />
<g:hiddenField name="version" value="${YBerthageInstance?.version}" />


<div id="divcode${pageId}" class="fieldcontain  ">
    <label for="code">
        <g:message code="YBerthage.code.label" default="Code" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox" name="code" value="${YBerthageInstance?.code}" required="true"/>
    <div id="code_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divname${pageId}" class="fieldcontain  ">
    <label for="name">
        <g:message code="YBerthage.name.label" default="Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox" name="name" value="${YBerthageInstance?.name}" required="true"/>
    <div id="name_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divdescribe${pageId}" class="fieldcontain  ">
    <label for="describe">
        <g:message code="YBerthage.describe.label" default="Describe" />
        
    </label>
    <g:textField class="easyui-validatebox" name="describe" value="${YBerthageInstance?.describe}"/>
    <div id="describe_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divisuse${pageId}" class="fieldcontain  ">
    <label for="isuse">
        <g:message code="YBerthage.isuse.label" default="Isuse" />
        
    </label>
    <g:checkBox name="isuse" value="${YBerthageInstance?.isuse}" />
    <div id="isuse_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divjswz${pageId}" class="fieldcontain  ">
    <label for="jswz">
        <g:message code="YBerthage.jswz.label" default="Jswz" />
        
    </label>
    <g:field name="jswz" value="${fieldValue(bean: YBerthageInstance, field: 'jswz')}"/>
    <div id="jswz_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divkswz${pageId}" class="fieldcontain  ">
    <label for="kswz">
        <g:message code="YBerthage.kswz.label" default="Kswz" />
        
    </label>
    <g:field name="kswz" class="easyui-numberbox" value="${fieldValue(bean: YBerthageInstance, field: 'kswz')}"/>
    <div id="kswz_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divzdss${pageId}" class="fieldcontain  ">
    <label for="zdss">
        <g:message code="YBerthage.zdss.label" default="Zdss" />
        
    </label>
    <g:field name="zdss" class="easyui-numberbox" value="${fieldValue(bean: YBerthageInstance, field: 'zdss')}"/>
    <div id="zdss_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divzdtbdw${pageId}" class="fieldcontain  ">
    <label for="zdtbdw">
        <g:message code="YBerthage.zdtbdw.label" default="Zdtbdw" />
        
    </label>
    <g:field name="zdtbdw" class="easyui-numberbox" value="${fieldValue(bean: YBerthageInstance, field: 'zdtbdw')}"/>
    <div id="zdtbdw_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divzxss${pageId}" class="fieldcontain  ">
    <label for="zxss">
        <g:message code="YBerthage.zxss.label" default="Zxss" />
        
    </label>
    <g:field name="zxss" class="easyui-numberbox" value="${fieldValue(bean: YBerthageInstance, field: 'zxss')}"/>
    <div id="zxss_message" hidden="" name="message" class="errors" role="status"></div>
</div>

