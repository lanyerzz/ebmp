<%@ page import="com.app.ywms.contract.BaseContract" %>

<g:hiddenField name="id" value="${bgContractInstance?.id}" />
<g:hiddenField name="version" value="${bgContractInstance?.version}" />

<p style="color:red">基本信息</p>
<hr>
<span id="divcontractNo${pageId}" class="fieldcontain  ">
    <label for="contractNo">
        <g:message code="bgContract.contractNo.label" default="Contract No" />

    </label>
    <g:textField class="easyui-validatebox myui" name="contractNo" value="${bgContractInstance?.contractNo}" readonly=""/>
    <div id="contractNo_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divcontrantNo2${pageId}" class="fieldcontain  ">
    <label for="contractNo2">
        <g:message code="bgContract.contractNo2.label" default="contractNo No2" />

    </label>
    <g:textField class="easyui-validatebox myui" name="contractNo2" value="${bgContractInstance?.contractNo2}"/>
    <div id="contrantNo2_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divsignDate${pageId}" class="fieldcontain  ">
    <label for="signDate">
        <g:message code="bgContract.signDate.label" default="Sign Date" />
        <span class="required-indicator">*</span>
    </label>
    <input id="signDate" name="signDate" date  value="${bgContractInstance?.signDate?.getTime()}" class="easyui-datebox"  required="true">
</span>

<span id="divsignAddress${pageId}" class="fieldcontain  ">
    <label for="signAddress">
        <g:message code="bgContract.signAddress.label" default="Sign Address" />

    </label>
    <g:textField class="easyui-validatebox myui" name="signAddress" value="${bgContractInstance?.signAddress}"/>
</span>

<span id="divbdCumandoc${pageId}" class="fieldcontain  ">
    <label for="bdCumandoc">
        <g:message code="bgContract.bdCumandoc.label" default="Bd Cumandoc" />
        <span class="required-indicator">*</span>
    </label>
    <g:refTemplate  code="refBdCustomer" model="[id:'bdCumandoc',name:'bdCumandoc.id',value:bgContractInstance?.bdCumandoc?.id]" required="true"></g:refTemplate>
</span>



<span id="divcontractescribe${pageId}" class="fieldcontain  ">
    <label for="contractescribe">
        <g:message code="bgContract.contractescribe.label" default="Contractescribe" />

    </label>
    <g:textField class="easyui-validatebox myui" name="contractescribe" value="${bgContractInstance?.contractescribe}" style="width:200pt"/>
</span>



<p style="color: red">租罐条款</p>
<hr>
<span id="divbdInvmandoc${pageId}" class="fieldcontain  ">
    <label for="bdInvmandoc${pageId}">
        <g:message code="bgContract.bdInvmandoc.label" default="Bd Invmandoc" />
        <span class="required-indicator">*</span>
    </label>
    <g:refTemplate  code="refBdInvmandoc" model="[id:'bdInvmandoc',name:'bdInvmandoc.id',value:bgContractInstance?.bdInvmandoc?.id,required:true]"></g:refTemplate>

</span>

<span id="divcheckType${pageId}" class="fieldcontain  ">
    <label for="checkType">
        <g:message code="bgContract.checkType.label" default="Check Type" />
        <span class="required-indicator">*</span>
    </label>
    <g:select name="checkType" from="${[[index:0,value:'罐检方式'],[index:1,value:'穿检方式']]}" optionValue="value" optionKey="index" noSelection="['':'-请选择数量验收方式-']" value="${bgContractInstance.checkType}" required="true"></g:select>

</span>

<span id="divzygh${pageId}" class="fieldcontain  ">
    <label for="gh${pageId}">
        <g:message code="bgContract.zygh.label"  />

    </label>
    <g:refTemplate code="refYBdTank" model="[id:'gh',name:'gh.id',value:bgContractInstance?.gh?.id]"></g:refTemplate>

</span>

<span id="divmyfs${pageId}" class="fieldcontain  ">
    <label for="myfs">
        <g:message code="bgContract.myfs.label" default="Myfs" />
        <span class="required-indicator">*</span>
    </label>
    <g:select name="myfs" from="${[[index:0,value:'内贸'],[index:1,value:'外贸'],[index:2,value:'内、外贸']]}" optionKey="index" optionValue="value" value="${bgContractInstance?.myfs}" noSelection="['':'-请选择贸易方式-']"  required="true"></g:select>
</span>

<span id="divzgtj${pageId}" class="fieldcontain  ">
    <label for="zgtj">
        <g:message code="bgContract.zgtj.label" default="Zgtj" />

    </label>
    <g:field name="zgtj" class="easyui-numberbox myui" value="${fieldValue(bean: bgContractInstance, field: 'zgtj')}" />
</span>

<span id="divzgsl${pageId}" class="fieldcontain  ">
    <label for="zgsl">
        <g:message code="bgContract.zgsl.label" default="Zgsl" />

    </label>
    <g:field name="zgsl" class="easyui-numberbox myui" value="${fieldValue(bean: bgContractInstance, field: 'zgsl')}" />
</span>

<span id="divrksx${pageId}" class="fieldcontain  ">
    <label for="rksx">
        <g:message code="bgContract.rksx.label" default="Rksx" />(吨)

    </label>
    <g:field name="rksx" class="easyui-numberbox myui" value="${fieldValue(bean: bgContractInstance, field: 'rksx')}" />
</span>

<span id="divzgdj${pageId}" class="fieldcontain  ">
    <label for="zgdj">
        <g:message code="bgContract.zgdj.label" default="Zgdj" />(元/年)

    </label>
    <g:field name="zgdj" class="easyui-numberbox myui" value="${fieldValue(bean: bgContractInstance, field: 'zgdj')}" />
</span>

<span id="divzgksrq${pageId}" class="fieldcontain  ">
    <label for="zgksrq">
        <g:message code="bgContract.zgksrq.label" default="Zgksrq" />
        <span class="required-indicator">*</span>
    </label>
    <input id="zgksrq" name="zgksrq" date value="${bgContractInstance?.zgksrq?.getTime()}" class="easyui-datebox"  required="true">
</span>

<span id="divzgjsrq${pageId}" class="fieldcontain  ">
    <label for="zgjsrq">
        <g:message code="bgContract.zgjsrq.label" default="Zgjsrq" />
        <span class="required-indicator">*</span>
    </label>
    <input id="zgjsrq" name="zgjsrq" date value="${bgContractInstance?.zgjsrq?.getTime()}" class="easyui-datebox"  required="true">
</span>

<span id="divclhdj${pageId}" class="fieldcontain  ">
    <label for="clhdj">
        <g:message code="bgContract.clhdj.label" default="Clhdj" />(元/吨)

    </label>
    <g:field name="clhdj" class="easyui-numberbox myui" value="${fieldValue(bean: bgContractInstance, field: 'clhdj')}"/>
</span>

<span id="divclhcqdj${pageId}" class="fieldcontain  ">
    <label for="clhcqdj">
        <g:message code="bgContract.clhcqdj.label" default="Clhcqdj" />(元/吨.天)

    </label>
    <g:field name="clhcqdj" class="easyui-numberbox myui" value="${fieldValue(bean: bgContractInstance, field: 'clhcqdj')}"/>
</span>

<span id="divlybzj${pageId}" class="fieldcontain  ">
    <label for="lybzj">
        <g:message code="bgContract.lybzj.label" default="Lybzj" />(万元)

    </label>
    <g:field name="lybzj" class="easyui-numberbox myui" value="${fieldValue(bean: bgContractInstance, field: 'lybzj')}"/>
    <div id="lybzj_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divfbzjts${pageId}" class="fieldcontain  ">
    <label for="fbzjts">
        <g:message code="bgContract.fbzjts.label" default="Fbzjts" />(天)

    </label>
    <g:field name="fbzjts" class="easyui-numberbox myui" value="${fieldValue(bean: bgContractInstance, field: 'fbzjts')}"/>

</span>

<p style="color: red">超量条款(用于结算)</p>
<hr>

<span id="divccdj${pageId}" class="fieldcontain  ">
    <label for="ccdj">
        <g:message code="bgContract.ccdj.label" default="Ccdj" />(元/吨)

    </label>
    <g:field name="ccdj" class="easyui-numberbox myui" value="${fieldValue(bean: bgContractInstance, field: 'ccdj')}"/>
</span>

<span id="divzxdj${pageId}" class="fieldcontain  ">
    <label for="zxdj">
        <g:message code="bgContract.zxdj.label" default="Zxdj" />(元/吨)

    </label>
    <g:field name="zxdj" class="easyui-numberbox myui" value="${fieldValue(bean: bgContractInstance, field: 'zxdj')}"/>
</span>

<span id="divfkr${pageId}" class="fieldcontain  ">
    <label for="fkr">
        <g:message code="bgContract.fkr.label" default="Fkr" />(日)

    </label>
    <g:field name="fkr" class="easyui-numberbox myui" value="${fieldValue(bean: bgContractInstance, field: 'fkr')}"/>
</span>

<span id="divrkszddrjfcs${pageId}" class="fieldcontain  ">
    <label for="rkszddrjfcs">
        <g:message code="bgContract.rkszddrjfcs.label" default="Rkszddrjfcs" />

    </label>
    <g:checkBox name="rkszddrjfcs" value="${bgContractInstance?.rkszddrjfcs}" />
</span>

<span id="divcczq${pageId}" class="fieldcontain  ">
    <label for="cczq">
        <g:message code="bgContract.cczq.label" default="Cczq" />(天)

    </label>
    <g:field name="cczq" class="easyui-numberbox myui" value="${fieldValue(bean: bgContractInstance, field: 'cczq')}"/>
    <div id="cczq_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divcqdj${pageId}" class="fieldcontain  ">
    <label for="cqdj">
        <g:message code="bgContract.cqdj.label" default="Cqdj" />

    </label>
    <g:field name="cqdj" class="easyui-numberbox myui" value="${fieldValue(bean: bgContractInstance, field: 'cqdj')}"/>
</span>

<span id="divcqhlj${pageId}" class="fieldcontain  ">
    <label for="cqhlj">
        <g:message code="bgContract.cqhlj.label" default="Cqhlj" />(元/吨.天)

    </label>
    <g:field name="cqhlj" class="easyui-numberbox myui" value="${fieldValue(bean: bgContractInstance, field: 'cqhlj')}"/>
</span>

<span id="divazqlj${pageId}" class="fieldcontain  ">
    <label for="azqlj">
        <g:message code="bgContract.azqlj.label" default="Azqlj" />

    </label>
    <g:checkBox name="azqlj" value="${bgContractInstance?.azqlj}" class="myui"/>
</span>

<span id="divzxjl${pageId}" class="fieldcontain  ">
    <label for="zxjl">
        <g:message code="bgContract.zxjl.label" default="Zxjl" />(吨)

    </label>
    <g:field name="zxjl" class="easyui-numberbox myui" value="${fieldValue(bean: bgContractInstance, field: 'zxjl')}"/>
</span>

<span id="divmcqfsl${pageId}" class="fieldcontain  ">
    <label for="mcqfsl">
        <g:message code="bgContract.mcqfsl.label" default="Mcqfsl" />(吨)

    </label>
    <g:field name="mcqfsl" class="easyui-numberbox myui" value="${fieldValue(bean: bgContractInstance, field: 'mcqfsl')}"/>
</span>

<span id="divccfzq${pageId}" class="fieldcontain  ">
    <label for="ccfzq">
        <g:message code="bgContract.ccfzq.label" default="Ccfzq" />(天)

    </label>
    <g:field name="ccfzq" class="easyui-numberbox myui" value="${fieldValue(bean: bgContractInstance, field: 'ccfzq')}"/>
</span>

<span id="divccfjsfs${pageId}" class="fieldcontain  ">
    <label for="ccfjsfs">
        <g:message code="bgContract.ccfjsfs.label" default="Ccfjsfs" />

    </label>
    <g:select name="ccfjsfs" from="${[[index:0,value:'按天计算'],[index:1,value:'按周期第一天计费']]}" optionKey="index" optionValue="value" noSelection="['':'请选择仓储费计算方式']" value="${bgContractInstance?.ccfjsfs}"></g:select>
    <div id="ccfjsfs_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divzxsh${pageId}" class="fieldcontain  ">
    <label for="zxsh">
        <g:message code="bgContract.zxsh.label" default="Zxsh" />

    </label>
    <g:field name="zxsh" class="easyui-numberbox myui" value="${fieldValue(bean: bgContractInstance, field: 'zxsh')}"/>
</span>

<span id="divbgsh${pageId}" class="fieldcontain  ">
    <label for="bgsh">
        <g:message code="bgContract.bgsh.label" default="Bgsh" />(/周期)

    </label>
    <g:field name="bgsh" class="easyui-numberbox myui" value="${fieldValue(bean: bgContractInstance, field: 'bgsh')}"/>
</span>

<span id="divcszq${pageId}" class="fieldcontain  ">
    <label for="cszq">
        <g:message code="bgContract.cszq.label" default="Cszq" />(天)

    </label>
    <g:field name="cszq" class="easyui-numberbox myui" value="${fieldValue(bean: bgContractInstance, field: 'cszq')}"/>
</span>

<span id="divmcsts${pageId}" class="fieldcontain  ">
    <label for="mcsts">
        <g:message code="bgContract.mcsts.label" default="Mcsts" />

    </label>
    <g:field name="mcsts" class="easyui-numberbox myui" value="${fieldValue(bean: bgContractInstance, field: 'mcsts')}"/>
</span>

<p style="color: red">作业价格条款</p>
<hr>

<span id="divdlgt${pageId}" class="fieldcontain  ">
    <label for="dlgt">
        <g:message code="bgContract.dlgt.label" default="Dlgt" />(元/桶)

    </label>
    <g:field name="dlgt" class="easyui-numberbox myui" value="${fieldValue(bean: bgContractInstance, field: 'dlgt')}"/>
</span>

<span id="divbdlgt${pageId}" class="fieldcontain  ">
    <label for="bdlgt">
        <g:message code="bgContract.bdlgt.label" default="Bdlgt" />(元/桶)

    </label>
    <g:field name="bdlgt" class="easyui-numberbox myui" value="${fieldValue(bean: bgContractInstance, field: 'bdlgt')}"/>
</span>

<span id="divssbaf${pageId}" class="fieldcontain  ">
    <label for="ssbaf">
        <g:message code="bgContract.ssbaf.label" default="Ssbaf" />(元/吨)

    </label>
    <g:field name="ssbaf" class="easyui-numberbox myui" value="${fieldValue(bean: bgContractInstance, field: 'ssbaf')}"/>
</span>

<span id="divmtsyf${pageId}" class="fieldcontain  ">
    <label for="mtsyf">
        <g:message code="bgContract.mtsyf.label" default="Mtsyf" />(元/吨)

    </label>
    <g:field name="mtsyf" class="easyui-numberbox myui" value="${fieldValue(bean: bgContractInstance, field: 'mtsyf')}"/>
</span>

<span id="divjjtk${pageId}" class="fieldcontain  ">
    <label for="jjtk">
        <g:message code="bgContract.jjtk.label" default="Jjtk" />

    </label>
    <g:textArea class="easyui-validatebox myui" name="jjtk" value="${bgContractInstance?.jjtk}" />
</span>

<p style="color: red">货物交付条件</p>
<hr>

<span id="divwflxr${pageId}" class="fieldcontain  ">
    <label for="wflxr">
        <g:message code="bgContract.wflxr.label" default="Wflxr" />

    </label>
    <g:textField class="easyui-validatebox myui" name="wflxr" value="${bgContractInstance?.wflxr}"/>
</span>

<span id="divdflxr${pageId}" class="fieldcontain  ">
    <label for="dflxr">
        <g:message code="bgContract.dflxr.label" default="Dflxr" />

    </label>
    <g:textField class="easyui-validatebox myui" name="dflxr" value="${bgContractInstance?.dflxr}"/>
</span>

<span id="divwflxdh${pageId}" class="fieldcontain  ">
    <label for="wflxdh">
        <g:message code="bgContract.wflxdh.label" default="Wflxdh" />

    </label>
    <g:textField class="easyui-validatebox myui" name="wflxdh" value="${bgContractInstance?.wflxdh}"/>
</span>

<span id="divdflxdh${pageId}" class="fieldcontain  ">
    <label for="dflxdh">
        <g:message code="bgContract.dflxdh.label" default="Dflxdh" />

    </label>
    <g:textField class="easyui-validatebox myui" name="dflxdh" value="${bgContractInstance?.dflxdh}"/>
</span>

<span id="divwfjsczh${pageId}" class="fieldcontain  ">
    <label for="wfjsczh">
        <g:message code="bgContract.wfjsczh.label" default="Wfjsczh" />

    </label>
    <g:textField class="easyui-validatebox myui" name="wfjsczh" value="${bgContractInstance?.wfjsczh}"/>
</span>

<span id="divdffstdcz${pageId}" class="fieldcontain  ">
    <label for="dffstdcz">
        <g:message code="bgContract.dffstdcz.label" default="Dffstdcz" />

    </label>
    <g:textField class="easyui-validatebox myui" name="dffstdcz" value="${bgContractInstance?.dffstdcz}"/>
</span>

<span id="divwfjsemail${pageId}" class="fieldcontain  ">
    <label for="wfjsemail">
        <g:message code="bgContract.wfjsemail.label" default="Wfjsemail" />

    </label>
    <g:textField class="easyui-validatebox myui" name="wfjsemail" value="${bgContractInstance?.wfjsemail}"/>
</span>

<span id="divdffstdemail${pageId}" class="fieldcontain  ">
    <label for="dffstdemail">
        <g:message code="bgContract.dffstdemail.label" default="Dffstdemail" />

    </label>
    <g:textField class="easyui-validatebox myui" name="dffstdemail" value="${bgContractInstance?.dffstdemail}"/>
</span>

<p style="color: red">其他信息</p>
<hr>

<span id="divzdr${pageId}" class="fieldcontain  ">
    <label for="maker">
        <g:message code="bgContract.zdr.label" default="Zdr" />

    </label>
    <input  id="maker" value="${bgContractInstance?.maker?.userRealName}" readonly="">
</span>

<span id="divzdrq${pageId}" class="fieldcontain  ">
    <label for="zdrq_">
        <g:message code="bgContract.zdrq.label" default="Zdrq" />

    </label>
    <input name="zdrq_" id="zdrq_" date  value="${bgContractInstance?.makeDate?.getTime()}" readonly="true">

</span>

<span id="divshr${pageId}" class="fieldcontain  ">
    <label for="shr">
        <g:message code="bgContract.shr.label" default="Shr" />

    </label>
    <g:textField name="checker" id="checker" value="${bgContractInstance?.checker?.userRealName}" readonly=""></g:textField>

</span>

<span id="divshrq${pageId}" class="fieldcontain  ">
    <label for="shrq_">
        <g:message code="bgContract.shrq.label" default="Shrq" />

    </label>
    <input id="shrq_" name="shrq_"  date  value="${bgContractInstance?.checkDate?.getTime()}" readonly="true">

</span>

<span id="divbz${pageId}" class="fieldcontain  ">
    <label for="bz">
        <g:message code="bgContract.bz.label" default="Bz" />

    </label>
    <g:textArea class="easyui-validatebox myui" name="bz" value="${bgContractInstance?.bz}" />
</span>

