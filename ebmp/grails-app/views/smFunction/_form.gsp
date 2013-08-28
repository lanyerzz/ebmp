<%@ page import="com.app.sm.function.SmFunction" %>

<script>
    $(function(){
        initFunType${pageId}('${smFunctionInstance?.funType}');
    });
    //初始化 form
    function initFunType${pageId}(funType){

        switch (funType){
            case '0':
                $('#divcontroller${pageId}').hide();
                $('#divaction${pageId}').hide();
                $('#divhelpLink${pageId}').hide();
                $('#divconfigAttribute${pageId}').hide();
                break;
            case '1':
                $('#divcontroller${pageId}').show();
                $('#divaction${pageId}').show();
                $('#divhelpLink${pageId}').show();
                $('#divconfigAttribute${pageId}').show();
                $('#divpubBilltype${pageId}').show();
                break;
            case '2':
                break;
            case '3':
                $('#divcontroller${pageId}').show();
                $('#divaction${pageId}').show();
                $('#divhelpLink${pageId}').hide();
                $('#divconfigAttribute${pageId}').show();
                break;
        }
    }


</script>


    <g:hiddenField name="parentId" value="${smFunctionInstance?.parentId}" />


<div  class="fieldcontain  ">
    <label for="funCode">
        <g:message code="smFunction.funCode.label" default="节点编码" />
    </label>

    <g:textField name="funCode" maxlength="40" value="${smFunctionInstance?.funCode}" class="easyui-validatebox myui" required="true" />
</div>
<div  class="fieldcontain  ">
    <label for="funName" >
        <g:message code="smFunction.funName.label" default="节点名称" />
    </label>
    <g:textField name="funName" maxlength="40" value="${smFunctionInstance?.funName}" class="easyui-validatebox myui" required="true"/>
</div>

<div class="fieldcontain  required">
    <label for="funType">
        <g:message code="smFunction.funType.label" default="节点类型" />
        <span class="required-indicator">*</span>
    </label>
    <g:if test="${ac=='edit'}">
        <g:select name="funType" from="${funTypeList}" value="${smFunctionInstance?.funType}" keys="0123" onchange="initFunType${pageId}(this.value);" disabled=""></g:select>

    </g:if>
    <g:else>
        <g:select name="funType" from="${funTypeList}" value="${smFunctionInstance?.funType?:0}" keys="0123" onchange="initFunType${pageId}(this.value);"></g:select>
    </g:else>



</div>

<div id="divcontroller${pageId}" class="fieldcontain " hidden="">
    <label for="smcontroller">
        <g:message code="smFunction.controller.label" default="Controller" />

    </label>
    <g:textField name="smcontroller" value="${smFunctionInstance?.smcontroller}" class="myui"/>
</div>
<div  id="divaction${pageId}" class="fieldcontain  " hidden="">
    <label for="smaction">
        <g:message code="smFunction.action.label" default="Action" />
    </label>
    <g:textField name="smaction" value="${smFunctionInstance?.smaction}" class="myui"/>
</div>

<div id="divconfigAttribute${pageId}" class="fieldcontain  " hidden="">
	<label for="configAttribute">
		<g:message code="smFunction.configAttribute.label" default="Config Attribute" />

	</label>
	<g:select name="configAttribute" from="${configAttribute}" keys="${configAttributeKey}" value="${smFunctionInstance?.configAttribute}"/>
</div>

<div id="divpubBilltype${pageId}" class="fieldcontain" hidden="">
    <label for="pubBilltype">
        <g:message code="smFunction.pubBilltype.label"></g:message>
    </label>
    <g:refTemplate  code="refPubBilltype" model="[id:'pubBilltype',name:'pubBilltype.id',value:smFunctionInstance?.pubBilltype?.id]"></g:refTemplate>
</div>

<div id="divhelpLink${pageId}" class="fieldcontain " hidden="">
	<label for="helpLink">
		<g:message code="smFunction.helpLink.label" default="帮助文档链接" />

	</label>
	<g:textField name="helpLink" value="${smFunctionInstance?.helpLink}" class="myui"/>
</div>

<div class="fieldcontain  ">
	<label for="resourceCode">
		<g:message code="smFunction.resourceCode.label" default="Resource Code" />

	</label>
	<g:textField name="resourceCode" value="${smFunctionInstance?.resourceCode}" class="myui"/>
</div>

<div class="fieldcontain ${hasErrors(bean: smFunctionInstance, field: 'icUrl', 'error')} ">
    <label for="icUrl">
        <g:message code="smFunction.icUrl.label" default="IC URL" />

    </label>
    <g:textField name="icUrl" value="${smFunctionInstance?.icUrl}" class="myui"/>
</div>




