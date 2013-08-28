<%@ page import="com.app.ywms.bd.weighbridge.YWeighbridge" %>

<g:hiddenField name="id" value="${YWeighbridgeInstance?.id}" />
<g:hiddenField name="version" value="${YWeighbridgeInstance?.version}" />
<g:hiddenField name="bdCorp.id" value="${YWeighbridgeInstance?.bdCorp?.id}"></g:hiddenField>



<span  class="fieldcontain  ">
    <label for="code${pageId}">
        <g:message code="YWeighbridge.code.label" default="Code" />

    </label>


    <input id="code${pageId}" name="code" class="myui easyui-validatebox" value="${YWeighbridgeInstance?.code}" required="">

</span>


<span  class="fieldcontain  ">
    <label for="commName${pageId}">
        <g:message code="YWeighbridge.commName.label" default="Comm Name" />

    </label>


    <input id="commName${pageId}" name="commName" class="myui easyui-validatebox" value="${YWeighbridgeInstance?.commName?:'COM1'}" required="">

</span>



<span  class="fieldcontain  required">
    <label for="ibit${pageId}">
        <g:message code="YWeighbridge.bit.label" default="Bit" />
        <span class="required-indicator">*</span>
    </label>

    
    <input id="ibit${pageId}" name="ibit" class="myui easyui-validatebox" value="${YWeighbridgeInstance?.ibit}" required="">
    
</span>



<span  class="fieldcontain  required">
    <label for="databits${pageId}">
        <g:message code="YWeighbridge.databits.label" default="Databits" />
        <span class="required-indicator">*</span>
    </label>

    
    <input id="databits${pageId}" name="databits" class="myui  easyui-validatebox" value="${YWeighbridgeInstance?.databits}" required="">
    
</span>



<span  class="fieldcontain  required">
    <label for="payity${pageId}">
        <g:message code="YWeighbridge.payity.label" default="Payity" />
        <span class="required-indicator">*</span>
    </label>
    
    <input id="payity${pageId}" name="payity" class="myui easyui-validatebox" value="${YWeighbridgeInstance?.payity}" required="">
    
</span>



<span  class="fieldcontain  required">
    <label for="stopbits${pageId}">
        <g:message code="YWeighbridge.stopbits.label" default="Stopbits" />
        <span class="required-indicator">*</span>
    </label>
    
    <input id="stopbits${pageId}" name="stopbits" class="myui  easyui-validatebox" value="${YWeighbridgeInstance?.stopbits}" required="">
    
</span>

<span  class="fieldcontain  required">
    <label for="driver${pageId}">
        <g:message code="YWeighbridge.driver.label" default="driver" />
        <span class="required-indicator">*</span>
    </label>

    <input id="driver${pageId}" name="driver" class="myui  easyui-validatebox" value="${YWeighbridgeInstance?.driver}" required="">

</span>

<span  class="fieldcontain  required">
    <label for="writeFilePath${pageId}">
        <g:message code="YWeighbridge.writeFilePath.label" default="writeFilePath" />
        <span class="required-indicator">*</span>
    </label>

    <input id="writeFilePath${pageId}" name="writeFilePath" value="${YWeighbridgeInstance?.writeFilePath}" >

</span>

<span  class="fieldcontain  ">
    <label for="bdCorp${pageId}">
        <g:message code="YWeighbridge.bdCorp.label" default="Bd Corp" />

    </label>

    <input id="bdCorp${pageId}"  value="${YWeighbridgeInstance?.bdCorp?.unitName}" readonly="" class="myui" canSave="false">

</span>