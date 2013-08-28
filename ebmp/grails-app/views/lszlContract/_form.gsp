<%@ page import="com.app.ywms.contract.BaseContract" %>

<g:hiddenField name="id" value="${lszlContractInstance?.id}" />
<g:hiddenField name="version" value="${lszlContractInstance?.version}" />


<p style="color:red">基本信息</p>
<hr>
<span id="divcontractNo${pageId}" class="fieldcontain  ">
    <label for="contractNo">
        <g:message code="baseContract.contractNo.label" default="Contract No" />

    </label>
    <g:textField class="easyui-validatebox myui" name="contractNo" value="${lszlContractInstance?.contractNo}" readonly=""/>
</span>

<span id="divcontrantNo2${pageId}" class="fieldcontain  ">
    <label for="contrantNo2">
        <g:message code="baseContract.contractNo2.label" default="Contrant No2" />

    </label>
    <g:textField class="easyui-validatebox myui" name="contractNo2" value="${lszlContractInstance?.contractNo2}"/>
</span>

<span id="divsignDate${pageId}" class="fieldcontain  ">
    <label for="signDate">
        <g:message code="baseContract.signDate.label" default="Sign Date" />
        <span class="required-indicator">*</span>
    </label>
    <input id="signDate" name="signDate" date  value="${lszlContractInstance?.signDate?.getTime()}" class="easyui-datebox"  required="true">
</span>
<span id="divendDate${pageId}" class="fieldcontain  ">
    <label for="endDate">
        <g:message code="baseContract.endDate.label" default="End Date" />
        <span class="required-indicator">*</span>
    </label>
    <input id="endDate" name="endDate" date  value="${lszlContractInstance?.endDate?.getTime()}" class="easyui-datebox"  required="true">
</span>


<span id="divbdCumandoc${pageId}" class="fieldcontain  ">
    <label for="bdCumandoc">
        <g:message code="baseContract.bdCumandoc.label" default="Bd Cumandoc" />
        <span class="required-indicator">*</span>
    </label>
    <g:refTemplate id="bdCumandoc" code="refBdCustomer" model="[id:'bdCumandoc',name:'bdCumandoc.id',value:lszlContractInstance?.bdCumandoc?.id,required:true]"></g:refTemplate>
</span>


<span id="divsignAddress${pageId}" class="fieldcontain  ">
    <label for="signAddress">
        <g:message code="baseContract.signAddress.label" default="Sign Address" />

    </label>
    <g:textField class="easyui-validatebox myui" name="signAddress" value="${lszlContractInstance?.signAddress}"/>
</span>
<span id="divcontractescribe${pageId}" class="fieldcontain  ">
    <label for="contractescribe">
        <g:message code="baseContract.contractescribe.label" default="Contractescribe" />

    </label>
    <g:textField class="easyui-validatebox myui" name="contractescribe" value="${lszlContractInstance?.contractescribe}" />
</span>

<p style="color: red">货物情况</p>
<hr>
<span id="divbdInvmandoc${pageId}" class="fieldcontain  ">
    <label for="bdInvmandoc">
        <g:message code="baseContract.bdInvmandoc.label" default="Bd Invmandoc" />
        <span class="required-indicator">*</span>
    </label>
    <g:refTemplate id="bdInvmandoc" code="refBdInvmandoc" model="[id:'bdInvmandoc',name:'bdInvmandoc.id',value:lszlContractInstance?.bdInvmandoc?.id]" required="true"></g:refTemplate>
</span>

<span id="divcheckType${pageId}" class="fieldcontain  ">
    <label for="checkType">
        <g:message code="baseContract.checkType.label" default="Check Type" />
        <span class="required-indicator">*</span>
    </label>
    <g:select name="checkType" from="${[[index:0,value:'罐检方式'],[index:1,value:'穿检方式']]}" optionValue="value" optionKey="index" noSelection="['':'-请选择数量验收方式-']" value="${lszlContractInstance.checkType}" required="true"></g:select>
</span>

<span id="divgh${pageId}" class="fieldcontain  ">
    <label for="gh${pageId}">
        <g:message code="baseContract.gh.label" default="Gh" />

    </label>
    <g:refTemplate code="refYBdTank" model="[id:'gh',name:'gh.id',value:lszlContractInstance?.gh?.id]"></g:refTemplate>

</span>
<span id="divmyfs${pageId}" class="fieldcontain  ">
    <label for="myfs">
        <g:message code="baseContract.myfs.label" default="Myfs" />
        <span class="required-indicator">*</span>
    </label>
    <g:select name="myfs" from="${[[index:0,value:'内贸'],[index:1,value:'外贸'],[index:2,value:'内、外贸']]}" optionKey="index" optionValue="value" value="${lszlContractInstance?.myfs}" noSelection="['':'-请选择贸易方式-']"  required="true"></g:select>
</span>

<span id="divcm${pageId}" class="fieldcontain  ">
    <label for="cm${pageId}">
        <g:message code="baseContract.cm.label" default="Cm" />

    </label>
    <g:refTemplate code="refYshipdoc" model="[id:'cm',name:'cm.id',value:lszlContractInstance?.cm?.id]"></g:refTemplate>

</span>

<span id="divyjdgrq${pageId}" class="fieldcontain  ">
    <label for="yjdgrq">
        <g:message code="baseContract.yjdgrq.label" default="Yjdgrq" />

    </label>
    <input id="yjdgrq" name="yjdgrq" date value="${lszlContractInstance?.yjdgrq?.getTime()}"  class="easyui-datebox" >
</span>
<span id="divhtsl${pageId}" class="fieldcontain  ">
    <label for="htsl">
        <g:message code="baseContract.htsl.label" default="Htsl" />

    </label>
    <g:field name="htsl" value="${fieldValue(bean: lszlContractInstance, field: 'htsl')}" class="easyui-numberbox myui"/>
</span>

<span id="divzgtj${pageId}" class="fieldcontain  ">
    <label for="zgtj">
        <g:message code="baseContract.zgtj.label" default="Zgtj" />

    </label>
    <g:field name="zgtj" value="${fieldValue(bean: lszlContractInstance, field: 'zgtj')}" class="easyui-numberbox myui"/>
</span>

<span id="divlybzj${pageId}" class="fieldcontain  ">
    <label for="lybzj">
        <g:message code="baseContract.lybzj.label" default="Lybzj" />

    </label>
    <g:field name="lybzj" value="${fieldValue(bean: lszlContractInstance, field: 'lybzj')}" class="easyui-numberbox myui"/>
</span>

<p style="color: red">超量条款(用于结算)</p>
<hr>

<span id="divccdj${pageId}" class="fieldcontain  ">
    <label for="ccdj">
        <g:message code="baseContract.ccdj.label" default="Ccdj" />(元/吨)

    </label>
    <g:field name="ccdj" class="easyui-numberbox myui" value="${fieldValue(bean: lszlContractInstance, field: 'ccdj')}"/>
</span>

<span id="divzxdj${pageId}" class="fieldcontain  ">
    <label for="zxdj">
        <g:message code="baseContract.zxdj.label" default="Zxdj" />(元/吨)

    </label>
    <g:field name="zxdj" class="easyui-numberbox myui" value="${fieldValue(bean: lszlContractInstance, field: 'zxdj')}"/>
</span>

<span id="divfkr${pageId}" class="fieldcontain  ">
    <label for="fkr">
        <g:message code="baseContract.fkr.label" default="Fkr" />(日)

    </label>
    <g:field name="fkr" class="easyui-numberbox myui" value="${fieldValue(bean: lszlContractInstance, field: 'fkr')}"/>
</span>
<span id="divrkszddrjfcs${pageId}" class="fieldcontain  ">
    <label for="rkszddrjfcs">
        <g:message code="baseContract.rkszddrjfcs.label" default="Rkszddrjfcs" />

    </label>
    <g:checkBox name="rkszddrjfcs" value="${lszlContractInstance?.rkszddrjfcs}" />
</span>

<span id="divcczq${pageId}" class="fieldcontain  ">
    <label for="cczq">
        <g:message code="baseContract.cczq.label" default="Cczq" />(天)

    </label>
    <g:field name="cczq" class="easyui-numberbox myui" value="${fieldValue(bean: lszlContractInstance, field: 'cczq')}"/>
</span>

<span id="divcqdj${pageId}" class="fieldcontain  ">
    <label for="cqdj">
        <g:message code="baseContract.cqdj.label" default="Cqdj" />

    </label>
    <g:field name="cqdj" class="easyui-numberbox myui" value="${fieldValue(bean: lszlContractInstance, field: 'cqdj')}"/>
</span>
<span id="divcqhlj${pageId}" class="fieldcontain  ">
    <label for="cqhlj">
        <g:message code="baseContract.cqhlj.label" default="Cqhlj" />(元/吨.天)

    </label>
    <g:field name="cqhlj" class="easyui-numberbox myui" value="${fieldValue(bean: lszlContractInstance, field: 'cqhlj')}"/>
</span>

<span id="divazqlj${pageId}" class="fieldcontain  ">
    <label for="azqlj">
        <g:message code="baseContract.azqlj.label" default="Azqlj" />

    </label>
    <g:checkBox name="azqlj" value="${lszlContractInstance?.azqlj}" />
</span>

<span id="divzxjl${pageId}" class="fieldcontain  ">
    <label for="zxjl">
        <g:message code="baseContract.zxjl.label" default="Zxjl" />(吨)

    </label>
    <g:field name="zxjl" class="easyui-numberbox myui" value="${fieldValue(bean: lszlContractInstance, field: 'zxjl')}"/>
</span>
<span id="divmcqfsl${pageId}" class="fieldcontain  ">
    <label for="mcqfsl">
        <g:message code="baseContract.mcqfsl.label" default="Mcqfsl" />(吨)

    </label>
    <g:field name="mcqfsl" class="easyui-numberbox myui" value="${fieldValue(bean: lszlContractInstance, field: 'mcqfsl')}"/>
</span>

<span id="divccfzq${pageId}" class="fieldcontain  ">
    <label for="ccfzq">
        <g:message code="baseContract.ccfzq.label" default="Ccfzq" />(天)

    </label>
    <g:field name="ccfzq" class="easyui-numberbox myui" value="${fieldValue(bean: lszlContractInstance, field: 'ccfzq')}"/>
</span>

<span id="divccfjsfs${pageId}" class="fieldcontain  ">
    <label for="ccfjsfs">
        <g:message code="baseContract.ccfjsfs.label" default="Ccfjsfs" />
        <span class="required-indicator">*</span>
    </label>
    <g:select name="ccfjsfs" from="${[[index:0,value:'按天计算'],[index:1,value:'按周期第一天计费']]}" optionKey="index" optionValue="value" noSelection="['':'请选择仓储费计算方式']" value="${lszlContractInstance?.ccfjsfs}" required="true"></g:select>
</span>
<span id="divzxsh${pageId}" class="fieldcontain  ">
    <label for="zxsh">
        <g:message code="baseContract.zxsh.label" default="Zxsh" />

    </label>
    <g:field name="zxsh" class="easyui-numberbox myui" value="${fieldValue(bean: lszlContractInstance, field: 'zxsh')}"/>
</span>

<span id="divbgsh${pageId}" class="fieldcontain  ">
    <label for="bgsh">
        <g:message code="baseContract.bgsh.label" default="Bgsh" />(/周期)

    </label>
    <g:field name="bgsh" class="easyui-numberbox myui" value="${fieldValue(bean: lszlContractInstance, field: 'bgsh')}"/>
</span>

<span id="divcszq${pageId}" class="fieldcontain  ">
    <label for="cszq">
        <g:message code="baseContract.cszq.label" default="Cszq" />(天)

    </label>
    <g:field name="cszq" class="easyui-numberbox myui" value="${fieldValue(bean: lszlContractInstance, field: 'cszq')}"/>
</span>
<span id="divmcsts${pageId}" class="fieldcontain  ">
    <label for="mcsts">
        <g:message code="baseContract.mcsts.label" default="Mcsts" />

    </label>
    <g:field name="mcsts" class="easyui-numberbox myui" value="${fieldValue(bean: lszlContractInstance, field: 'mcsts')}"/>
</span>

<p style="color: red">作业价格条款</p>
<hr>

<span id="divdlgt${pageId}" class="fieldcontain  ">
    <label for="dlgt">
        <g:message code="baseContract.dlgt.label" default="Dlgt" />(元/桶)

    </label>
    <g:field name="dlgt" class="easyui-numberbox myui" value="${fieldValue(bean: lszlContractInstance, field: 'dlgt')}"/>
</span>

<span id="divbdlgt${pageId}" class="fieldcontain  ">
    <label for="bdlgt">
        <g:message code="baseContract.bdlgt.label" default="Bdlgt" />(元/桶)

    </label>
    <g:field name="bdlgt" class="easyui-numberbox myui" value="${fieldValue(bean: lszlContractInstance, field: 'bdlgt')}"/>
</span>

<span id="divssbaf${pageId}" class="fieldcontain  ">
    <label for="ssbaf">
        <g:message code="baseContract.ssbaf.label" default="Ssbaf" />(元/吨)

    </label>
    <g:field name="ssbaf" class="easyui-numberbox myui" value="${fieldValue(bean: lszlContractInstance, field: 'ssbaf')}"/>
</span>
<span id="divmtsyf${pageId}" class="fieldcontain  ">
    <label for="mtsyf">
        <g:message code="baseContract.mtsyf.label" default="Mtsyf" />(元/吨)

    </label>
    <g:field name="mtsyf" class="easyui-numberbox myui" value="${fieldValue(bean: lszlContractInstance, field: 'mtsyf')}"/>
</span>
<span id="divjjtk${pageId}" class="fieldcontain  ">
    <label for="jjtk">
        <g:message code="baseContract.jjtk.label" default="Jjtk" />

    </label>
    <g:textArea class="easyui-validatebox myui" name="jjtk" value="${lszlContractInstance?.jjtk}"/>
</span>

<p style="color: red">货物交付条件</p>
<hr>

<span id="divwflxr${pageId}" class="fieldcontain  ">
    <label for="wflxr">
        <g:message code="baseContract.wflxr.label" default="Wflxr" />

    </label>
    <g:textField class="easyui-validatebox myui" name="wflxr" value="${lszlContractInstance?.wflxr}"/>
</span>

<span id="divdflxr${pageId}" class="fieldcontain  ">
    <label for="dflxr">
        <g:message code="baseContract.dflxr.label" default="Dflxr" />

    </label>
    <g:textField class="easyui-validatebox myui" name="dflxr" value="${lszlContractInstance?.dflxr}"/>
</span>

<span id="divwflxdh${pageId}" class="fieldcontain  ">
    <label for="wflxdh">
        <g:message code="baseContract.wflxdh.label" default="Wflxdh" />

    </label>
    <g:textField class="easyui-validatebox myui" name="wflxdh" value="${lszlContractInstance?.wflxdh}"/>
</span>
<span id="divdflxdh${pageId}" class="fieldcontain  ">
    <label for="dflxdh">
        <g:message code="baseContract.dflxdh.label" default="Dflxdh" />

    </label>
    <g:textField class="easyui-validatebox myui" name="dflxdh" value="${lszlContractInstance?.dflxdh}"/>
</span>

<span id="divwfjsczh${pageId}" class="fieldcontain  ">
    <label for="wfjsczh">
        <g:message code="baseContract.wfjsczh.label" default="Wfjsczh" />

    </label>
    <g:textField class="easyui-validatebox myui" name="wfjsczh" value="${lszlContractInstance?.wfjsczh}"/>
</span>

<span id="divdffstdcz${pageId}" class="fieldcontain  ">
    <label for="dffstdcz">
        <g:message code="baseContract.dffstdcz.label" default="Dffstdcz" />

    </label>
    <g:textField class="easyui-validatebox myui" name="dffstdcz" value="${lszlContractInstance?.dffstdcz}"/>
</span>
<span id="divwfjsemail${pageId}" class="fieldcontain  ">
    <label for="wfjsemail">
        <g:message code="baseContract.wfjsemail.label" default="Wfjsemail" />

    </label>
    <g:textField class="easyui-validatebox myui" name="wfjsemail" value="${lszlContractInstance?.wfjsemail}"/>
</span>

<span id="divdffstdemail${pageId}" class="fieldcontain  ">
    <label for="dffstdemail">
        <g:message code="baseContract.dffstdemail.label" default="Dffstdemail" />

    </label>
    <g:textField class="easyui-validatebox myui" name="dffstdemail" value="${lszlContractInstance?.dffstdemail}"/>
</span>

<p style="color: red">其他信息</p>
<hr>

<span id="divzdr${pageId}" class="fieldcontain  ">
    <label for="zdr_">
        <g:message code="baseContract.zdr.label" default="Zdr" />

    </label>
    <g:textField name="zdr_" id="zdr_" value="${lszlContractInstance?.maker?.userRealName}" readonly="true"></g:textField>

</span>

<span id="divzdrq${pageId}" class="fieldcontain  ">
    <label for="zdrq_">
        <g:message code="baseContract.zdrq.label" default="Zdrq" />

    </label>
    <input name="zdrq_" id="zdrq_" date value="${lszlContractInstance?.makeDate?.getTime()}"  readonly="true">

</span>

<span id="divshr${pageId}" class="fieldcontain  ">
    <label for="shr_">
        <g:message code="baseContract.shr.label" default="Shr" />

    </label>
    <g:textField name="shr_" id="shr_" value="${lszlContractInstance?.checker?.userRealName}" disabled="true"></g:textField>

</span>
<span id="divshrq${pageId}" class="fieldcontain  ">
    <label for="shrq_">
        <g:message code="baseContract.shrq.label" default="Shrq" />

    </label>
    <input id="shrq_" name="shrq_" date value="${lszlContractInstance?.checkDate?.getTime()}"  readonly="true">

</span>
<span id="divbz${pageId}" class="fieldcontain  ">
    <label for="bz">
        <g:message code="baseContract.bz.label" default="Bz" />

    </label>
    <g:textArea class="easyui-validatebox myui" name="bz" value="${lszlContractInstance?.bz}" />
</span>

