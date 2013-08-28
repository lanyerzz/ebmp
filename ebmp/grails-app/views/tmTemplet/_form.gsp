<%@ page import="com.app.tm.templet.TmTemplet" %>

<g:hiddenField name="id" value="${tmTempletInstance?.id}" />
<g:hiddenField name="version" value="${tmTempletInstance?.version}" />


<div id="divtempletCode${pageId}" class="fieldcontain  required">
    <label for="templetCode">
        <g:message code="tmTemplet.templetCode.label" default="Templet Code" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox myui" name="templetCode" required="true"  value="${tmTempletInstance?.templetCode}"/>
    <div id="templetCode_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divtempletName${pageId}" class="fieldcontain  required">
    <label for="templetName">
        <g:message code="tmTemplet.templetName.label" default="Templet Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox myui" name="templetName" required="true"  value="${tmTempletInstance?.templetName}"/>
    <div id="templetName_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divtempletPath${pageId}" class="fieldcontain  ">
    <label for="templetPath">
        <g:message code="tmTemplet.templetPath.label" default="Templet Path" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="templetPath" value="${tmTempletInstance?.templetPath}"/>
    <div id="templetPath_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divtempletType${pageId}" class="fieldcontain  ">
    <label for="templetType">
        <g:message code="tmTemplet.templetType.label" default="Templet Type" />
        
    </label>
    <g:select name="templetType" from="${[[index:0,value:'打印模板'],[index:1,value:'查询模板'],[index:2,value:'单据模板'],[index:3,value:'报表模板']]}" optionKey="index" optionValue="value" noSelection="['':'请选择模板类型']" value="${tmTempletInstance.templetType}"></g:select>
    <div id="templetType_message" hidden="" name="message" class="errors" role="status"></div>
</div>

