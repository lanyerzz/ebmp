<%@ page import="com.app.bd.exchange.BdExchange" %>


<script>
    function load${pageId}(){

        %{--var isValid = $('#form${pageId}').form('validate');--}%
        %{--if (!isValid){--}%

            %{--return;--}%
        %{--}--}%

      var json=  $('#form${pageId}').serializeObject();

        //先判断币种是否相同
//        alert(isEmpty(json['currtypeOne.id']));
//        alert(json.currtypeOne+':'+isEmpty(json.currtypeOne));

        var currtypeOne= json['currtypeOne.id']
        if(isEmpty(currtypeOne))
            return;
        var currtypeTwo= json['currtypeTwo.id']
        if(isEmpty(currtypeTwo))
            return;

        if(currtypeOne==currtypeTwo){
            $.messager.alert('警告','币种1和币种2不能相同！');
            return;
        }

        if(isEmpty(json.year)) return;

        if(isEmpty(json.month)) return;

      //  var rows=$('#body${pageId}').edatagrid('getRows');
        //for(var i=0;i<rows.length;i++){
            $('#body${pageId}').edatagrid('load',{});
       // }



        var num=new Date(json.year,json.month,0).getDate();
        //var data=new Array();
        for(var i=1;i<=num;i++){
          //  data.push({day:i,exchange:1});
            $('#body${pageId}').edatagrid('appendRow',{day:i,exchange:1});
        }




    }
</script>

<g:hiddenField name="id" value="${bdExchangeInstance?.id}" />
<g:hiddenField name="version" value="${bdExchangeInstance?.version}" />
<g:hiddenField name="bdCorp.id" value="${bdExchangeInstance?.bdCorp?.id}"></g:hiddenField>






<span id="divcurrtypeOne${pageId}" class="fieldcontain  required">
    <label for="currtypeOne">
        <g:message code="bdExchange.currtypeOne.label" default="Currtype One" />
        <span class="required-indicator">*</span>
    </label>
    <g:if test="${ac=='create'}">
        <g:refTemplate code="refBdCurrtype" model="[id:'currtypeOne',name:'currtypeOne.id',required:true,value:bdExchangeInstance?.currtypeOne?.id]"></g:refTemplate>

    </g:if>
    <g:else>

        <input type="hidden" name="currtypeOne.id" value="${bdExchangeInstance?.currtypeOne?.id}">
        <input class="myui"  canSsave="false" value="${bdExchangeInstance?.currtypeOne?.name}" readonly="">
    </g:else>
   </span>


<span id="divcurrtypeTwo${pageId}" class="fieldcontain  required">
    <label for="currtypeTwo">
        <g:message code="bdExchange.currtypeTwo.label" default="Currtype Two" />
        <span class="required-indicator">*</span>
    </label>

    <g:if test="${ac=='create'}">
        <g:refTemplate code="refBdCurrtype" model="[id:'currtypeTwo',name:'currtypeTwo.id',required:true,value:bdExchangeInstance?.currtypeTwo?.id]"></g:refTemplate>

    </g:if>
    <g:else>

        <input type="hidden" name="currtypeTwo.id" value="${bdExchangeInstance?.currtypeTwo?.id}">
        <input class="myui"  canSsave="false" value="${bdExchangeInstance?.currtypeTwo?.name}" readonly="">
    </g:else>

</span>


<span id="divyear${pageId}" class="fieldcontain  required">
    <label for="year">
        <g:message code="bdExchange.year.label" default="Year" />
        <span class="required-indicator">*</span>
    </label>
    <g:if test="${ac=='create'}">
       <input class="easyui-numberbox myui" name="year" required=""   id="year" data-options="min:2000,max:2999,precision:0" value="${bdExchangeInstance.year}">

    </g:if>
    <g:else>
        <input class=" myui" name="year" required=""  readonly="" id="year"  value="${bdExchangeInstance.year}" >

    </g:else>

</span>



<span id="divmonth${pageId}" class="fieldcontain  required">
    <label for="month">
        <g:message code="bdExchange.month.label" default="Month" />
        <span class="required-indicator">*</span>
    </label>
    <g:select name="month" from="[1,2,3,4,5,6,7,8,9,10,11,12]"   disabled="${ac=='edit'}"></g:select>
    %{--<input class="easyui-numberbox myui" name="month" id="month" data-options="min:1,max:12,precision:0" value="${bdExchangeInstance.month}">--}%
</span>

<span id="divbdCorp${pageId}" class="fieldcontain  ">
    <label for="bdCorp">
        <g:message code="bdExchange.bdCorp.label" default="Bd Corp" />

    </label>
   <input readonly="" value="${bdExchangeInstance?.bdCorp?.unitName}" class="myui">
</span>
