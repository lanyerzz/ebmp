<%@ page import="com.app.ywms.ck.zmtd.Yzmtdh" %>

<script>
    <g:if test="${yzmtdhInstance?.zmlx!=1}">
        hideHQZR${pageId}();
    </g:if>
    $(function(){

    });
    function zmlx${pageId}(newValue,oldValue){
        if(newValue==1){
            showHQZR${pageId}();
        }else{
            hideHQZR${pageId}();
        }
    }
    function showHQZR${pageId}(){
        $('#spanzrht${pageId}').show();
        $('#spanzrpc${pageId}').show();
        $('#spanzrfcdsh${pageId}').show();
    }
    function hideHQZR${pageId}(){
        $('#spanzrht${pageId}').hide();
        $('#spanzrpc${pageId}').hide();
        $('#spanzrfcdsh${pageId}').hide();
    }

    function tdsl${pageId}(newValue,oldValue){

        $('#szsl${pageId}').numberbox('setValue',newValue);
    }

    function zrht_bf${pageId}(param){
      var id=  $('#zrdw${pageId}').combogrid('getValue');

        if(id){

            var p=createCriterias('and');
            addCriteria(p,[opt_equals,'bdCumandoc1.id',id]);

            param['extendParam']=encodeURI(JSON.stringify(p));
            return true;
        }else{
            return false;
        }

    }


    function zrdw${pageId}(newValue,oldValue){
        $('#zrht${pageId}').combogrid('clear');
        $('#zrht${pageId}').combogrid('options').loaded=false;
    }


</script>

<g:hiddenField name="id" value="${yzmtdhInstance?.id}" />
<g:hiddenField name="version" value="${yzmtdhInstance?.version}" />
<g:hiddenField name="businessType.id" value="${yzmtdhInstance?.businessType?.id}"/>
<g:hiddenField name="billTypeCode" value="YZMTD" ></g:hiddenField>
<g:hiddenField name="sourceBillType.id" value="${yzmtdhInstance?.sourceBillType?.id}" ></g:hiddenField>
<g:hiddenField name="sourceBillTypeCode" value="${yzmtdhInstance?.sourceBillTypeCode}" ></g:hiddenField>
<g:hiddenField name="bdCorp.id" value="${yzmtdhInstance?.bdCorp?.id}"></g:hiddenField>



<p >基本信息</p>
<span  class="fieldcontain  ">
    <label for="businessType${pageId}">
        <g:message code="yzmtdh.businessType.label" default="businessType" />
    </label>
    <input  id="businessType${pageId}" disabled="true"  value="${yzmtdhInstance?.businessType?.name}"  />
</span>
    <span id="divbillno${pageId}" class="fieldcontain  ">
        <label for="billno${pageId}">
            <g:message code="yzmtdh.billno.label" default="Billno" />

        </label>
        <input id="billno${pageId}"  name="billno" disabled="true"  value="${yzmtdhInstance?.billno}">

    </span>

    <span id="divbilldate${pageId}" class="fieldcontain  ">
        <label for="billdate${pageId}" class="required">
            <g:message code="yzmtdh.billdate.label" default="Billdate" />
        </label>
        <input name="billdate" id="billdate${pageId}" class="easyui-datebox" value="${yzmtdhInstance?.billdate?.getTime()}" date />
    </span>




%{--客户提单号--}%
    <span id="divkhtdh${pageId}" class="fieldcontain  ">
        <label for="khtdh${pageId}">
            <g:message code="yzmtdh.khtdh.label" default="Khtdh" />

        </label>
        <g:textField id="khtdh${pageId}" class="easyui-validatebox" name="khtdh" value="${yzmtdhInstance?.khtdh}"/>

    </span>

    %{--转卖类型--}%
    <span id="divzmlx${pageId}" class="fieldcontain  ">
        <label for="zmlx${pageId}" class="required">
            <g:message code="yzmtdh.zmlx.label" default="Zmlx" />

        </label>
    <input id="zmlx${pageId}" value="${yzmtdhInstance?.zmlx?:0}" name="zmlx"   class="easyui-combobox " data-options="onChange:zmlx${pageId} ,panelHeight:'auto',editable:false,valueField:'index',textField:'value',data:[{index:0,value:'提货权转卖'},{index:1,value:'货权转卖'},{index:2,value:'不可撤销转卖'}]">
  </span>

    %{--通知方式--}%
    <span id="divtzfs${pageId}" class="fieldcontain  " >
        <label for="tzfs${pageId}" class="required">
            <g:message code="yzmtdh.tzfs.label" default="Tzfs" />
        </label>

        <input id="tzfs${pageId}" name="tzfs" value="${yzmtdhInstance?.tzfs}" class="easyui-combobox"
               data-options="panelHeight:'auto',editable:false,valueField:'index',textField:'value',data:[{index:'fax',value:'传真件提货'},{index:'sw',value:'商务确认单证'},{index:'yj',value:'提货单原件'}]">


    </span>

    %{--Email 已确认--}%
    <span id="divyjqr${pageId}" class="fieldcontain  ">
        <label for="yjqr${pageId}">
            <g:message code="yzmtdh.yjqr.label" default="Yjqr" />

        </label>
        <g:checkBox name="yjqr" id="yjqr${pageId}" class="checkbox" value="${yzmtdhInstance?.yjqr}" />

    </span>

    %{--有效日期--}%
    <span id="divyxrq${pageId}" class="fieldcontain  ">
        <label for="yxrq${pageId}" class="required">
            <g:message code="yzmtdh.yxrq.label" default="Yxrq" />

        </label>

        <input id="yxrq${pageId}" name="yxrq" type="text" date class="easyui-datebox" required="" value="${yzmtdhInstance?.yxrq?.getTime()}">
    </span>



<p >转出方信息</p>

    <span id="divzcdw${pageId}" class="fieldcontain  ">
        <label for="zcdw${pageId}" class="required">
            <g:message code="yzmtdh.zcdw.label" default="Zcdw" />
        </label>
        <g:refTemplate code="refBdCumandoc" model="[id:'zcdw',name:'zcdw.id',value:yzmtdhInstance?.zcdw?.id,required:true]" ></g:refTemplate>
    </span>

    <span id="divhw${pageId}" class="fieldcontain  ">
        <label for="hw${pageId}" class="required" >
            <g:message code="yzmtdh.hw.label" default="Hw" />

        </label>
       <g:refTemplate code="refBdInvmandoc" model="[id:'hw',name:'hw.id',value:yzmtdhInstance?.hw?.id ,required:true]"></g:refTemplate>
    </span>


    <span id="divtdsl${pageId}" class="fieldcontain  ">
        <label for="tdsl" class="required">
            <g:message code="yzmtdh.tdsl.label" default="Tdsl" />

        </label>

        <input type="text" id="tdsl" name="tdsl" class="easyui-numberbox" value="${yzmtdhInstance?.tdsl}" data-options="onChange:tdsl${pageId},precision:2"  required="true">
    </span>

    <span id="divszsl${pageId}" class="fieldcontain  ">
    <label for="szsl${pageId}" class="required">
        <g:message code="yzmtdh.szsl.label" default="Szsl" />

    </label>
    <input type="text" name="szsl" id="szsl${pageId}" class="easyui-numberbox disabled"  data-options="precision:4" value="${yzmtdhInstance?.szsl}" readonly="" required="true">

</span>



<p >转入方信息</p>


    %{--转入提货单位--}%
    <span id="divzrdw${pageId}" class="fieldcontain  ">
        <label for="zrdw${pageId}" class="required">
            <g:message code="yzmtdh.zrdw.label" default="Zrdw" />

        </label>
        <g:refTemplate code="refBdCumandoc" model="[id:'zrdw',name:'zrdw.id',value:yzmtdhInstance?.zrdw?.id,required:true,onChange:'zrdw'+pageId]"></g:refTemplate>
    </span>
    %{--是否提货方付仓储费--}%
    <span id="divsfthffccf${pageId}" class="fieldcontain  ">
        <label for="sfthffccf" >
            <g:message code="yzmtdh.sfthffccf.label" default="Sfthffccf" />

        </label>
        <g:checkBox name="sfthffccf" value="${yzmtdhInstance?.sfthffccf}"  />

    </span>



%{--货权转让 类型 字段--}%

<span id="spanzrht${pageId}" class="fieldcontain  ">
    <label for="zrht${pageId}" class="required">
        <g:message code="yzmtdh.zrht.label" default="转入合同" />

    </label>

   <g:refTemplate code="refYZMContract" model="[id:'zrht',name: 'zrht.id',value:yzmtdhInstance?.zrht?.id,onBeforeLoad:'zrht_bf'+pageId ]"></g:refTemplate>

</span>
<span id="spanzrpc${pageId}" class="fieldcontain  ">
    <label for="zrpc${pageId}">
        <g:message code="yzmtdh.zrpc.label" default="转入批次" />

    </label>
    <input id="zrpc${pageId}" name="zrpc" value="${yzmtdhInstance?.zrpc}" class="myui">

</span>
<span id="spanzrfcdsh${pageId}" class="fieldcontain  ">
    <label for="zrfcdsh${pageId}">
        <g:message code="yzmtdh.zrfcdsh.label" default="转入方承担损耗" />

    </label>
    <g:checkBox name="zrfcdsh" value="${yzmtdhInstance?.zrfcdsh}"></g:checkBox>
</span>



<p>其他信息</p>


    %{--代收货款--}%
    <span id="divdshk${pageId}" class="fieldcontain  ">
        <label for="dshk">
            <g:message code="yzmtdh.dshk.label" default="Dshk" />

        </label>
        <g:checkBox name="dshk" class="checkbox" value="${yzmtdhInstance?.dshk}" />

    </span>

    %{--货物单价--}%
    <span id="divhwdj${pageId}" class="fieldcontain  ">
        <label for="hwdj">
            <g:message code="yzmtdh.hwdj.label" default="Hwdj" />

        </label>

    <input type="text" name="hwdj" id="hwdj" class="easyui-numberbox" data-options="precision:2" value="${yzmtdhInstance?.hwdj}" >
    </span>

    %{--付款方式--}%
    <span id="divjsfs${pageId}" class="fieldcontain  ">
        <label for="jsfs${pageId}">
            <g:message code="yzmtdh.jsfs.label" default="Jsfs" />

        </label>
        <g:refTemplate code="refBdBalatype" model="[id:'jsfs',name:'jsfs.id',value:yzmtdhInstance?.jsfs?.id]" ></g:refTemplate>

</span>

    %{--提货通知手机--}%
    <span id="divthtzsj${pageId}" class="fieldcontain  ">
        <label for="thtzsj">
            <g:message code="yzmtdh.thtzsj.label" default="Thtzsj" />

        </label>
        <g:textField class="easyui-validatebox myui" name="thtzsj" value="${yzmtdhInstance?.thtzsj}"/>

    </span>

    %{--是否已收取原件--}%
    <span id="divsfysqyj${pageId}" class="fieldcontain  ">
        <label for="sfysqyj">
            <g:message code="yzmtdh.sfysqyj.label" default="Sfysqyj" />

        </label>

        <g:checkBox name="sfysqyj" class="checkbox" value="${yzmtdhInstance?.sfysqyj}"></g:checkBox>
    </span>
    %{--收取时间--}%
    <span id="divsqsj${pageId}" class="fieldcontain  ">
        <label for="sqsj">
            <g:message code="yzmtdh.sqsj.label" default="Sqsj" />

        </label>

        <input id="sqsj" name="sqsj" type="text" class="easyui-datebox" >
</span>

    %{--接收人--}%
    <span id="divjsr${pageId}" class="fieldcontain  ">
        <label for="jsr${pageId}">
            <g:message code="yzmtdh.jsr.label" default="Jsr" />

        </label>
        <g:refTemplate code="refBdPsndoc" model="[id:'jsr',name: 'jsr.id',value:yzmtdhInstance?.jsr?.id]"></g:refTemplate>
    </span>
%{--接受描述--}%
    <span id="divjsms${pageId}" class="fieldcontain  ">
        <label for="jsms">
            <g:message code="yzmtdh.jsms.label" default="Jsms" />

        </label>
        <g:textField  name="jsms" class="myui"  value="${yzmtdhInstance?.jsms}"/>

    </span>







    <span id="divmaker${pageId}" class="fieldcontain  ">
        <label for="maker${pageId}">
            <g:message code="yzmtdh.maker.label" default="Maker" />

        </label>
       <g:hiddenField name="maker.id" value="${yzmtdhInstance?.maker?.id}"></g:hiddenField>
       <input name="maker" id="maker${pageId}"  canSave="false" value="${yzmtdhInstance?.maker?.userRealName}" disabled="">
    </span>

    <span id="divmakeDate${pageId}" class="fieldcontain  ">
        <label for="makeDate${pageId}">
            <g:message code="yzmtdh.makeDate.label" default="Make Date" />

        </label>
        <g:hiddenField name="makeDate" value="${yzmtdhInstance?.makeDate?.getTime()}"></g:hiddenField>
        <input name="makeDate_" id="makeDate_${pageId}"   value="${yzmtdhInstance?.makeDate?.getTime()}" date disabled=""/>
    </span>

    <span id="divchecker${pageId}" class="fieldcontain  ">
        <label for="checker${pageId}">
            <g:message code="yzmtdh.checker.label" default="Checker" />

        </label>
              <input name="checker" id="checker${pageId}"   canSave="false" value="${yzmtdhInstance?.checker?.userRealName}" disabled="true">
    </span>

    <span id="divcheckDate${pageId}" class="fieldcontain  ">
        <label for="checkDate${pageId}">
            <g:message code="yzmtdh.checkDate.label" default="Check Date" />

        </label>
        <g:hiddenField name="checkDate" value="${yzmtdhInstance?.checkDate?.getTime()}"></g:hiddenField>
        <input name="checkDate" id="checkDate${pageId}"   canSave="false" value="${yzmtdhInstance?.checkDate?.getTime()}" date  disabled=""/>

    </span>



<span id="divbdCorp${pageId}" class="fieldcontain  ">
    <label for="bdCorp${pageId}" >
        <g:message code="yzmtdh.bdCorp.label" default="Bd Corp" />

    </label>
   <input id="bdCorp${pageId}"  canSave="false"   value="${yzmtdhInstance?.bdCorp?.unitName}" disabled="true">
</span>