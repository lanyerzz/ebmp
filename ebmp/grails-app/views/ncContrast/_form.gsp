<%@ page import="com.app.nc.NcContrast" %>

<g:hiddenField name="id" value="${ncContrastInstance?.id}" />
<g:hiddenField name="version" value="${ncContrastInstance?.version}" />
<g:hiddenField name="bdCorp.id" value="${ncContrastInstance?.bdCorp?.id}"></g:hiddenField>






<span  class="fieldcontain  ">
    <label for="type${pageId}"  >
        <g:message code="ncContrast.type.label" default="Type" />

    </label>


    <input id="type${pageId}" name="type" class="easyui-combobox"  data-options="valueField:'id',textField:'text',data:[{id:'bdCorp',text:'公司'}],editable:false" value="${ncContrastInstance?.type}">

</span>





<span  class="fieldcontain  ">
    <label for="sourveValue${pageId}"  >
        <g:message code="ncContrast.sourveValue.label" default="Sourve Value" />
        
    </label>

    
    <input id="sourveValue${pageId}" name="sourveValue"  value="${ncContrastInstance?.sourveValue}">
    
</span>



<span  class="fieldcontain  ">
    <label for="targetValue${pageId}"  >
        <g:message code="ncContrast.targetValue.label" default="Target Value" />
        
    </label>

    
    <input id="targetValue${pageId}" name="targetValue"  value="${ncContrastInstance?.targetValue}">
    
</span>




<span  class="fieldcontain  ">
    <label for="bdCorp${pageId}"  >
        <g:message code="ncContrast.bdCorp.label" default="Bd Corp" />

    </label>


    <input id="bdCorp${pageId}" name="bdCorp" value="${ncContrastInstance?.bdCorp?.unitName}" disabled="true"   canSave="false">

</span>