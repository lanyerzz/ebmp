<%@ page import="com.app.pub.actionscript.PubActionscript" %>

<g:hiddenField name="id" value="${pubActionscriptInstance?.id}" />
<g:hiddenField name="version" value="${pubActionscriptInstance?.version}" />


<div id="divscriptCode${pageId}" class="fieldcontain  required">
    <label for="scriptCode">
        <g:message code="pubActionscript.scriptCode.label" default="Script Code" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField  name="scriptCode" required="true" class="easyui-validatebox" value="${pubActionscriptInstance?.scriptCode}"/>
    <div id="scriptCode_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divscriptName${pageId}" class="fieldcontain  required">
    <label for="scriptName">
        <g:message code="pubActionscript.scriptName.label" default="Script Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField  name="scriptName" required="true" class="easyui-validatebox" value="${pubActionscriptInstance?.scriptName}"/>
    <div id="scriptName_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divpath${pageId}" class="fieldcontain  required">
    <label for="path">
        <g:message code="pubActionscript.path.label" default="Path" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField  name="path"  class="easyui-validatebox" value="${pubActionscriptInstance?.path}" readonly="" canSave="false"/>

</div>


<div id="divactionType${pageId}" class="fieldcontain  required">
    <label for="actionType">
        <g:message code="pubActionscript.actionType.label" default="Action Type" />
        <span class="required-indicator">*</span>
    </label>
    <g:select name="actionType" from="[[index:0,value:'动作前'],[index:1,value:'动作后']]" value="${pubActionscriptInstance.actionType}" optionKey="index" optionValue="value" noSelection="['':'-请选择动作类型-']" required=""></g:select>
    <div id="actionType_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divpubBilltype${pageId}" class="fieldcontain  required">
    <label for="pubBilltype${pageId}">
        <g:message code="pubActionscript.pubBilltype.label" default="Pub Billtype" />
        <span class="required-indicator">*</span>
    </label>
    <g:refTemplate code="refPubBilltype" model="[id:'pubBilltype',name:'pubBilltype.id',value:pubActionscriptInstance?.pubBilltype?.id]" required="true"></g:refTemplate>

</div>

