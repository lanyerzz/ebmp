<%@ page import="com.app.bd.salestru.BdSalestru" %>

<g:hiddenField name="id" value="${bdSalestruInstance?.id}" />
<g:hiddenField name="version" value="${bdSalestruInstance?.version}" />
<g:hiddenField name="bdCorp.id" value="${bdSalestruInstance?.bdCorp?.id}"></g:hiddenField>







<span  class="fieldcontain  ">
    <label for="code${pageId}" class="required" >
        <g:message code="bdSalestru.code.label" default="Code" />
        
    </label>

    
    <input id="code${pageId}" name="code" class="easyui-validatebox" required=""  value="${bdSalestruInstance?.code}">
    
</span>



<span  class="fieldcontain  ">
    <label for="name${pageId}"  class="required">
        <g:message code="bdSalestru.name.label" default="Name" />
        
    </label>

    
    <input id="name${pageId}" name="name" class="easyui-validatebox" required=""  value="${bdSalestruInstance?.name}">
    
</span>







<span  class="fieldcontain  ">
    <label for="bdDeptdoc${pageId}"  >
        <g:message code="bdSalestru.bdDeptdoc.label" default="Bd Deptdoc" />
        
    </label>

    


    <g:refTemplate code="refBdDeptdoc" model="[id:'bdDeptdoc',name:'bdDeptdoc.id',value:bdSalestruInstance?.bdDeptdoc?.id]"></g:refTemplate>

    
</span>




<span  class="fieldcontain  ">
    <label for="sealdate${pageId}"  >
        <g:message code="bdSalestru.sealdate.label" default="Sealdate" />
        
    </label>

    <g:checkBox name="sealdate" id="sealdate${pageId}" value="${bdSalestruInstance?.sealdate}"></g:checkBox>
    
</span>



<span  class="fieldcontain  ">
    <label for="vaddress${pageId}"  >
        <g:message code="bdSalestru.vaddress.label" default="Vaddress" />
        
    </label>

    
    <input id="vaddress${pageId}" name="vaddress"  value="${bdSalestruInstance?.vaddress}">
    
</span>

<span  class="fieldcontain  ">
    <label for="bdCorp${pageId}"  >
        <g:message code="bdSalestru.bdCorp.label" default="Bd Corp" />

    </label>


    <input id="bdCorp${pageId}" name="bdCorp" value="${bdSalestruInstance?.bdCorp?.unitName}" disabled="true"   canSave="false">

</span>