<script>
    function htsh${pageId}(newValue,oldValue){
        var htsh=Number(newValue);
        var sjsl=$('#sjsl${pageId}').numberbox('getValue');
        if(isNaN(htsh)){
            htsh=0;
        }
        if(isNaN(sjsl)){
            sjsl=0;
        }
        var zcfhl=sjsl*(1-htsh);
        $('#zcfhl${pageId}').numberbox('setValue',zcfhl);

        $('#zdfhl${pageId}').numberbox('setValue',zcfhl);

    }

    function _sjsl${pageId}(newValue,oldValue){

        var sjsl=Number(newValue);
        var htsh=$('#htsh${pageId}').numberbox('getValue');
        if(isNaN(htsh)){
            htsh=0;
        }
        var zcfhl=sjsl*(1-htsh);
        $('#zcfhl${pageId}').numberbox('setValue',zcfhl);

        $('#zdfhl${pageId}').numberbox('setValue',zcfhl);
    }
</script>



<%@ page import="com.app.ywms.rk.xhqrd.Yxhqrd" %>

<g:hiddenField name="id" value="${yxhqrdInstance?.id}" />
<g:hiddenField name="version" value="${yxhqrdInstance?.version}" />
<g:hiddenField name="businessType.id" value="${yxhqrdInstance?.businessType?.id}"/>
<g:hiddenField name="billTypeCode" value="${yxhqrdInstance?.billTypeCode}" ></g:hiddenField>
<g:hiddenField name="billtype.id" value="${yxhqrdInstance?.billtype?.id}" ></g:hiddenField>
<g:hiddenField name="sourceBid" value="${yxhqrdInstance?.sourceBid}" ></g:hiddenField>
<g:hiddenField name="sourceHid" value="${yxhqrdInstance?.sourceHid}" ></g:hiddenField>
<g:hiddenField name="sourceBillCode" value="${yxhqrdInstance?.sourceBillCode}" ></g:hiddenField>
<g:hiddenField name="sourceBillType.id" value="${yxhqrdInstance?.sourceBillType?.id}" ></g:hiddenField>
<g:hiddenField name="sourceBillTypeCode" value="${yxhqrdInstance?.sourceBillTypeCode}" ></g:hiddenField>


<p>客户航次基本信息</p>
<hr>

    <span  class="fieldcontain  ">
        <label for="businessType${pageId}">
            <g:message code="yxhqrd.businessType.label" default="Tsjc" />

        </label>
        <input  id="businessType${pageId}"  class="myui" value="${yxhqrdInstance?.businessType.name}" disabled="" />

    </span>
    <span  class="fieldcontain  ">
        <label for="billno${pageId}">
            <g:message code="yxhqrd.billNo.label" default="billno" />

        </label>
        <input id="billno${pageId}" name="billno" class="myui" value="${yxhqrdInstance?.billno}" disabled=""/>

    </span>
    <span   class="fieldcontain  ">
        <label for="billdate${pageId}">
            <g:message code="yxhqrd.billdate.label" default="billdate" />

        </label>
        <input name="billdate" id="billdate${pageId}" class="easyui-datebox" value="${yxhqrdInstance?.billdate?.getTime()}"  date/>

    </span>

    <span id="divtsjc${pageId}" class="fieldcontain  ">
        <label for="tsjc${pageId}">
            <g:message code="yxhqrd.tsjc.label" default="Tsjc" />

        </label>
        <g:hiddenField name="tsjc" value="${yxhqrdInstance?.tsjc}"></g:hiddenField>
        <g:checkBox id="tsjc${pageId}" class="disabled" name="tsjc" value="${yxhqrdInstance?.tsjc}" disabled=""/>

    </span>

    <span id="divzgzf${pageId}" class="fieldcontain  ">
        <label for="zgzf${pageId}">
            <g:message code="yxhqrd.zgzf.label" default="Zgzf" />

        </label>
        <g:hiddenField name="zgzf" value="${yxhqrdInstance?.zgzf}"></g:hiddenField>
        <g:checkBox class="checkbox" id="zgzf${pageId}" name="zgzf" value="${yxhqrdInstance?.zgzf}" disabled=""/>

    </span>

    <span id="divbs${pageId}" class="fieldcontain  ">
        <label for="bs${pageId}">
            <g:message code="yxhqrd.bs.label" default="Bs" />

        </label>
        <g:hiddenField name="bs" value="${yxhqrdInstance?.bs}"></g:hiddenField>
        <g:checkBox class="checkbox" id="bs${pageId}" name="bs" value="${yxhqrdInstance?.bs}" disabled=""/>

    </span>

    <span id="divship${pageId}" class="fieldcontain  ">
        <label for="ship${pageId}">
            <g:message code="yxhqrd.ship.label" default="Ship" />

        </label>
        <g:hiddenField name="ship.id" value="${yxhqrdInstance?.ship?.id}"></g:hiddenField>
        <input id="ship${pageId}"  value="${yxhqrdInstance?.ship?.shipname}" disabled="">

    </span>

    <span id="divhc${pageId}" class="fieldcontain  ">
        <label for="hc">
            <g:message code="yxhqrd.hc.label" default="Hc" />

        </label>
        <g:textField class="easyui-validatebox " name="hc" value="${yxhqrdInstance?.hc}" disabled=""/>

    </span>

    <span id="divdgsj${pageId}" class="fieldcontain  ">
        <label for="dgsj${pageId}">
            <g:message code="yxhqrd.dgsj.label" default="Dgsj" />

        </label>
        <input id="dgsj${pageId}" name="dgsj" class="easyui-datebox" date value="${yxhqrdInstance?.dgsj?.getTime()}"/>

    </span>
    <span id="divbdCumandoc${pageId}" class="fieldcontain  ">
        <label for="bdCumandoc${pageId}">
            <g:message code="yxhqrd.bdCumandoc.label" default="Bd Cumandoc" />

        </label>
        <g:hiddenField name="bdCumandoc.id" value="${yxhqrdInstance?.bdCumandoc?.id}"></g:hiddenField>
        <input id="bdCumandoc${pageId}" disabled="" value="${yxhqrdInstance?.bdCumandoc?.pkCubasdoc?.custname}">

    </span>

    <span id="divjgrq${pageId}" class="fieldcontain  ">
        <label for="jgrq${pageId}" class="required">
            <g:message code="yxhqrd.jgrq.label" default="Jgrq" />

        </label>
        <input id="jgrq${pageId}" name="jgrq" class="easyui-datebox" required="" date value="${yxhqrdInstance?.jgrq?.getTime()}"/>

    </span>

    <span id="divbdInvmandoc${pageId}" class="fieldcontain  ">
        <label for="bdInvmandoc${pageId}">
            <g:message code="yxhqrd.bdInvmandoc.label" default="Bd Invmandoc" />

        </label>
        <g:hiddenField name="bdInvmandoc.id" value="${yxhqrdInstance?.bdInvmandoc?.id}"></g:hiddenField>
        <input id="bdInvmandoc${pageId}" value="${yxhqrdInstance?.bdInvmandoc?.pkInvbasdoc?.invname}" disabled="">

    </span>
    <span id="divmyxz${pageId}" class="fieldcontain  ">
        <label for="myxz${pageId}">
            <g:message code="yxhqrd.myxz.label" default="Myxz" />

        </label>
        <g:select disabled="" name="myxz" id="myxz${pageId}" from="${[[index:0,value:'内贸'],[index:1,value:'外贸']]}" optionKey="index" optionValue="value" value="${yxhqrdInstance?.myxz}"></g:select>

    </span>

    <span id="divcontract${pageId}" class="fieldcontain  ">
        <label for="contract${pageId}">
            <g:message code="yxhqrd.contract.label" default="Contract" />

        </label>
        <g:hiddenField name="contract.id" value="${yxhqrdInstance?.contract?.id}"></g:hiddenField>
        <input id="contract${pageId}" value="${yxhqrdInstance?.contract?.contractNo}" disabled="">
          </span>

    <span id="divhtpch${pageId}" class="fieldcontain  ">
        <label for="htpch${pageId}">
            <g:message code="yxhqrd.htpch.label" default="Htpch" />

        </label>
        <g:textField id="htpch${pageId}" class="disabled" name="htpch" value="${yxhqrdInstance?.htpch}" readonly="" />
    </span>
    <span id="divcgsl${pageId}" class="fieldcontain  ">
        <label for="cgsl${pageId}">
            <g:message code="yxhqrd.cgsl.label" default="Cgsl" />

        </label>

        <input id="cgsl${pageId}" name="cgsl" value="${yxhqrdInstance?.cgsl}" class="easyui-numberbox" data-options="precision:2" disabled=""/>

    </span>

    <span id="divcddw${pageId}" class="fieldcontain  ">
        <label for="cddw${pageId}">
            <g:message code="yxhqrd.cddw.label" default="Cddw" />

        </label>
        <g:refTemplate code="refBdCustomer" model="[id:'cddw',name:'cddw.id',value:yxhqrdInstance?.cddw?.id]"></g:refTemplate>

    </span>

    <span id="divhgfx${pageId}" class="fieldcontain  ">
        <label for="hgfx${pageId}">
            <g:message code="yxhqrd.hgfx.label" default="Hgfx" />

        </label>
        <g:select disabled="" name="hgfx" id="hgfx${pageId}" from="${[[index:0,value:'未放行'],[index:1,value:'已放行']]}" optionKey="index" optionValue="value" value="${yxhqrdInstance?.hgfx}"></g:select>

    </span>
    <span id="divfxsl${pageId}" class="fieldcontain  ">
        <label for="fxsl${pageId}">
            <g:message code="yxhqrd.fxsl.label" default="Fxsl" />

        </label>
        <input name="fxsl" id="fxsl${pageId}" value="${yxhqrdInstance?.fxsl}" class="easyui-numberbox" data-options="precision:2" disabled=""/>

    </span>

    <span id="divkzdw${pageId}" class="fieldcontain  ">
        <label for="kzdw${pageId}">
            <g:message code="yxhqrd.kzdw.label" default="Kzdw" />

        </label>
        <g:hiddenField name="kzdw.id" value="${yxhqrdInstance?.kzdw?.id}"></g:hiddenField>
        <input id="kzdw${pageId}"  value="${yxhqrdInstance?.kzdw?.pkCubasdoc?.custname}" disabled="">

    </span>

    <span id="divkzfx${pageId}" class="fieldcontain  ">
        <label for="kzfx">
            <g:message code="yxhqrd.kzfx.label" default="Kzfx" />

        </label>
        <g:select name="kzfx" id="kzfx${pageId}" disabled="" from="${[[index:0,value:'未放行'],[index:1,value:'已放行']]}" optionKey="index" optionValue="value" value="${yxhqrdInstance?.kzfx}"></g:select>

    </span>
    <span id="divkzfxsl${pageId}" class="fieldcontain  ">
        <label for="kzfxsl${pageId}">
            <g:message code="yxhqrd.kzfxsl.label" default="Kzfxsl" />

        </label>
        <input id="kzfxsl${pageId}" name="kzfxsl" disabled="" value="${yxhqrdInstance?.kzfxsl}" class="easyui-numberbox" data-options="precision:2"/>

    </span>




<p>客户数量确认</p>
<hr>
<span id="divxdtsl${pageId}" class="fieldcontain  ">
    <label for="xdtsl${pageId}">
        <g:message code="yxhqrd.xdtsl.label" default="Xdtsl" />

    </label>

    <input id="xdtsl${pageId}" name="xdtsl" value="${ yxhqrdInstance?.xdtsl}" class="easyui-numberbox" data-options="precision:2">
</span>

<span id="divgjsl${pageId}" class="fieldcontain  ">
    <label for="gjsl${pageId}">
        <g:message code="yxhqrd.gjsl.label" default="Gjsl" />

    </label>

    <input id="gjsl${pageId}" name="gjsl" value="${ yxhqrdInstance?.gjsl}" readonly="" class="easyui-numberbox disabled" data-options="precision:2">
</span>

<span id="divcjsl${pageId}" class="fieldcontain  ">
    <label for="cjsl${pageId}">
        <g:message code="yxhqrd.cjsl.label" default="Cjsl" />

    </label>
    <input id="cjsl${pageId}" name="cjsl" value="${ yxhqrdInstance?.cjsl}" class="easyui-numberbox disabled" readonly="" data-options="precision:2">

</span>
<span id="divsjsl${pageId}" class="fieldcontain  ">
    <label for="sjsl${pageId}" class="required">
        <g:message code="yxhqrd.sjsl.label" default="Sjsl" />

    </label>
    <input id="sjsl${pageId}" name="sjsl" required="" value="${fieldValue(bean: yxhqrdInstance, field: 'sjsl')}" class="easyui-numberbox disabled" disabled=""  data-options="precision:3,onChange:_sjsl${pageId}" />

</span>

<span id="divhtsh${pageId}" class="fieldcontain  ">
    <label for="htsh${pageId}">
        <g:message code="yxhqrd.htsh.label" default="Htsh" />

    </label>
    <input id="htsh${pageId}" name="htsh" value="${yxhqrdInstance?.htsh}" class="easyui-numberbox" data-options="precision:4,max:1,min:0,onChange:htsh${pageId}" />

</span>

<span id="divzcfhl${pageId}" class="fieldcontain  ">
    <label for="zcfhl${pageId}">
        <g:message code="yxhqrd.zcfhl.label" default="Zcfhl" />

    </label>
    <input id="zcfhl${pageId}" name="zcfhl" value="${ yxhqrdInstance?.zcfhl}" readonly="" class="easyui-numberbox disabled" data-options="precision:4"/>

</span>
<span id="divbgsh${pageId}" class="fieldcontain  ">
    <label for="bgsh${pageId}">
        <g:message code="yxhqrd.bgsh.label" default="Bgsh" />

    </label>
    <input id="bgsh${pageId}" name="bgsh" value="${yxhqrdInstance?.bgsh}" class="easyui-numberbox" data-options="precision:4,max:1,min:0"/>

</span>

<span id="divzdfhl${pageId}" class="fieldcontain  ">
    <label for="zdfhl${pageId}">
        <g:message code="yxhqrd.zdfhl.label" default="Zdfhl" />

    </label>
    <input id="zdfhl${pageId}" name="zdfhl" value="${ yxhqrdInstance?.zdfhl}" required=""  class="easyui-numberbox" data-options="precision:4"/>

</span>

<span id="divsjdw${pageId}" class="fieldcontain  ">
    <label for="sjdw${pageId}">
        <g:message code="yxhqrd.sjdw.label" default="Sjdw" />

    </label>
    <g:refTemplate code="refBdCustomer" model="[id:'sjdw',name:'sjdw.id',value:yxhqrdInstance?.sjdw?.id]"></g:refTemplate>

</span>
<span id="divsjzsh${pageId}" class="fieldcontain  ">
    <label for="sjzsh${pageId}">
        <g:message code="yxhqrd.sjzsh.label" default="Sjzsh" />

    </label>
    <g:textField id="sjzsh${pageId}"  name="sjzsh" value="${yxhqrdInstance?.sjzsh}"/>

</span>

<span id="divqrrq${pageId}" class="fieldcontain  ">
    <label for="qrrq${pageId}">
        <g:message code="yxhqrd.qrrq.label" default="Qrrq" />

    </label>
    <input id="qrrq${pageId}" name="qrrq" class="easyui-datebox" date value="${yxhqrdInstance?.qrrq?.getTime()}"/>

</span>

<span id="divhytdh${pageId}" class="fieldcontain  ">
    <label for="hytdh${pageId}">
        <g:message code="yxhqrd.hytdh.label" default="Hytdh" />

    </label>
    <g:textField id="hytdh${pageId}" class="easyui-validatebox myui" name="hytdh" value="${yxhqrdInstance?.hytdh}"/>

</span>
<span id="divxghth${pageId}" class="fieldcontain  ">
    <label for="xghth${pageId}">
        <g:message code="yxhqrd.xghth.label" default="Xghth" />

    </label>

    <g:textField  id="xghth${pageId}"  name="xghth" value="${yxhqrdInstance?.xghth}"/>

</span>

<span id="divxtdh${pageId}" class="fieldcontain  ">
    <label for="xtdh${pageId}">
        <g:message code="yxhqrd.xtdh.label" default="Xtdh" />

    </label>
    <g:textField id="xtdh${pageId}" class="easyui-validatebox myui" name="xtdh" value="${yxhqrdInstance?.xtdh}"/>

</span>


<span id="divkhtdh${pageId}" class="fieldcontain  ">
    <label for="khtdh${pageId}">
        <g:message code="yxhqrd.khtdh.label" default="Khtdh" />

    </label>
    <g:textField id="khtdh${pageId}" class="easyui-validatebox" name="khtdh" value="${yxhqrdInstance?.khtdh}"/>

</span>

<span id="divtdsl${pageId}" class="fieldcontain  ">
    <label for="tdsl${pageId}">
        <g:message code="yxhqrd.tdsl.label" default="Tdsl" />

    </label>
    <g:textField id="tdsl${pageId}" class="easyui-numberbox" disabled="" name="tdsl" data-options="precision:2" value="${yxhqrdInstance?.tdsl}"/>

</span>

<span id="divgj${pageId}" class="fieldcontain  ">
    <label for="gj${pageId}">
        <g:message code="yxhqrd.gj.label" default="Gj" />

    </label>
    <input id="gj${pageId}" name="gj" value="${yxhqrdInstance?.gj}" >

</span>
<span id="divgz${pageId}" class="fieldcontain  ">
    <label for="gz${pageId}">
        <g:message code="yxhqrd.gz.label" default="Gz" />

    </label>
    <input id="gz${pageId}" name="gz" value="${yxhqrdInstance?.gz}" >

</span>

<span id="divsdyy${pageId}" class="fieldcontain  ">
    <label for="sdyy${pageId}">
        <g:message code="yxhqrd.sdyy.label" default="Sdyy" />

    </label>
    <g:textField class="easyui-validatebox disabled" id="sdyy${pageId}" name="sdyy" readonly="" value="${yxhqrdInstance?.sdyy}"/>

</span>

<span id="divsdsl${pageId}" class="fieldcontain  ">
    <label for="sdsl${pageId}">
        <g:message code="yxhqrd.sdsl.label" default="Sdsl" />

    </label>
    <input name="sdsl" id="sdsl${pageId}" value="${yxhqrdInstance?.sdsl}" class="easyui-numberbox disabled" readonly="" data-options="precision:3"/>

</span>
<span id="divnote${pageId}" class="fieldcontain  ">
    <label for="note${pageId}">
        <g:message code="yxhqrd.note.label" default="Note" />

    </label>
    <g:textField id="note${pageId}" class="easyui-validatebox myui" name="note" value="${yxhqrdInstance?.note}"/>

</span>


<p>结算信息</p>
<hr>
<span id="divjsfy${pageId}" class="fieldcontain  ">
    <label for="jsfy${pageId}">
        <g:message code="yxhqrd.jsfy.label" default="Jsfy" />

    </label>
    <g:checkBox name="jsfy" id="jsfy${pageId}" class="checkbox"  value="${yxhqrdInstance?.jsfy}" disabled=""/>

</span>

<span id="divccfdj${pageId}" class="fieldcontain  ">
    <label for="ccfdj${pageId}">
        <g:message code="yxhqrd.ccfdj.label" default="Ccfdj" />

    </label>
    <input id="ccfdj${pageId}" name="ccfdj" value="${yxhqrdInstance?.ccfdj}" class="easyui-numberbox" data-options="precision:2" disabled=""/>

</span>

<span id="divzxfdj${pageId}" class="fieldcontain  ">
    <label for="zxfdj${pageId}">
        <g:message code="yxhqrd.zxfdj.label" default="Zxfdj" />

    </label>
    <input name="zxfdj" id="zxfdj${pageId}" value="${yxhqrdInstance?.zxfdj}" class="easyui-numberbox" data-options="precision:2" disabled=""/>

</span>
<span id="divsqts${pageId}" class="fieldcontain  ">
    <label for="sqts${pageId}">
        <g:message code="yxhqrd.sqts.label" default="Sqts" />

    </label>
    <input  id="sqts${pageId}" name="sqts" value="${yxhqrdInstance?.sqts}" class="easyui-numberbox" data-options="precision:2" disabled=""/>

</span>

<span id="divccfzq${pageId}" class="fieldcontain  ">
    <label for="ccfzq${pageId}">
        <g:message code="yxhqrd.ccfzq.label" default="Ccfzq" />

    </label>
    <input id="ccfzq${pageId}" name="ccfzq" value="${ yxhqrdInstance?.ccfzq}" class="easyui-numberbox" data-options="precision:2" disabled=""/>

</span>

<span id="divcqksrq${pageId}" class="fieldcontain  ">
    <label for="cqksrq${pageId}">
        <g:message code="yxhqrd.cqksrq.label" default="Cqksrq" />

    </label>
    <input id="cqksrq${pageId}" name="cqksrq"   date value="${yxhqrdInstance?.cqksrq?.getTime()}" disabled="" >

</span>
<span id="divcqdj${pageId}" class="fieldcontain  ">
    <label for="cqdj${pageId}">
        <g:message code="yxhqrd.cqdj.label" default="Cqdj" />

    </label>
    <input id="cqdj${pageId}" name="cqdj" value="${yxhqrdInstance?.cqdj}" class="easyui-numberbox" data-options="precision:2" disabled=""/>

</span>

<span id="divcsksr${pageId}" class="fieldcontain  ">
    <label for="csksr${pageId}">
        <g:message code="yxhqrd.csksr.label" default="Csksr" />

    </label>
    <input id="csksr${pageId}" name="csksr"  date value="${yxhqrdInstance?.csksr?.getTime()}" disabled="">

</span>

<span id="divcszq${pageId}" class="fieldcontain  ">
    <label for="cszq${pageId}">
        <g:message code="yxhqrd.cszq.label" default="Cszq" />

    </label>
    <input id="cszq${pageId}"  value="${yxhqrdInstance?.cszq}" class="easyui-numberbox" data-options="precision:2" disabled=""/>

</span>


<p>其他</p>
<hr>
<span   class="fieldcontain  ">
    <label for="maker${pageId}">
        <g:message code="yxhqrd.maker.label" default="maker" />

    </label>
    <input type="hidden" value="${yxhqrdInstance?.maker?.id}">
    <input id="maker${pageId}" value="${yxhqrdInstance?.maker?.userRealName}" class="myui" disabled=""/>

</span>
<span   class="fieldcontain  ">
    <label for="makeDate${pageId}">
        <g:message code="yxhqrd.makeDate.label" default="makeDate" />

    </label>
    <input id="makeDate" type="hidden"  value="${yxhqrdInstance?.makeDate?.getTime()}"   date disabled="">
    <input id="makeDate${pageId}"  value="${yxhqrdInstance?.makeDate?.getTime()}"   date disabled="">

</span>
<span  class="fieldcontain  ">
    <label for="checker${pageId}">
        <g:message code="yxhqrd.checker.label" default="checker" />

    </label>
    <input id="checker${pageId}" value="${yxhqrdInstance?.checker?.userRealName}" disabled="" class="myui"/>

</span>
<span   class="fieldcontain  ">
    <label for="checkDate${pageId}">
        <g:message code="yxhqrd.checkDate.label" default="checkDate" />

    </label>
    <input id="checkDate${pageId}" name="checkDate" value="${yxhqrdInstance?.checkDate?.getTime()}" date disabled=""/>

</span>
