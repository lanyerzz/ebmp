<%@ page import="com.app.ic.bill.IcGeneralHead" %>

<g:hiddenField name="id" value="${icGeneralHeadInstance?.id}" />
<g:hiddenField name="version" value="${icGeneralHeadInstance?.version}" />
<g:hiddenField name="businessType.id" value="${icGeneralHeadInstance?.businessType?.id}"/>
<g:hiddenField name="billTypeCode" value="${icGeneralHeadInstance?.billTypeCode}" ></g:hiddenField>
<g:hiddenField name="billtype.id" value="${icGeneralHeadInstance?.billtype?.id}" ></g:hiddenField>
<g:hiddenField name="sourceBillType.id" value="${icGeneralHeadInstance?.sourceBillType?.id}" ></g:hiddenField>
<g:hiddenField name="sourceBillTypeCode" value="${icGeneralHeadInstance?.sourceBillTypeCode}" ></g:hiddenField>
<g:hiddenField name="bdCorp.id" value="${icGeneralHeadInstance?.bdCorp?.id}"></g:hiddenField>







<span  class="fieldcontain  ">
    <label for="billno${pageId}">
        <g:message code="icGeneralHead.billno.label" default="单据号" />

    </label>

    <input id="billno${pageId}" name="billno" class="myui" value="${icGeneralHeadInstance?.billno}" disabled="">
</span>


<span  class="fieldcontain  ">
    <label for="billdate${pageId}" class="required">
        <g:message code="icGeneralHead.billdate.label" default="单据日期" />
        
    </label>

    <input id="billdate${pageId}" name="billdate" date class=" easyui-datebox" value="${icGeneralHeadInstance?.billdate?.getTime()}" required="">
</span>











<span  class="fieldcontain  ">
    <label for="cbiz${pageId}">
        <g:message code="icGeneralHead.cbiz.label" default="业务员" />
        
    </label>

    <g:refTemplate code="refBdPsndoc" model="[id:'cbiz',name:'cbiz.id',value:icGeneralHeadInstance?.cbiz?.id]" ></g:refTemplate>

</span>


<span  class="fieldcontain  ">
    <label for="cwarehouse${pageId}" class="required">
        <g:message code="icGeneralHead.cwarehouse.label" default="仓库" />

    </label>

    <g:refTemplate code="refBdStordoc" model="[required:true,id:'cwarehouse',name:'cwarehouse.id',value:icGeneralHeadInstance?.cwarehouse?.id]"></g:refTemplate>

</span>

<span  class="fieldcontain  ">
    <label for="ccustomer${pageId}">
        <g:message code="icGeneralHead.ccustomer.label" default="客户" />

    </label>
    <g:refTemplate code="refBdCustomer" model="[id:'ccustomer',name: 'ccustomer.id',value:icGeneralHeadInstance?.ccustomer?.id ]" ></g:refTemplate>

</span>


<span  class="fieldcontain  ">
    <label for="cdept${pageId}">
        <g:message code="icGeneralHead.cdept.label" default="部门" />
        
    </label>

    <g:refTemplate code="refBdDeptdoc" model="[id:'cdept',name:'cdept.id',value:icGeneralHeadInstance?.cdept?.id,text:icGeneralHeadInstance?.cdept?.deptName ]"></g:refTemplate>

</span>





<span  class="fieldcontain  ">
    <label for="cwhsmanager${pageId}" class="required">
        <g:message code="icGeneralHead.cwhsmanager.label" default="库管员" />
        
    </label>
    <g:refTemplate code="refBdPsndoc" model="[required:true,id:'cwhsmanager',name:'cwhsmanager.id',value:icGeneralHeadInstance?.cwhsmanager?.id ]"></g:refTemplate>

</span>







<span  class="fieldcontain  ">
    <label for="vnote${pageId}">
        <g:message code="icGeneralHead.vnote.label" default="Vnote" />
        
    </label>

    <input id="vnote${pageId}" name="vnote" class="myui" value="${icGeneralHeadInstance?.vnote}">
</span>




<hr>
<p>其他</p>


<span  class="fieldcontain  ">
    <label for="maker${pageId}">
        <g:message code="icGeneralHead.maker.label" default="Maker" />

    </label>
    <input   name="maker.id" type="hidden"   value="${icGeneralHeadInstance?.maker?.id}"  >
    <input id="maker${pageId}"     value="${icGeneralHeadInstance?.maker?.userRealName}" disabled=""  >
</span>

<span  class="fieldcontain  ">
    <label for="makeDate${pageId}">
        <g:message code="icGeneralHead.makeDate.label" default="Make Date" />

    </label>
    <input type="hidden" name="makeDate"      value="${icGeneralHeadInstance?.makeDate?.getTime()}">
    <input id="makeDate${pageId}"  date disabled=""   value="${icGeneralHeadInstance?.makeDate?.getTime()}">
</span>


<span  class="fieldcontain  ">
    <label for="checker${pageId}">
        <g:message code="icGeneralHead.checker.label" default="Checker" />

    </label>
    <input id="checker${pageId}"   disabled="" value="${icGeneralHeadInstance?.checker?.userRealName}">
</span>

<span  class="fieldcontain  ">
    <label for="checkDate">
        <g:message code="icGeneralHead.checkDate.label" default="Check Date" />

    </label>

    <input id="checkDate" name="checkDate"  disabled="" date value="${icGeneralHeadInstance?.checkDate?.getTime()}">
</span>

<span  class="fieldcontain  ">
    <label for="bdCorp${pageId}">
        <g:message code="icGeneralHead.bdCorp.label" default="Bd Corp" />

    </label>

    <input id="bdCorp${pageId}" name="bdCorp" disabled=""  value="${icGeneralHeadInstance?.bdCorp?.unitName}" canSave="false">
</span>