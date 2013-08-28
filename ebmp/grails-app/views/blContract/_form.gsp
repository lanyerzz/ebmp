<%@ page import="com.app.ywms.contract.BaseContract" %>

<g:hiddenField name="id" value="${blContractInstance?.id}"/>
<g:hiddenField name="version" value="${blContractInstance?.version}"/>


<p style="color:red">基本信息</p>
<hr>
<span id="divcontractNo${pageId}" class="fieldcontain  ">
    <label for="contractNo">
        <g:message code="baseContract.contractNo.label" default="Contract No" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox" name="contractNo" value="${blContractInstance?.contractNo}" disabled=""/>

</span>

<span id="divcontrantNo2${pageId}" class="fieldcontain  ">
    <label for="contractNo2">
        <g:message code="baseContract.contractNo2.label" default="Contrant No2" />

    </label>
    <g:textField class="easyui-validatebox myui" name="contractNo2" value="${blContractInstance?.contractNo2}"/>
</span>

<span id="divsignDate${pageId}" class="fieldcontain  ">
    <label for="signDate">
        <g:message code="baseContract.signDate.label" default="Sign Date" />
        <span class="required-indicator">*</span>
    </label>
    <input id="signDate" date name="signDate" value="${blContractInstance?.signDate?.getTime()}" class="easyui-datebox" style="width:140px" required="true">
</span>

<span id="divsignAddress${pageId}" class="fieldcontain  ">
    <label for="signAddress">
        <g:message code="baseContract.signAddress.label" default="Sign Address" />

    </label>
    <g:textField class="easyui-validatebox myui" name="signAddress" value="${blContractInstance?.signAddress}"/>
</span>

<span id="divbdCumandoc${pageId}" class="fieldcontain  ">
    <label for="bdCumandoc${pageId}">
        <g:message code="baseContract.bdCumandoc.label" default="Bd Cumandoc" />
        <span class="required-indicator">*</span>
    </label>
    <g:refTemplate  code="refBdCustomer" model="[id:'bdCumandoc',name:'bdCumandoc.id',value:blContractInstance?.bdCumandoc?.id,required:true]"></g:refTemplate>
</span>


<span id="divcontractescribe${pageId}" class="fieldcontain  ">
    <label for="contractescribe">
        <g:message code="baseContract.contractescribe.label" default="Contractescribe" />
    </label>
    <g:textField id="contractescribe" class="easyui-validatebox myui" name="contractescribe" value="${blContractInstance?.contractescribe}"  />
</span>


<p style="color: red">货物情况</p>
<hr>
<span id="divbdInvmandoc${pageId}" class="fieldcontain  ">
    <label for="bdInvmandoc">
        <g:message code="baseContract.bdInvmandoc.label" default="Bd Invmandoc" />
        <span class="required-indicator">*</span>
    </label>
    <g:refTemplate id="bdInvmandoc" code="refBdInvmandoc" model="[id:'bdInvmandoc',name:'bdInvmandoc.id',value:blContractInstance?.bdInvmandoc?.id,required:true]"></g:refTemplate>
</span>

<span id="divcheckType${pageId}" class="fieldcontain  ">
    <label for="checkType">
        <g:message code="baseContract.checkType.label" default="Check Type" />
        <span class="required-indicator">*</span>
    </label>
    <g:select name="checkType" from="${[[index:0,value:'罐检方式'],[index:1,value:'穿检方式']]}" optionValue="value" optionKey="index" noSelection="['':'-请选择数量验收方式-']" value="${blContractInstance?.checkType}" required="true"></g:select>
</span>

<span id="divgh${pageId}" class="fieldcontain  ">
    <label for="gh${pageId}">
        <g:message code="baseContract.gh.label" default="gh" />

    </label>
    <g:refTemplate code="refYBdTank" model="[id:'gh',name:'gh.id',value:blContractInstance?.gh?.id]"></g:refTemplate>
</span>

<span id="divmyfs${pageId}" class="fieldcontain  ">
    <label for="myfs">
        <g:message code="baseContract.myfs.label" default="Myfs" />
        <span class="required-indicator">*</span>
    </label>
    <g:select name="myfs" from="${[[index:0,value:'内贸'],[index:1,value:'外贸'],[index:2,value:'内、外贸']]}" optionKey="index" optionValue="value" value="${blContractInstance?.myfs}" noSelection="['':'-请选择贸易方式-']"  required="true"></g:select>
</span>


<span id="divhtsl${pageId}" class="fieldcontain  ">
    <label for="htsl">
        <g:message code="baseContract.htsl.label" default="Htsl" />

    </label>
    <g:field name="htsl" class="easyui-numberbox myui" value="${fieldValue(bean: blContractInstance, field: 'htsl')}"/>
</span>

<span id="divrksx${pageId}" class="fieldcontain  ">
    <label for="rksx">
        <g:message code="baseContract.rksx.label" default="Rksx" />(吨)

    </label>
    <g:field name="rksx" class="easyui-numberbox myui" value="${fieldValue(bean: blContractInstance, field: 'rksx')}"/>
</span>

<span id="divzgdj${pageId}" class="fieldcontain  ">
    <label for="zgdj">
        <g:message code="baseContract.zgdj.label" default="Zgdj" />(元/年)

    </label>
    <g:field name="zgdj" class="easyui-numberbox myui" value="${fieldValue(bean: blContractInstance, field: 'zgdj')}"/>
</span>

<span id="divzgksrq${pageId}" class="fieldcontain  ">
    <label for="zgksrq">
        <g:message code="baseContract.zgksrq.label" default="Zgksrq" />
        <span class="required-indicator">*</span>
    </label>
    <input id="zgksrq" name="zgksrq" date value="${blContractInstance?.zgksrq?.getTime()}" class="easyui-datebox"  required="true">
</span>

<span id="divzgjsrq${pageId}" class="fieldcontain  ">
    <label for="zgjsrq">
        <g:message code="baseContract.zgjsrq.label" default="Zgjsrq" />
        <span class="required-indicator">*</span>
    </label>
    <input id="zgjsrq" name="zgjsrq" date value="${blContractInstance?.zgjsrq?.getTime()}" class="easyui-datebox"  required="true">
</span>

<span id="divclhdj${pageId}" class="fieldcontain  ">
    <label for="clhdj">
        <g:message code="baseContract.clhdj.label" default="Clhdj" />(元/吨)

    </label>
    <g:field name="clhdj" class="easyui-numberbox myui" value="${fieldValue(bean: blContractInstance, field: 'clhdj')}"/>
</span>

<span id="divclhcqdj${pageId}" class="fieldcontain  ">
    <label for="clhcqdj">
        <g:message code="baseContract.clhcqdj.label" default="Clhcqdj" />(元/吨.天)

    </label>
    <g:field name="clhcqdj" class="easyui-numberbox myui" value="${fieldValue(bean: blContractInstance, field: 'clhcqdj')}"/>
</span>

<span id="divlybzj${pageId}" class="fieldcontain  ">
    <label for="lybzj">
        <g:message code="baseContract.lybzj.label" default="Lybzj" />(万元)

    </label>
    <g:field name="lybzj" class="easyui-numberbox myui" value="${fieldValue(bean: blContractInstance, field: 'lybzj')}"/>
</span>

<span id="divfbzjts${pageId}" class="fieldcontain  ">
    <label for="fbzjts">
        <g:message code="baseContract.fbzjts.label" default="Fbzjts" />(天)

    </label>
    <g:field name="fbzjts" class="easyui-numberbox myui" value="${fieldValue(bean: blContractInstance, field: 'fbzjts')}"/>
</span>

<p style="color: red">存储条款</p>
<hr>

<span id="divccdj${pageId}" class="fieldcontain  ">
    <label for="ccdj">
        <g:message code="baseContract.ccdj.label" default="Ccdj" />(元/吨)

    </label>
    <g:field name="ccdj" class="easyui-numberbox myui" value="${fieldValue(bean: blContractInstance, field: 'ccdj')}"/>
</span>

<span id="divzxdj${pageId}" class="fieldcontain  ">
    <label for="zxdj">
        <g:message code="baseContract.zxdj.label" default="Zxdj" />(元/吨)

    </label>
    <g:field name="zxdj" class="easyui-numberbox myui" value="${fieldValue(bean: blContractInstance, field: 'zxdj')}"/>
</span>

<span id="divfkr${pageId}" class="fieldcontain  ">
    <label for="fkr">
        <g:message code="baseContract.fkr.label" default="Fkr" />(日)

    </label>
    <g:field name="fkr" class="easyui-numberbox myui" value="${fieldValue(bean: blContractInstance, field: 'fkr')}"/>
</span>

<span id="divrkszddrjfcs${pageId}" class="fieldcontain  ">
    <label for="rkszddrjfcs">
        <g:message code="baseContract.rkszddrjfcs.label" default="Rkszddrjfcs" />

    </label>
    <g:checkBox name="rkszddrjfcs" value="${blContractInstance?.rkszddrjfcs}" />
</span>

<span id="divcczq${pageId}" class="fieldcontain  ">
    <label for="cczq">
        <g:message code="baseContract.cczq.label" default="Cczq" />(天)

    </label>
    <g:field name="cczq" class="easyui-numberbox myui" value="${fieldValue(bean: blContractInstance, field: 'cczq')}"/>
</span>

<span id="divcqdj${pageId}" class="fieldcontain  ">
    <label for="cqdj">
        <g:message code="baseContract.cqdj.label" default="Cqdj" />

    </label>
    <g:field name="cqdj" class="easyui-numberbox myui" value="${fieldValue(bean: blContractInstance, field: 'cqdj')}"/>
</span>

<span id="divcqhlj${pageId}" class="fieldcontain  ">
    <label for="cqhlj">
        <g:message code="baseContract.cqhlj.label" default="Cqhlj" />(元/吨.天)

    </label>
    <g:field name="cqhlj" class="easyui-numberbox myui" value="${fieldValue(bean: blContractInstance, field: 'cqhlj')}"/>
</span>

<span id="divazqlj${pageId}" class="fieldcontain  ">
    <label for="azqlj">
        <g:message code="baseContract.azqlj.label" default="Azqlj" />

    </label>
    <g:checkBox name="azqlj" value="${blContractInstance?.azqlj}" />
</span>

<span id="divzxjl${pageId}" class="fieldcontain  ">
    <label for="zxjl">
        <g:message code="baseContract.zxjl.label" default="Zxjl" />(吨)

    </label>
    <g:field name="zxjl" class="easyui-numberbox myui" value="${fieldValue(bean: blContractInstance, field: 'zxjl')}"/>
</span>

<span id="divmcqfsl${pageId}" class="fieldcontain  ">
    <label for="mcqfsl">
        <g:message code="baseContract.mcqfsl.label" default="Mcqfsl" />(吨)

    </label>
    <g:field name="mcqfsl" class="easyui-numberbox myui" value="${fieldValue(bean: blContractInstance, field: 'mcqfsl')}"/>
</span>

<span id="divccfzq${pageId}" class="fieldcontain  ">
    <label for="ccfzq">
        <g:message code="baseContract.ccfzq.label" default="Ccfzq" />(天)

    </label>
    <g:field name="ccfzq" class="easyui-numberbox myui" value="${fieldValue(bean: blContractInstance, field: 'ccfzq')}"/>
</span>

<span id="divccfjsfs${pageId}" class="fieldcontain  ">
    <label for="ccfjsfs">
        <g:message code="baseContract.ccfjsfs.label" default="Ccfjsfs" />
        <span class="required-indicator">*</span>
    </label>
    <g:select name="ccfjsfs" from="${[[index:0,value:'按天计算'],[index:1,value:'按周期第一天计费']]}" optionKey="index" optionValue="value" noSelection="['':'请选择仓储费计算方式']" value="${blContractInstance?.ccfjsfs}" required="true"></g:select>
</span>

<span id="divzxsh${pageId}" class="fieldcontain  ">
    <label for="zxsh">
        <g:message code="baseContract.zxsh.label" default="Zxsh" />

    </label>
    <g:field name="zxsh" class="easyui-numberbox myui" value="${fieldValue(bean: blContractInstance, field: 'zxsh')}"/>
</span>

<span id="divbgsh${pageId}" class="fieldcontain  ">
    <label for="bgsh">
        <g:message code="baseContract.bgsh.label" default="Bgsh" />(/周期)

    </label>
    <g:field name="bgsh" class="easyui-numberbox myui" value="${fieldValue(bean: blContractInstance, field: 'bgsh')}"/>
</span>

<span id="divcszq${pageId}" class="fieldcontain  ">
    <label for="cszq">
        <g:message code="baseContract.cszq.label" default="Cszq" />(天)

    </label>
    <g:field name="cszq" class="easyui-numberbox myui" value="${fieldValue(bean: blContractInstance, field: 'cszq')}"/>
</span>

<span id="divmcsts${pageId}" class="fieldcontain  ">
    <label for="mcsts">
        <g:message code="baseContract.mcsts.label" default="Mcsts" />

    </label>
    <g:field name="mcsts" class="easyui-numberbox myui" value="${fieldValue(bean: blContractInstance, field: 'mcsts')}"/>
</span>

<p style="color: red">作业价格条款</p>
<hr>

<span id="divdlgt${pageId}" class="fieldcontain  ">
    <label for="dlgt">
        <g:message code="baseContract.dlgt.label" default="Dlgt" />(元/桶)

    </label>
    <g:field name="dlgt" class="easyui-numberbox myui" value="${fieldValue(bean: blContractInstance, field: 'dlgt')}"/>
</span>

<span id="divbdlgt${pageId}" class="fieldcontain  ">
    <label for="bdlgt">
        <g:message code="baseContract.bdlgt.label" default="Bdlgt" />(元/桶)

    </label>
    <g:field name="bdlgt" class="easyui-numberbox myui" value="${fieldValue(bean: blContractInstance, field: 'bdlgt')}"/>
</span>

<span id="divssbaf${pageId}" class="fieldcontain  ">
    <label for="ssbaf">
        <g:message code="baseContract.ssbaf.label" default="Ssbaf" />(元/吨)

    </label>
    <g:field name="ssbaf" class="easyui-numberbox myui" value="${fieldValue(bean: blContractInstance, field: 'ssbaf')}"/>
</span>

<span id="divmtsyf${pageId}" class="fieldcontain  ">
    <label for="mtsyf">
        <g:message code="baseContract.mtsyf.label" default="Mtsyf" />(元/吨)

    </label>
    <g:field name="mtsyf" class="easyui-numberbox myui" value="${fieldValue(bean: blContractInstance, field: 'mtsyf')}"/>
</span>

<span id="divjjtk${pageId}" class="fieldcontain  ">
    <label for="jjtk">
        <g:message code="baseContract.jjtk.label" default="Jjtk" />

    </label>
    <g:textArea class="easyui-validatebox myui" name="jjtk" value="${blContractInstance?.jjtk}" />
</span>

<p style="color: red">货物交付条件</p>
<hr>

<span id="divwflxr${pageId}" class="fieldcontain  ">
    <label for="wflxr">
        <g:message code="baseContract.wflxr.label" default="Wflxr" />

    </label>
    <g:textField class="easyui-validatebox myui" name="wflxr" value="${blContractInstance?.wflxr}"/>
</span>

<span id="divdflxr${pageId}" class="fieldcontain  ">
    <label for="dflxr">
        <g:message code="baseContract.dflxr.label" default="Dflxr" />

    </label>
    <g:textField class="easyui-validatebox myui" name="dflxr" value="${blContractInstance?.dflxr}"/>
</span>

<span id="divwflxdh${pageId}" class="fieldcontain  ">
    <label for="wflxdh">
        <g:message code="baseContract.wflxdh.label" default="Wflxdh" />

    </label>
    <g:textField class="easyui-validatebox myui" name="wflxdh" value="${blContractInstance?.wflxdh}"/>
</span>

<span id="divdflxdh${pageId}" class="fieldcontain  ">
    <label for="dflxdh">
        <g:message code="baseContract.dflxdh.label" default="Dflxdh" />

    </label>
    <g:textField class="easyui-validatebox myui" name="dflxdh" value="${blContractInstance?.dflxdh}"/>
</span>

<span id="divwfjsczh${pageId}" class="fieldcontain  ">
    <label for="wfjsczh">
        <g:message code="baseContract.wfjsczh.label" default="Wfjsczh" />

    </label>
    <g:textField class="easyui-validatebox myui" name="wfjsczh" value="${blContractInstance?.wfjsczh}"/>
</span>

<span id="divdffstdcz${pageId}" class="fieldcontain  ">
    <label for="dffstdcz">
        <g:message code="baseContract.dffstdcz.label" default="Dffstdcz" />

    </label>
    <g:textField class="easyui-validatebox myui" name="dffstdcz" value="${blContractInstance?.dffstdcz}"/>
</span>

<span id="divwfjsemail${pageId}" class="fieldcontain  ">
    <label for="wfjsemail">
        <g:message code="baseContract.wfjsemail.label" default="Wfjsemail" />

    </label>
    <g:textField class="easyui-validatebox myui" name="wfjsemail" value="${blContractInstance?.wfjsemail}"/>
</span>

<span id="divdffstdemail${pageId}" class="fieldcontain  ">
    <label for="dffstdemail">
        <g:message code="baseContract.dffstdemail.label" default="Dffstdemail" />

    </label>
    <g:textField class="easyui-validatebox myui" name="dffstdemail" value="${blContractInstance?.dffstdemail}"/>
</span>

<p style="color: red">其他信息</p>
<hr>

<span id="divzdr${pageId}" class="fieldcontain  ">
    <label for="maker${pageId}">
        <g:message code="baseContract.zdr.label" default="Zdr" />

    </label>
    <g:hiddenField name="maker.id" value="${blContractInstance?.maker?.id}"></g:hiddenField>
    <input  id="maker${pageId}"   value="${blContractInstance?.maker?.userRealName}" disabled="true">

</span>

<span id="divzdrq${pageId}" class="fieldcontain  ">
    <label for="makeDate">
        <g:message code="baseContract.zdrq.label" default="Zdrq" />

    </label>
    %{--<input  id="zdrq" name="makeDate"  value="${blContractInstance?.makeDate?.getTime()}" date>--}%
    <g:hiddenField name="makeDate" value="${blContractInstance?.makeDate?.getTime()}"></g:hiddenField>
    <input name="makeDate" id="makeDate"   date  value="${blContractInstance?.makeDate?.getTime()}" disabled="true">
</span>

<span id="divshr${pageId}" class="fieldcontain  ">
    <label for="checker">
        <g:message code="baseContract.shr.label" default="Shr" />

    </label>
    <input  id="checker"   canSave="false" value="${blContractInstance?.checker?.userRealName}" disabled="true">

</span>

<span id="divshrq${pageId}" class="fieldcontain  ">
    <label for="checkDate">
        <g:message code="baseContract.shrq.label" default="Shrq" />

    </label>
    <input id="checkDate" name="checkDate"   date  value="${blContractInstance?.checkDate?.getTime()}" disabled="true">

</span>

<span id="divbz${pageId}" class="fieldcontain  ">
    <label for="bz">
        <g:message code="baseContract.bz.label" default="Bz" />

    </label>
    <g:textArea class="easyui-validatebox myui" name="bz" value="${blContractInstance?.bz}" />

</span>

