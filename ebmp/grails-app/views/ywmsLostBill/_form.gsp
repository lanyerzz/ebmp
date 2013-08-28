<%@ page import="com.app.ywms.cm.lossbill.YwmsLostBill" %>


  <script>
          function shl${pageId}(newValue,oldValue){

             var fxl=  $('#fxl${pageId}').numberbox('getValue1')

              var shsl=Number(newValue)*fxl;

              $('#shsl${pageId}').numberbox('setValue1',shsl);

          }

          function shsl${pageId}(newValue,oldValue){

              var fxl=  $('#fxl${pageId}').numberbox('getValue1')

              var shl=Number(newValue)/fxl;

              $('#shl${pageId}').numberbox('setValue1',shl);

          }
  </script>



<g:hiddenField name="id" value="${ywmsLostBIllInstance?.id}" />
<g:hiddenField name="version" value="${ywmsLostBIllInstance?.version}" />
<g:hiddenField name="businessType.id" value="${ywmsLostBIllInstance?.businessType?.id}"/>
<g:hiddenField name="billTypeCode" value="${ywmsLostBIllInstance?.billTypeCode}" ></g:hiddenField>
<g:hiddenField name="billtype.id" value="${ywmsLostBIllInstance?.billtype?.id}" ></g:hiddenField>
<g:hiddenField name="sourceBillType.id" value="${ywmsLostBIllInstance?.sourceBillType?.id}" ></g:hiddenField>
<g:hiddenField name="bdCorp.id" value="${ywmsLostBIllInstance?.bdCorp?.id}"></g:hiddenField>

<g:hiddenField name="sourceBid" value="${ywmsLostBIllInstance?.sourceBid}"></g:hiddenField>

<g:hiddenField name="sourceHid" value="${ywmsLostBIllInstance?.sourceHid}"></g:hiddenField>









<span  class="fieldcontain  ">
    <label for="billdate${pageId}" class="required" >
        <g:message code="ywmsLostBIll.billdate.label" default="Billdate" />
        
    </label>

    
    <input id="billdate${pageId}" name="billdate"   value="${ywmsLostBIllInstance?.billdate?.getTime()}" class="easyui-datebox" date validType="dateValidate" required="">
    
</span>



<span  class="fieldcontain  ">
    <label for="billno${pageId}"  >
        <g:message code="ywmsLostBIll.billno.label" default="Billno" />
        
    </label>

    
    <input id="billno${pageId}" name="billno"  value="" disabled="true"   >
    
</span>






<span  class="fieldcontain  ">
    <label for="contract${pageId}"  >
        <g:message code="ywmsLostBIll.contract.label" default="Contract" />
        
    </label>

    <g:hiddenField name="contract.id" value="${ywmsLostBIllInstance?.contract?.id}"></g:hiddenField>
    <input id="contract${pageId}" disabled="" value="${ywmsLostBIllInstance?.contract?.contractNo}">


    %{--<g:refTemplate code="refBaseContract" model="[id:'contract',name:'contract.id',value:ywmsLostBIllInstance?.contract?.id]"></g:refTemplate>--}%

    
</span>



<span  class="fieldcontain  ">
    <label for="pch${pageId}"  >
        <g:message code="ywmsLostBIll.pch.label" default="Pch" />

    </label>


    <input id="pch${pageId}" name="pch"  value="${ywmsLostBIllInstance?.pch}" readonly="" class="disabled">

</span>

<span  class="fieldcontain  ">
    <label for="invname${pageId}"  >
        <g:message code="ywmsLostBIll.invmandoc.label" default="Pch" />

    </label>

    <g:hiddenField name="invmandoc.id" value="${ywmsLostBIllInstance?.invmandoc?.id}"></g:hiddenField>
    <input id="invname${pageId}"   value="${ywmsLostBIllInstance?.invmandoc?.pkInvbasdoc?.invname}" readonly="" class="disabled">

</span>





<span  class="fieldcontain  ">
    <label for="fxl${pageId}"  >
        <g:message code="ywmsLostBIll.fxl.label" default="Fxl" />
        
    </label>

    
    <input id="fxl${pageId}" name="fxl"  value="${ywmsLostBIllInstance?.fxl}" class="easyui-numberbox disabled" readonly="" data-options="precision:4">

    
</span>



<span  class="fieldcontain  ">
    <label for="kcl${pageId}"  >
        <g:message code="ywmsLostBIll.kcl.label" default="Kcl" />
        
    </label>

    
    <input id="kcl${pageId}" name="kcl"  value="${ywmsLostBIllInstance?.kcl}" class="easyui-numberbox disabled" readonly="" data-options="precision:4">

    
</span>



<span  class="fieldcontain  ">
    <label for="lostDate${pageId}"  class="required">
        <g:message code="ywmsLostBIll.lostDate.label" default="Lost Date" />
        
    </label>

    
    <input id="lostDate${pageId}" name="lostDate"   value="${ywmsLostBIllInstance?.lostDate?.getTime()}" class="easyui-datebox" date validType="dateValidate" required="">
    
</span>



<span  class="fieldcontain  ">
    <label for="lostType${pageId}"  >
        <g:message code="ywmsLostBIll.lostType.label" default="Lost Type" />
        
    </label>

  <select id="lostType${pageId}" class="easyui-combobox" data-options="panelHeight:'auto',editable:false" name="lostType" value="${ywmsLostBIllInstance?.lostType}">
        <option value="0">合同损耗</option>
        <option value="1">保管损耗</option>
        <option value="2">装卸损耗</option>
        <option value="3">其他损耗</option>

    </select>
</span>








<span  class="fieldcontain  ">
    <label for="shl${pageId}"  >
        <g:message code="ywmsLostBIll.shl.label" default="Shl" />
        
    </label>

    
    <input id="shl${pageId}" name="shl"  value="${ywmsLostBIllInstance?.shl}" class="easyui-numberbox" data-options="precision:4,max:1,min:0,onChange:shl${pageId}">

    
</span>



<span  class="fieldcontain  ">
    <label for="shsl${pageId}"  >
        <g:message code="ywmsLostBIll.shsl.label" default="Shsl" />
        
    </label>

    
    <input id="shsl${pageId}" name="shsl"  value="${ywmsLostBIllInstance?.shsl}" class="easyui-numberbox" data-options="precision:4,onChange:shsl${pageId}">

    
</span>





<span  class="fieldcontain  ">
    <label for="vnote${pageId}"  >
        <g:message code="ywmsLostBIll.vnote.label" default="Vnote" />
        
    </label>

    
    <input id="vnote${pageId}" name="vnote"  value="${ywmsLostBIllInstance?.vnote}">
    
</span>

<hr>
<span  class="fieldcontain  ">
    <label for="maker${pageId}"  >
        <g:message code="ywmsLostBIll.maker.label" default="Maker" />

    </label>


    <g:hiddenField name="maker.id" value="${ywmsLostBIllInstance?.maker?.id}"></g:hiddenField>
    <input id="maker${pageId}" name="maker" value="${ywmsLostBIllInstance?.maker?.userRealName}" disabled="true"   canSave="false">

</span>
<span  class="fieldcontain  ">
    <label for="makeDate${pageId}"  >
        <g:message code="ywmsLostBIll.makeDate.label" default="Make Date" />

    </label>


    <g:hiddenField name="makeDate" value="${ywmsLostBIllInstance?.makeDate?.getTime()}"></g:hiddenField>
    <input id="makeDate${pageId}" name="makeDate" value="${ywmsLostBIllInstance?.makeDate?.getTime()}" disabled="true" date  >

</span>

<span  class="fieldcontain  ">
    <label for="checker${pageId}"  >
        <g:message code="ywmsLostBIll.checker.label" default="Checker" />

    </label>


    <input id="checker${pageId}" name="checker" value="${ywmsLostBIllInstance?.checker?.userRealName}" disabled="true"   canSave="false">

</span>



<span  class="fieldcontain  ">
    <label for="checkDate${pageId}"  >
        <g:message code="ywmsLostBIll.checkDate.label" default="Check Date" />

    </label>


    <g:hiddenField name="checkDate" value="${ywmsLostBIllInstance?.checkDate?.getTime()}"></g:hiddenField>
    <input id="checkDate${pageId}" name="checkDate" value="${ywmsLostBIllInstance?.checkDate?.getTime()}" disabled="true" date  >

</span>


<span  class="fieldcontain  ">
    <label for="bdCorp${pageId}"  >
        <g:message code="ywmsLostBIll.bdCorp.label" default="Bd Corp" />

    </label>


    <input id="bdCorp${pageId}" name="bdCorp" value="${ywmsLostBIllInstance?.bdCorp?.unitName}" disabled="true"   canSave="false">

</span>