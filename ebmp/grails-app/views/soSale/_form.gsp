<%@ page import="com.app.so.order.SoSale" %>

<script>
    function onSelectCurrencytype${pageId}(index,data){



        if(data==null){

            $('#nexchangeotobrate${pageId}').numberbox('setValue',0);
            %{--$('#bodyTable${pageId}').edatagrid('setLabelValue',{field:'ntaxrate',value:''});--}%

        }else{

            //获取汇率

            $.post('${createLink(controller: 'bdExchange',action: 'getExchage')}',{currtypeId:data.id,date:$('#form${pageId}').serializeObject().billdate},function(json){
                $('#nexchangeotobrate${pageId}').numberbox('setValue',json);
                %{--$('#bodyTable${pageId}').edatagrid('setColValue',{field:'nexchangeotobrate',value:json});--}%
            });


        }

    }

    %{--function ndiscountrate${pageId}(newValue,oldValue){--}%

        %{----}%
        %{----}%
    %{--}--}%



    function nratemnny${pageId}(newValue,oldValue){

        var nheadsummny= $('#nheadsummny${pageId}').numberbox('getValue');

        var nrecmmny =parseFloat(nheadsummny)-parseFloat(newValue);

        $('#nrecmnny${pageId}').numberbox('setValue',nrecmmny);


    }

    function nheadsummny${pageId}(newValue,oldValue){

        var nratemnny= $('#nratemnny${pageId}').numberbox('getValue');
        nratemnny=nratemnny=='' ? 0 : nratemnny;

        var nrecmmny =parseFloat(newValue)-parseFloat(nratemnny);
        $('#nrecmnny${pageId}').numberbox('setValue',nrecmmny);
    }


</script>

<g:hiddenField name="id" value="${soSaleInstance?.id}" />
<g:hiddenField name="version" value="${soSaleInstance?.version}" />
<g:hiddenField name="businessType.id" value="${soSaleInstance?.businessType?.id}"/>
<g:hiddenField name="billTypeCode" value="${soSaleInstance?.billTypeCode}" ></g:hiddenField>
<g:hiddenField name="billtype.id" value="${soSaleInstance?.billtype?.id}" ></g:hiddenField>
<g:hiddenField name="sourceBillType.id" value="${soSaleInstance?.sourceBillType?.id}" ></g:hiddenField>
<g:hiddenField name="sourceBillTypeCode" value="${soSaleInstance?.sourceBillTypeCode}" ></g:hiddenField>
<g:hiddenField name="bdCorp.id" value="${soSaleInstance?.bdCorp?.id}"></g:hiddenField>
<g:hiddenField name="maker.id" value="${soSaleInstance?.maker?.id}"></g:hiddenField>


<span id="divbusinessType${pageId}" class="fieldcontain  ">
    <label for="businessType${pageId}">
        <g:message code="soSale.businessType.label" default="Business Type" />

    </label>
    <input id="businessType${pageId}" name="businessType" canSave="false" value="${soSaleInstance?.businessType?.name}" disabled="">
</span>


<span id="divbillno${pageId}" class="fieldcontain  ">
    <label for="billno${pageId}">
        <g:message code="soSale.billno.label" default="Billno" />
        
    </label>
    <g:textField class="easyui-validatebox" id="billno${pageId}" name="billno" value="${soSaleInstance?.billno}" disabled=""/>

</span>


<span id="divbilldate${pageId}" class="fieldcontain  required">
    <label for="billdate${pageId}" class="required">
        <g:message code="soSale.billdate.label" default="Billdate" />
        <span class="required-indicator">*</span>
    </label>

    <input class="easyui-datebox" required="" id="billdate${pageId}" date name="billdate" value="${soSaleInstance?.billdate?.getTime()}">
</span>

<span  class="fieldcontain  required">
    <label for="bdSalestru${pageId}" class="required">
        <g:message code="soSale.bdSalestru.label" default="Billdate" />
        <span class="required-indicator">*</span>
    </label>

    <g:refTemplate code="refBdSalestru"  model="[id:'bdSalestru',name:'bdSalestru.id',required:true,value:soSaleInstance?.bdSalestru?.id]"></g:refTemplate>
</span>


<span id="divcustomer${pageId}" class="fieldcontain">
    <label for="customer${pageId}" class="required">
        <g:message code="soSale.customer.label" default="Customer" />
        <span class="required-indicator">*</span>
    </label>
       <g:refTemplate code="refBdCustomer" model="[id:'customer',name:'customer.id',required:true,value:soSaleInstance?.customer?.id]"></g:refTemplate>
</span>


<span id="divbalatype${pageId}" class="fieldcontain  ">
    <label for="balatype${pageId}" class="required">
        <g:message code="soSale.balatype.label" default="Balatype" />

    </label>
       <g:refTemplate code="refBdBalatype" model="[id:'balatype',name:'balatype.id',required:true,value:soSaleInstance?.balatype?.id]"></g:refTemplate>
</span>







<span id="divbretinvflag${pageId}" class="fieldcontain  ">
    <label for="bretinvflag${pageId}">
        <g:message code="soSale.bretinvflag.label" default="Bretinvflag" />

    </label>
    <g:checkBox name="bretinvflag" id="bretinvflag${pageId}" class="checkbox" value="${soSaleInstance?.bretinvflag}" disabled=""/>

</span>





<span id="divcalbody${pageId}" class="fieldcontain  ">
    <label for="calbody${pageId}" class="required">
        <g:message code="soSale.calbody.label" default="Calbody" />

    </label>
    <g:refTemplate code="refBdCalbody" model="[id:'calbody',name:'calbody.id',required:true,value:soSaleInstance?.calbody?.id]"></g:refTemplate>

</span>

%{--<span  class="fieldcontain  ">--}%
    %{--<label for="stordoc${pageId}" class="required">--}%
        %{--<g:message code="soSale.stordoc.label" default="Calbody" />--}%

    %{--</label>--}%
    %{--<g:refTemplate code="refBdStordoc" model="[id:'stordoc',name:'stordoc.id',required:true,value:soSaleInstance?.stordoc?.id]"></g:refTemplate>--}%

%{--</span>--}%

<span id="divcurrencytype${pageId}" class="fieldcontain  ">
    <label for="currencytype${pageId}" class="required">
        <g:message code="soSale.currencytype.label" />

    </label>
    <g:refTemplate code="refBdCurrtype" model="[id:'currencytype',name:'currencytype.id',required:true,value:soSaleInstance?.currencytype?.id,onSelect:'onSelectCurrencytype'+pageId]"></g:refTemplate>

</span>

<span id="divnexchangeotobrate${pageId}" class="fieldcontain  ">
    <label for="nexchangeotobrate${pageId}">
        <g:message code="soSale.nexchangeotobrate.label" />

    </label>

    <input id="nexchangeotobrate${pageId}" name="nexchangeotobrate" data-options="precision:6" value="${soSaleInstance?.nexchangeotobrate}" class="easyui-numberbox ">
</span>


<span id="divdeptdoc${pageId}" class="fieldcontain  ">
    <label for="deptdoc${pageId}">
        <g:message code="soSale.deptdoc.label" default="Deptdoc" />

    </label>
    <g:refTemplate model="[id:'deptdoc',name:'deptdoc.id',text:soSaleInstance?.deptdoc?.deptName,value:soSaleInstance?.deptdoc?.id]" code="refBdDeptdoc"></g:refTemplate>

</span>


<span id="divpsndoc${pageId}" class="fieldcontain  ">
    <label for="psndoc${pageId}">
        <g:message code="soSale.psndoc.label" default="Psndoc" />

    </label>
    <g:refTemplate code="refBdPsndoc" model="[id:'psndoc',name:'psndoc.id',value:soSaleInstance?.psndoc?.id]"></g:refTemplate>
</span>







<span id="divnheadsummny${pageId}" class="fieldcontain  ">
    <label for="nheadsummny${pageId}">
        <g:message code="soSale.nheadsummny.label" default="Nheadsummny" />

    </label>
    <input id="nheadsummny${pageId}" name="nheadsummny" data-options="precision:2,onChange:nheadsummny${pageId}" style="text-align: right;color: red" value="${soSaleInstance?.nheadsummny}" class="easyui-numberbox disabled" readonly="">

</span>


%{--<span id="divndiscountrate${pageId}" class="fieldcontain  ">--}%
    %{--<label for="ndiscountrate${pageId}">--}%
        %{--<g:message code="soSale.ndiscountrate.label" default="Ndiscountrate" />--}%

    %{--</label>--}%
    %{--<input id="ndiscountrate${pageId}" name="ndiscountrate" data-options="precision:4,onChange:ndiscountrate${pageId}" value="${soSaleInstance?.ndiscountrate}" style="text-align: right;" class="easyui-numberbox myui" >--}%
%{--</span>--}%



<span id="divnratemnny${pageId}" class="fieldcontain  ">
    <label for="nratemnny${pageId}">
        <g:message code="soSale.nratemnny.label"  />

    </label>
    <input id="nratemnny${pageId}" name="nratemnny"  data-options="precision:2,onChange:nratemnny${pageId}" value="${soSaleInstance?.nratemnny}"  class="easyui-numberbox myui"  style="text-align: right;color: red"  >

</span>


<span id="divnrecmnny${pageId}" class="fieldcontain  ">
    <label for="nrecmnny${pageId}">
        <g:message code="soSale.nrecmnny.label" default="折扣后金额" />

    </label>
    <input id="nrecmnny${pageId}" name="nrecmnny"  data-options="precision:2" value="${soSaleInstance?.nrecmnny}"  class="easyui-numberbox disabled" readonly="" style="text-align: right;color: red">

</span>

%{--<span id="divnpreceivemny${pageId}" class="fieldcontain  ">--}%
    %{--<label for="npreceivemny">--}%
        %{--<g:message code="soSale.npreceivemny.label" default="Npreceivemny" />--}%

    %{--</label>--}%
    %{--<input id="npreceivemny" name="npreceivemny" data-options="precision:2" value="${soSaleInstance?.npreceivemny}" class="easyui-numberbox myui">--}%

%{--</span>--}%


<span id="divvnote${pageId}" class="fieldcontain  ">
    <label for="vnote${pageId}">
        <g:message code="soSale.vnote.label" default="Vnote" />

    </label>
    <g:textField id="note${pageId}" class="easyui-validatebox myui" name="vnote" value="${soSaleInstance?.vnote}"/>

</span>


<span id="divvreceiveaddress${pageId}" class="fieldcontain  ">
    <label for="vreceiveaddress">
        <g:message code="soSale.vreceiveaddress.label" default="Vreceiveaddress" />

    </label>
    <g:textField class="easyui-validatebox myui" name="vreceiveaddress" value="${soSaleInstance?.vreceiveaddress}"/>

</span>

<span id="divlinkTel${pageId}" class="fieldcontain  ">
    <label for="linkTel">
        <g:message code="soSale.linkTel.label"  />

    </label>
    <input id="linkTel" class="easyui-validatebox myui" name="linkTel" value="${soSaleInstance?.linkTel}">

</span>

<br>
其他信息
<hr style="float: none">


<span id="divmaker${pageId}" class="fieldcontain  ">
    <label for="maker">
        <g:message code="default.maker.label" default="Maker" />

    </label>
     <input id="maker" name="maker" value="${soSaleInstance?.maker?.name}" disabled="">
</span>

<span id="divmakeDate${pageId}" class="fieldcontain  ">
    <label for="makeDate">
        <g:message code="soSale.makeDate.label" default="Make Date" />

    </label>
    <input  type="hidden" id="makeDate" name="makeDate" value="${soSaleInstance?.makeDate?.getTime()}">
    <input id="makeDate_" name="makeDate_" date value="${soSaleInstance?.makeDate?.getTime()}" disabled="">

</span>



<span id="divchecker${pageId}" class="fieldcontain  ">
    <label for="checker">
        <g:message code="soSale.checker.label" default="Checker" />

    </label>
    <input id="checker" name="checker" value="${soSaleInstance?.checker?.name}" disabled="">
</span>


<span id="divcheckDate${pageId}" class="fieldcontain  ">
    <label for="checkDate">
        <g:message code="soSale.checkDate.label" default="Check Date" />

    </label>
    <input id="checkDate" name="checkDate" value="${soSaleInstance?.checkDate?.getTime()}" date disabled="">
</span>


<span id="divbdCorp${pageId}" class="fieldcontain  ">
    <label for="bdCorp${pageId}">
        <g:message code="soSale.bdCorp.label" default="Bd Corp" />

    </label>
    <input id="bdCorp${pageId}" disabled="" value="${soSaleInstance?.bdCorp?.unitName}">
</span>
