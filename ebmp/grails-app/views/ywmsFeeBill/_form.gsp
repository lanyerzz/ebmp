<%@ page import="com.app.ywms.settle.fee.YwmsFeeBill" %>

<g:hiddenField name="id" value="${ywmsFeeBillInstance?.id}" />
<g:hiddenField name="version" value="${ywmsFeeBillInstance?.version}" />
<g:hiddenField name="businessType.id" value="${ywmsFeeBillInstance?.businessType?.id}"/>
<g:hiddenField name="billTypeCode" value="${ywmsFeeBillInstance?.billTypeCode}" ></g:hiddenField>
<g:hiddenField name="billtype.id" value="${ywmsFeeBillInstance?.billtype?.id}" ></g:hiddenField>
<g:hiddenField name="sourceBillType.id" value="${ywmsFeeBillInstance?.sourceBillType?.id}" ></g:hiddenField>
<g:hiddenField name="bdCorp.id" value="${ywmsFeeBillInstance?.bdCorp?.id}"></g:hiddenField>







<span  class="fieldcontain  required">
    <label for="billdate${pageId}" class="required" >
        <g:message code="ywmsFeeBill.billdate.label" default="Billdate" />
        <span class="required-indicator">*</span>
    </label>

    
    <input id="billdate${pageId}" name="billdate"   value="${ywmsFeeBillInstance?.billdate}" class="easyui-datebox" date validType="dateValidate" >
    
</span>



<span  class="fieldcontain  required">
    <label for="feeType${pageId}" class="required" >
        <g:message code="ywmsFeeBill.feeType.label" default="Fee Type" />
        <span class="required-indicator">*</span>
    </label>

    


    <g:refTemplate code="refYwmsFeeType" model="[id:'feeType',name:'feeType.id',value:ywmsFeeBillInstance?.feeType?.id]"></g:refTemplate>

    
</span>



<span  class="fieldcontain  required">
    <label for="jsrq${pageId}" class="required" >
        <g:message code="ywmsFeeBill.jsrq.label" default="Jsrq" />
        <span class="required-indicator">*</span>
    </label>

    
    <input id="jsrq${pageId}" name="jsrq"   value="${ywmsFeeBillInstance?.jsrq}" class="easyui-datebox" date validType="dateValidate" >
    
</span>



<span  class="fieldcontain  required">
    <label for="dj${pageId}" class="required" >
        <g:message code="ywmsFeeBill.dj.label" default="Dj" />
        <span class="required-indicator">*</span>
    </label>

    
    <input id="dj${pageId}" name="dj"  value="${ywmsFeeBillInstance?.dj}" class="easyui-numberbox" data-options="precision:2">

    
</span>



<span  class="fieldcontain  required">
    <label for="yfsl${pageId}" class="required" >
        <g:message code="ywmsFeeBill.yfsl.label" default="Yfsl" />
        <span class="required-indicator">*</span>
    </label>

    
    <input id="yfsl${pageId}" name="yfsl"  value="${ywmsFeeBillInstance?.yfsl}" class="easyui-numberbox" data-options="precision:2">

    
</span>



<span  class="fieldcontain  required">
    <label for="yfje${pageId}" class="required" >
        <g:message code="ywmsFeeBill.yfje.label" default="Yfje" />
        <span class="required-indicator">*</span>
    </label>

    
    <input id="yfje${pageId}" name="yfje"  value="${ywmsFeeBillInstance?.yfje}" class="easyui-numberbox" data-options="precision:2">

    
</span>



<span  class="fieldcontain  required">
    <label for="fkdw${pageId}" class="required" >
        <g:message code="ywmsFeeBill.fkdw.label" default="Fkdw" />
        <span class="required-indicator">*</span>
    </label>

    


    <g:refTemplate code="refBdCumandoc" model="[id:'fkdw',name:'fkdw.id',value:ywmsFeeBillInstance?.fkdw?.id]"></g:refTemplate>

    
</span>



<span  class="fieldcontain  ">
    <label for="bdCorp${pageId}"  >
        <g:message code="ywmsFeeBill.bdCorp.label" default="Bd Corp" />
        
    </label>

    
    <input id="bdCorp${pageId}" name="bdCorp" value="${ywmsFeeBillInstance?.bdCorp?.unitName}" disabled="true"   canSave="false">
    
</span>



<span  class="fieldcontain  ">
    <label for="bg${pageId}"  >
        <g:message code="ywmsFeeBill.bg.label" default="Bg" />
        
    </label>

    
    <input id="bg${pageId}" name="bg"  value="${ywmsFeeBillInstance?.bg}">
    
</span>



<span  class="fieldcontain  ">
    <label for="bght${pageId}"  >
        <g:message code="ywmsFeeBill.bght.label" default="Bght" />
        
    </label>

    


    <g:refTemplate code="refBaseContract" model="[id:'bght',name:'bght.id',value:ywmsFeeBillInstance?.bght?.id]"></g:refTemplate>

    
</span>



<span  class="fieldcontain  ">
    <label for="billTypeCode${pageId}"  >
        <g:message code="ywmsFeeBill.billTypeCode.label" default="Bill Type Code" />
        
    </label>

    
    <input id="billTypeCode${pageId}" name="billTypeCode"  value="${ywmsFeeBillInstance?.billTypeCode}">
    
</span>



<span  class="fieldcontain  ">
    <label for="billno${pageId}"  >
        <g:message code="ywmsFeeBill.billno.label" default="Billno" />
        
    </label>

    
    <input id="billno${pageId}" name="billno"  value="" disabled="true"   >
    
</span>



<span  class="fieldcontain  ">
    <label for="billtype${pageId}"  >
        <g:message code="ywmsFeeBill.billtype.label" default="Billtype" />
        
    </label>

    


    <g:refTemplate code="refPubBilltype" model="[id:'billtype',name:'billtype.id',value:ywmsFeeBillInstance?.billtype?.id]"></g:refTemplate>

    
</span>



<span  class="fieldcontain  ">
    <label for="businessType${pageId}"  >
        <g:message code="ywmsFeeBill.businessType.label" default="Business Type" />
        
    </label>

    
    <input id="businessType${pageId}" name="businessType"  value="${ywmsFeeBillInstance?.businessType?.name}" disabled="true"   >
    
</span>



<span  class="fieldcontain  ">
    <label for="checkDate${pageId}"  >
        <g:message code="ywmsFeeBill.checkDate.label" default="Check Date" />
        
    </label>

    
    <g:hiddenField name="checkDate" value="${ywmsFeeBillInstance?.checkDate?.getTime()}"></g:hiddenField>
    <input id="checkDate${pageId}" name="checkDate" value="${ywmsFeeBillInstance?.checkDate?.getTime()}" disabled="true" date  >
    
</span>



<span  class="fieldcontain  ">
    <label for="checker${pageId}"  >
        <g:message code="ywmsFeeBill.checker.label" default="Checker" />
        
    </label>

    
    <input id="checker${pageId}" name="checker" value="${ywmsFeeBillInstance?.checker?.userRealName}" disabled="true"   canSave="false">
    
</span>



<span  class="fieldcontain  ">
    <label for="djlj${pageId}"  >
        <g:message code="ywmsFeeBill.djlj.label" default="Djlj" />
        
    </label>

    
    <input id="djlj${pageId}" name="djlj"  value="${ywmsFeeBillInstance?.djlj}" class="easyui-numberbox" data-options="precision:2">

    
</span>



<span  class="fieldcontain  ">
    <label for="hw${pageId}"  >
        <g:message code="ywmsFeeBill.hw.label" default="Hw" />
        
    </label>

    


    <g:refTemplate code="refBdInvmandoc" model="[id:'hw',name:'hw.id',value:ywmsFeeBillInstance?.hw?.id]"></g:refTemplate>

    
</span>



<span  class="fieldcontain  ">
    <label for="hz${pageId}"  >
        <g:message code="ywmsFeeBill.hz.label" default="Hz" />
        
    </label>

    


    <g:refTemplate code="refBdCumandoc" model="[id:'hz',name:'hz.id',value:ywmsFeeBillInstance?.hz?.id]"></g:refTemplate>

    
</span>



<span  class="fieldcontain  ">
    <label for="je${pageId}"  >
        <g:message code="ywmsFeeBill.je.label" default="Je" />
        
    </label>

    
    <input id="je${pageId}" name="je"  value="${ywmsFeeBillInstance?.je}" class="easyui-numberbox" data-options="precision:2">

    
</span>



<span  class="fieldcontain  ">
    <label for="jssl${pageId}"  >
        <g:message code="ywmsFeeBill.jssl.label" default="Jssl" />
        
    </label>

    
    <input id="jssl${pageId}" name="jssl"  value="${ywmsFeeBillInstance?.jssl}" class="easyui-numberbox" data-options="precision:2">

    
</span>



<span  class="fieldcontain  ">
    <label for="makeDate${pageId}"  >
        <g:message code="ywmsFeeBill.makeDate.label" default="Make Date" />
        
    </label>

    
    <g:hiddenField name="makeDate" value="${ywmsFeeBillInstance?.makeDate?.getTime()}"></g:hiddenField>
    <input id="makeDate${pageId}" name="makeDate" value="${ywmsFeeBillInstance?.makeDate?.getTime()}" disabled="true" date  >
    
</span>



<span  class="fieldcontain  ">
    <label for="maker${pageId}"  >
        <g:message code="ywmsFeeBill.maker.label" default="Maker" />
        
    </label>

    
    <g:hiddenField name="maker.id" value="${ywmsFeeBillInstance?.maker?.id}"></g:hiddenField>
    <input id="maker${pageId}" name="maker" value="${ywmsFeeBillInstance?.maker?.userRealName}" disabled="true"   canSave="false">
    
</span>



<span  class="fieldcontain  ">
    <label for="vnote${pageId}"  >
        <g:message code="ywmsFeeBill.vnote.label" default="Vnote" />
        
    </label>

    
    <input id="vnote${pageId}" name="vnote"  value="${ywmsFeeBillInstance?.vnote}">
    
</span>



<span  class="fieldcontain  ">
    <label for="xgywdh${pageId}"  >
        <g:message code="ywmsFeeBill.xgywdh.label" default="Xgywdh" />
        
    </label>

    
    <input id="xgywdh${pageId}" name="xgywdh"  value="${ywmsFeeBillInstance?.xgywdh}">
    
</span>



<span  class="fieldcontain  ">
    <label for="ywsl${pageId}"  >
        <g:message code="ywmsFeeBill.ywsl.label" default="Ywsl" />
        
    </label>

    
    <input id="ywsl${pageId}" name="ywsl"  value="${ywmsFeeBillInstance?.ywsl}" class="easyui-numberbox" data-options="precision:2">

    
</span>



<span  class="fieldcontain  ">
    <label for="yxhqrd${pageId}"  >
        <g:message code="ywmsFeeBill.yxhqrd.label" default="Yxhqrd" />
        
    </label>

    


    <g:refTemplate code="refYxhqrd" model="[id:'yxhqrd',name:'yxhqrd.id',value:ywmsFeeBillInstance?.yxhqrd?.id]"></g:refTemplate>

    
</span>

