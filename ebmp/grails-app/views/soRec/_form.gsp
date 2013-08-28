<%@ page import="com.app.so.rec.SoRec" %>

<g:hiddenField name="id" value="${soRecInstance?.id}" />
<g:hiddenField name="version" value="${soRecInstance?.version}" />
<g:hiddenField name="businessType.id" value="${soRecInstance?.businessType?.id}"/>
<g:hiddenField name="billTypeCode" value="${soRecInstance?.billTypeCode}" ></g:hiddenField>
<g:hiddenField name="billtype.id" value="${soRecInstance?.billtype?.id}" ></g:hiddenField>

<g:hiddenField name="bdCorp.id" value="${soRecInstance?.bdCorp?.id}"></g:hiddenField>
<g:hiddenField name="sourceBill.id" value="${soRecInstance?.sourceBill?.id}"></g:hiddenField>

<p>订单信息</p>


<span  class="fieldcontain  ">
    <label for="sourceBill_billcode">
        <g:message code="soSale.billno.label"  />

    </label>
    <input id="sourceBill_billcode" name="sourceBill.billno" canSave="false" value="${soRecInstance?.sourceBill?.billno}" disabled="" >
</span>

<span  class="fieldcontain  ">
    <label for="sourceBillbilldate">
        <g:message code="soSale.billdate.label"  />

    </label>
    <input id="sourceBillbilldate" name="sourceBillbilldate" date canSave="false" value="${soRecInstance?.sourceBill?.billdate?.getTime()}" disabled="" >
</span>

<span  class="fieldcontain  ">
    <label for="sourceBill_billcode">
        <g:message code="soSale.customer.label"  />

    </label>
    <input id="sourceBill_customer" name="sourceBill_customer" canSave="false" value="${soRecInstance?.sourceBill?.customer?.pkCubasdoc?.custname}" disabled="">
</span>
<g:hiddenField name="currencytype" id="currencytype${pageId}" value="${soRecInstance?.sourceBill?.currencytype?.id}" canSave="false"></g:hiddenField>
<span  class="fieldcontain  ">
    <label for="currencytype${pageId}">
        <g:message code="soSale.currencytype.label"  />

    </label>
    <input id="currencytype${pageId}" name="sourceBill_currencytype" canSave="false" value="${soRecInstance?.sourceBill?.currencytype?.currtypename}" disabled="" >
</span>

<span  class="fieldcontain  ">
    <label for="ddje${pageId}">
        <g:message code="soSale.nrecmnny.label"  />

    </label>
    <input id="ddje${pageId}"  value="${soRecInstance?.sourceBill?.nrecmnny}" disabled="" class="easyui-numberbox" data-options="precision:2" style="color: red">
</span>

<span  class="fieldcontain  ">
    <label for="ddwhx${pageId}">
        <g:message code="soSale.ddwhx.label"  />

    </label>
    <input id="ddwhx${pageId}"   value="${soRecInstance?.sourceBill?.nrecmnny ?:0-(soRecInstance?.sourceBill?.hxje?:0)}" disabled="" class="easyui-numberbox " data-options="precision:2" style="color: red">
</span>
<hr>
<p>收款信息</p>

<span id="divbusinessType${pageId}" class="fieldcontain  ">
    <label for="businessType">
        <g:message code="soRec.businessType.label" default="Business Type" />

    </label>
     <input id="businessType" name="businessType"  value="${soRecInstance?.businessType?.name}" disabled="">
</span>



<span id="divbillno${pageId}" class="fieldcontain  ">
    <label for="billno">
        <g:message code="soRec.billno.label" default="Billno" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="billno" value="${soRecInstance?.billno}" disabled=""/>

</span>




<span id="divbilldate${pageId}" class="fieldcontain  ">
    <label for="billdate">
        <g:message code="soRec.billdate.label" default="Billdate" />

    </label>
   <input date id="billdate" name="billdate" class="easyui-datebox" value="${soRecInstance?.billdate?.getTime()}">
</span>




<span id="divzk${pageId}" class="fieldcontain  ">
    <label for="zk${pageId}">
        <g:message code="soRec.zk.label" default="Zk" />

    </label>

    <input class="easyui-numberbox myui" data-options="precision:2" id="zk${pageId}" name="zk" value="${soRecInstance?.zk}" style="color: red">

</span>






<span id="divhxje${pageId}" class="fieldcontain  ">
    <label for="hxje${pageId}">
        <g:message code="soRec.hxje.label" default="Hxje" />
        
    </label>
    <input class="easyui-numberbox disabled" data-options="precision:2" id="hxje${pageId}" name="hxje" value="${soRecInstance?.hxje}" readonly="" style="color: red">


</span>










<span id="divvnote${pageId}" class="fieldcontain  ">
    <label for="vnote">
        <g:message code="soRec.vnote.label" default="Vnote" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="vnote" value="${soRecInstance?.vnote}"/>

</span>


<hr>
<p>其他信息</p>


<span id="divmaker${pageId}" class="fieldcontain  ">
    <label for="maker">
        <g:message code="soRec.maker.label" default="Maker" />

    </label>
    <g:hiddenField name="maker.id" value="${soRecInstance?.maker?.id}"></g:hiddenField>
    <input id="maker" name="maker"  class="myui"  value="${soRecInstance?.maker?.userRealName}" disabled="">
</span>

<span id="divmakeDate${pageId}" class="fieldcontain  ">
    <label for="makeDate">
        <g:message code="soRec.makeDate.label" default="Make Date" />

    </label>
    <g:hiddenField name="makeDate" value="${soRecInstance?.makeDate?.getTime()}"></g:hiddenField>
    <input id="makeDate${pageId}"  disabled="" value="${soRecInstance?.makeDate?.getTime()}" date  >
</span>





<span id="divchecker${pageId}" class="fieldcontain  ">
    <label for="checker">
        <g:message code="soRec.checker.label" default="Checker" />

    </label>
    <input id="checker" name="checker" disabled="" class="myui"   value="${soRecInstance?.checker?.userRealName}">
</span>

<span id="divcheckDate${pageId}" class="fieldcontain  ">
    <label for="checkDate">
        <g:message code="soRec.checkDate.label" default="Check Date" />

    </label>

    <input name="checkDate" id="checkDate"   value="${soRecInstance?.checkDate?.getTime()}" disabled="" date>
</span>

<span id="divbdCorp${pageId}" class="fieldcontain  ">
    <label for="bdCorp">
        <g:message code="soRec.bdCorp.label" default="Bd Corp" />

    </label>
    <input id="bdCorp" name="bdCorp"   disabled="" value="${soRecInstance?.bdCorp?.unitName}">
</span>
