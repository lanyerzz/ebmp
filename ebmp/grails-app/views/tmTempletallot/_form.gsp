<%@ page import="com.app.tm.templetallot.TmTempletallot" %>

<g:hiddenField name="id" value="${tmTempletallotInstance?.id}" />
<g:hiddenField name="version" value="${tmTempletallotInstance?.version}" />
<g:hiddenField name="function.id" value="${tmTempletallotInstance?.function?.id}" />
<div id="divcode${pageId}" class="fieldcontain  ">
    <label for="code">
        <g:message code="tmTempletallot.code.label" default="Code" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox myui" name="code" value="${tmTempletallotInstance?.code}" required="true"/>
    <div id="code_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divtempletType${pageId}" class="fieldcontain  required">
    <label for="templetType">
        <g:message code="tmTempletallot.templetType.label" default="Templet Type" />
        <span class="required-indicator">*</span>
    </label>
    <g:select name="templetType" from="${[[index:0,value:'打印模板'],[index:1,value:'查询模板'],[index:2,value:'单据模板'],[index:3,value:'报表模板']]}" optionValue="value" optionKey="index" value="${tmTempletallotInstance.templetType}" noSelection="['':'请选择模板类型']" required="true"></g:select>
    <div id="templetType_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divtmTemplet${pageId}" class="fieldcontain  required">
    <label for="tmTemplet">
        <g:message code="tmTempletallot.tmTemplet.label" default="Tm Templet" />
        <span class="required-indicator">*</span>
    </label>
    <g:refTemplate id="tmTemplet" code="refTmTemplet" model="[id:'tmTemplet'+pageId,name:'tmTemplet.id',value:tmTempletallotInstance?.tmTemplet?.id ]"></g:refTemplate>
    <div id="tmTemplet_message" hidden="" name="message" class="errors" role="status"></div>
</div>






<div id="divisDefault${pageId}" class="fieldcontain  ">
    <label for="isDefault">
        <g:message code="tmTempletallot.isDefault.label" default="Is Default" />
        
    </label>
    <g:checkBox name="isDefault" value="${tmTempletallotInstance?.isDefault}" />
    <div id="isDefault_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divrole${pageId}" class="fieldcontain  ">
    <label for="role">
        <g:message code="tmTempletallot.role.label" default="Role" />
        
    </label>
    <g:refTemplate id="role" code="refSmRoles" model="[id:'role'+pageId,name:'role.id',value:tmTempletallotInstance?.role?.id]"></g:refTemplate>
    <div id="role_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divuser${pageId}" class="fieldcontain  ">
    <label for="user">
        <g:message code="tmTempletallot.user.label" default="User" />
        
    </label>
    <g:refTemplate id="user" code="refSmUser" model="[id:'user'+pageId,name:'user.id',value:tmTempletallotInstance?.user?.id]"></g:refTemplate>
    <div id="user_message" hidden="" name="message" class="errors" role="status"></div>
</div>

