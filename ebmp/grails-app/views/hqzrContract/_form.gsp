<%@ page import="com.app.ywms.contract.BaseContract" %>

<g:hiddenField name="id" value="${hqzrContractInstance?.id}" />
<g:hiddenField name="version" value="${hqzrContractInstance?.version}" />


<p>基本合同信息</p>
<hr>

<span id="divcontractNo${pageId}" class="fieldcontain  ">
    <label for="contractNo">
        <g:message code="baseContract.contractNo.label" default="Contract No" />

    </label>
    <g:textField class="easyui-validatebox myui" name="contractNo" disabled="" value="${hqzrContractInstance?.contractNo}"/>
</span>

<span id="divcontrantNo2${pageId}" class="fieldcontain  ">
    <label for="contractNo2">
        <g:message code="baseContract.contractNo2.label" default="Contrant No2" />

    </label>
    <g:textField class="easyui-validatebox myui" name="contractNo2" value="${hqzrContractInstance?.contractNo2}"/>
</span>
<span id="divsignDate${pageId}" class="fieldcontain  ">
    <label for="signDate${pageId}">
        <g:message code="baseContract.signDate.label" default="Sign Date" />

    </label>

    <input id="signDate${pageId}" name="signDate"  date="true" value="${hqzrContractInstance?.signDate?.getTime()}" class="easyui-datebox">
</span>

<span id="divendDate${pageId}" class="fieldcontain  ">
    <label for="endDate${pageId}">
        <g:message code="baseContract.endDate.label" default="End Date" />

    </label>
    <input id="endDate${pageId}" name="endDate" date="true" value="${hqzrContractInstance?.endDate?.getTime()}" class="easyui-datebox" >
</span>

<span id="divcontractescribe${pageId}" class="fieldcontain  ">
    <label for="contractescribe">
        <g:message code="baseContract.contractescribe.label" default="Contractescribe" />

    </label>
    <g:textField class="easyui-validatebox myui" name="contractescribe" value="${hqzrContractInstance?.contractescribe}"/>
</span>

<span id="divsignAddress${pageId}" class="fieldcontain  ">
    <label for="signAddress">
        <g:message code="baseContract.signAddress.label" default="Sign Address" />

    </label>
    <g:textField class="easyui-validatebox myui" name="signAddress" value="${hqzrContractInstance?.signAddress}"/>
</span>
<span id="divdpczx${pageId}" class="fieldcontain  ">
    <label for="dpczx">
        <g:message code="baseContract.dpczx.label" default="Dpczx" />

    </label>
    <g:checkBox name="dpczx" value="${hqzrContractInstance?.dpczx}" />
</span>

<span id="divgsht${pageId}" class="fieldcontain  ">
    <label for="gsht">
        <g:message code="baseContract.gsht.label" default="Gsht" />

    </label>
    <g:checkBox name="gsht" value="${hqzrContractInstance?.gsht}" />
</span>
<span id="divjgfzff${pageId}" class="fieldcontain  ">
    <label for="jgfzff">
        <g:message code="baseContract.jgfzff.label" default="Jgfzff" />

    </label>
    <g:select name="jgfzff" from="${[[index:0,value:'不收取费用'],[index:1,value:'转出方承担'],[index:2,value:'转入方承担']]}" optionValue="value" optionKey="index" noSelection="['':'-请选择-']" value="${hqzrContractInstance?.jgfzff}"></g:select>
</span>


<span id="divzxccbgzff${pageId}" class="fieldcontain  ">
    <label for="zxccbgzff">
        <g:message code="baseContract.zxccbgzff.label" default="Zxccbgzff" />

    </label>
    <g:select name="zxccbgzff" from="${[[index:0,value:'不收取费用'],[index:1,value:'转出方承担'],[index:2,value:'转入方承担']]}" optionValue="value" optionKey="index" noSelection="['':'-请选择-']" value="${hqzrContractInstance?.zxccbgzff}"></g:select>
</span>

<span id="divcqrq${pageId}" class="fieldcontain  ">
    <label for="cqrq${pageId}">
        <g:message code="baseContract.cqrq.label" default="Cqrq" />

    </label>

    <input id="cqrq${pageId}" name="cqrq" date value="${hqzrContractInstance?.cqrq?.getTime()}" class="easyui-datebox" >
</span>
<span id="divhzcdcqf${pageId}" class="fieldcontain  ">
    <label for="hzcdcqf">
        <g:message code="baseContract.hzcdcqf.label" default="Hzcdcqf" />

    </label>
    <g:checkBox name="hzcdcqf" value="${hqzrContractInstance?.hzcdcqf}" />
</span>



<span id="divhz${pageId}" class="fieldcontain  ">
    <label for="bdCumandoc${pageId}">
        <g:message code="baseContract.bdCumandoc.label" default="Hz" />

    </label>
    <g:refTemplate   code="refBdCustomer" model="[id:'bdCumandoc',name:'bdCumandoc.id',value:hqzrContractInstance?.bdCumandoc?.id]"></g:refTemplate>
</span>
<span id="divzcf${pageId}" class="fieldcontain  ">
    <label for="bdCumandoc1${pageId}">
        <g:message code="baseContract.bdCumandoc1.label" default="Zcf" />

    </label>
    <g:refTemplate  code="refBdCustomer" model="[id:'bdCumandoc1',name:'bdCumandoc1.id',value:hqzrContractInstance?.bdCumandoc1?.id]"></g:refTemplate>
</span>

<span id="divhtsl${pageId}" class="fieldcontain  ">
    <label for="htsl">
        <g:message code="baseContract.htsl.label" default="Htsl" />

    </label>
    <g:field name="htsl" class="easyui-numberbox myui" value="${fieldValue(bean: hqzrContractInstance, field: 'htsl')}"/>
</span>


<p>货物情况</p>
<hr>

<span id="divhw${pageId}" class="fieldcontain  ">
    <label for="bdInvmandoc${pageId}">
        <g:message code="baseContract.bdInvmandoc.label" default="Hw" />

    </label>
    <g:refTemplate  code="refBdInvmandoc" model="[id:'bdInvmandoc',name:'bdInvmandoc.id',value:hqzrContractInstance?.bdInvmandoc?.id]"></g:refTemplate>
</span>

<span id="divslysfs${pageId}" class="fieldcontain  ">
    <label for="slysfs">
        <g:message code="baseContract.slysfs.label" default="Slysfs" />

    </label>
    <g:select name="slysfs" from="${[[index:0,value:'罐检为准'],[index:1,value:'船检为准'],[index:2,value:'交割为准']]}" optionValue="value" optionKey="index" noSelection="['':'-请选择-']" value="${hqzrContractInstance?.slysfs}"></g:select>
</span>

<span id="divgh${pageId}" class="fieldcontain  ">
    <label for="gh${pageId}">
        <g:message code="baseContract.gh.label" default="Gh" />

    </label>
    <g:refTemplate code="refYBdTank" model="[id:'gh',name:'gh.id',value:hqzrContractInstance?.gh?.id]"></g:refTemplate>

</span>
<span id="divcm${pageId}" class="fieldcontain  ">
    <label for="cm${pageId}">
        <g:message code="baseContract.cm.label" default="Cm" />

    </label>
    <g:refTemplate code="refYshipdoc" model="[id:'cm',name:'cm.id',value:hqzrContractInstance?.cm?.id]"></g:refTemplate>
</span>

<span id="divzlzb${pageId}" class="fieldcontain  ">
    <label for="zlzb">
        <g:message code="baseContract.zlzb.label" default="Zlzb" />

    </label>
    <g:textField  name="zlzb" value="${hqzrContractInstance?.zlzb}" class="myui"/>
</span>

<p>存储条款</p>
<hr>

<span id="divjgf${pageId}" class="fieldcontain  ">
    <label for="jgf">
        <g:message code="baseContract.jgf.label" default="Jgf" />(元/吨)

    </label>
    <g:field name="jgf" class="easyui-numberbox myui" value="${fieldValue(bean: hqzrContractInstance, field: 'jgf')}"/>
</span>

<span id="divzdsf${pageId}" class="fieldcontain  ">
    <label for="zdsf">
        <g:message code="baseContract.zdsf.label" default="Zdsf" />(元)

    </label>
    <g:field name="zdsf" class="easyui-numberbox myui" value="${fieldValue(bean: hqzrContractInstance, field: 'zdsf')}"/>
</span>

<span id="divzxccbgfdj${pageId}" class="fieldcontain  ">
    <label for="zxccbgfdj">
        <g:message code="baseContract.zxccbgfdj.label" default="Zxccbgfdj" />

    </label>
    <g:field name="zxccbgfdj" class="easyui-numberbox myui" value="${fieldValue(bean: hqzrContractInstance, field: 'zxccbgfdj')}"/>
</span>
<span id="divcczq${pageId}" class="fieldcontain  ">
    <label for="cczq">
        <g:message code="baseContract.cczq.label" default="Cczq" />(天)

    </label>
    <g:field name="cczq" class="easyui-numberbox myui" value="${fieldValue(bean: hqzrContractInstance, field: 'cczq')}"/>
</span>

<span id="divcqccf${pageId}" class="fieldcontain  ">
    <label for="cqccf">
        <g:message code="baseContract.cqccf.label" default="Cqccf" />(元/吨.天)

    </label>
    <g:field name="cqccf" class="easyui-numberbox myui" value="${fieldValue(bean: hqzrContractInstance, field: 'cqccf')}"/>
</span>

<span id="divcqhlj${pageId}" class="fieldcontain  ">
    <label for="cqhlj">
        <g:message code="baseContract.cqhlj.label" default="Cqhlj" />(元/吨.天)

    </label>
    <g:field name="cqhlj" class="easyui-numberbox myui" value="${fieldValue(bean: hqzrContractInstance, field: 'cqhlj')}"/>
</span>
<span id="divfkr${pageId}" class="fieldcontain  ">
    <label for="fkr">
        <g:message code="baseContract.fkr.label" default="Fkr" />(日)

    </label>
    <g:field name="fkr" class="easyui-numberbox myui" value="${fieldValue(bean: hqzrContractInstance, field: 'fkr')}"/>
</span>

<span id="divazqlj${pageId}" class="fieldcontain  ">
    <label for="azqlj">
        <g:message code="baseContract.azqlj.label" default="Azqlj" />

    </label>
    <g:checkBox name="azqlj" value="${hqzrContractInstance?.azqlj}" />
</span>



<span id="divccfzq${pageId}" class="fieldcontain  ">
    <label for="ccfzq">
        <g:message code="baseContract.ccfzq.label" default="Ccfzq" />(天)

    </label>
    <g:field name="ccfzq" class="easyui-numberbox myui" value="${fieldValue(bean: hqzrContractInstance, field: 'ccfzq')}"/>
</span>
<span id="divzxjl${pageId}" class="fieldcontain  ">
    <label for="zxjl">
        <g:message code="baseContract.zxjl.label" default="Zxjl" />(吨)

    </label>
    <g:field name="zxjl" class="easyui-numberbox myui" value="${fieldValue(bean: hqzrContractInstance, field: 'zxjl')}"/>
</span>

<span id="divmcqfsl${pageId}" class="fieldcontain  ">
    <label for="mcqfsl">
        <g:message code="baseContract.mcqfsl.label" default="Mcqfsl" />(吨)

    </label>
    <g:field name="mcqfsl" class="easyui-numberbox myui" value="${fieldValue(bean: hqzrContractInstance, field: 'mcqfsl')}"/>
</span>

<span id="divccfjsfs${pageId}" class="fieldcontain  ">
    <label for="ccfjsfs">
        <g:message code="baseContract.ccfjsfs.label" default="Ccfjsfs" />

    </label>
    <g:select name="ccfjsfs" from="${[[index:0,value:'按天计费'],[index:1,value:'按周期第一天计费']]}" optionValue="value" optionKey="index" noSelection="['':'-请选择-']" value="${hqzrContractInstance?.ccfjsfs}"></g:select>
</span>
<span id="divzxsh${pageId}" class="fieldcontain  ">
    <label for="zxsh">
        <g:message code="baseContract.zxsh.label" default="Zxsh" />

    </label>
    <g:field name="zxsh" class="easyui-numberbox myui" value="${fieldValue(bean: hqzrContractInstance, field: 'zxsh')}"/>
</span>

<span id="divbgsh${pageId}" class="fieldcontain  ">
    <label for="bgsh">
        <g:message code="baseContract.bgsh.label" default="Bgsh" />(/周期)

    </label>
    <g:field name="bgsh" class="easyui-numberbox myui" value="${fieldValue(bean: hqzrContractInstance, field: 'bgsh')}"/>
</span>

<span id="divbgshqsrq${pageId}" class="fieldcontain  ">
    <label for="bgshqsrq">
        <g:message code="baseContract.bgshqsrq.label" default="Bgshqsrq" />

    </label>
    <input id="bgshqsrq" name="bgshqsrq" value="${hqzrContractInstance?.bgshqsrq}" date class="easyui-datebox" >
    <div id="bgshqsrq_message" hidden="" name="message" class="errors" role="status"></div>
</span>
<span id="divcszq${pageId}" class="fieldcontain  ">
    <label for="cszq">
        <g:message code="baseContract.cszq.label" default="Cszq" />(天)

    </label>
    <g:field name="cszq" class="easyui-numberbox myui" value="${fieldValue(bean: hqzrContractInstance, field: 'cszq')}"/>
</span>

<span id="divhttk${pageId}" class="fieldcontain  ">
    <label for="httk">
        <g:message code="baseContract.httk.label" default="Httk" />

    </label>
    <g:textField  name="httk" value="${hqzrContractInstance?.httk}" class="myui"/>
</span>

<span id="divcqjfcl${pageId}" class="fieldcontain  ">
    <label for="cqjfcl">
        <g:message code="baseContract.cqjfcl.label" default="Cqjfcl" />

    </label>
    <g:textField class="easyui-validatebox myui" name="cqjfcl" value="${hqzrContractInstance?.cqjfcl}"/>
</span>

<p>港口作业条款</p>
<hr>

<span id="divdlgt${pageId}" class="fieldcontain  ">
    <label for="dlgt">
        <g:message code="baseContract.dlgt.label" default="Dlgt" />(元/桶)

    </label>
    <g:field name="dlgt" class="easyui-numberbox myui" value="${fieldValue(bean: hqzrContractInstance, field: 'dlgt')}"/>
</span>

<span id="divbdlgt${pageId}" class="fieldcontain  ">
    <label for="bdlgt">
        <g:message code="baseContract.bdlgt.label" default="Bdlgt" />(元/桶)

    </label>
    <g:field name="bdlgt" class="easyui-numberbox myui" value="${fieldValue(bean: hqzrContractInstance, field: 'bdlgt')}"/>
</span>

<span id="divlzfdj${pageId}" class="fieldcontain  ">
    <label for="lzfdj">
        <g:message code="baseContract.lzfdj.label" default="Lzfdj" />(元/吨)

    </label>
    <g:field name="lzfdj" class="easyui-numberbox myui" value="${fieldValue(bean: hqzrContractInstance, field: 'lzfdj')}"/>
</span>
<span id="divmtsyf${pageId}" class="fieldcontain  ">
    <label for="mtsyf">
        <g:message code="baseContract.mtsyf.label" default="Mtsyf" />

    </label>
    <g:field name="mtsyf" class="easyui-numberbox myui" value="${fieldValue(bean: hqzrContractInstance, field: 'mtsyf')}"/>
</span>
<span id="divjgtk${pageId}" class="fieldcontain  ">
    <label for="jgtk">
        <g:message code="baseContract.jgtk.label" default="Jgtk" />

    </label>
    <g:textField class="easyui-validatebox myui" name="jgtk" value="${hqzrContractInstance?.jgtk}"/>
</span>

<p>货物交付条件</p>
<hr>

<span id="divwflxr${pageId}" class="fieldcontain  ">
    <label for="wflxr">
        <g:message code="baseContract.wflxr.label" default="Wflxr" />

    </label>
    <g:textField class="easyui-validatebox myui" name="wflxr" value="${hqzrContractInstance?.wflxr}"/>
</span>

<span id="divdflxr${pageId}" class="fieldcontain  ">
    <label for="dflxr">
        <g:message code="baseContract.dflxr.label" default="Dflxr" />

    </label>
    <g:textField class="easyui-validatebox myui" name="dflxr" value="${hqzrContractInstance?.dflxr}"/>
</span>

<span id="divwflxdh${pageId}" class="fieldcontain  ">
    <label for="wflxdh">
        <g:message code="baseContract.wflxdh.label" default="Wflxdh" />

    </label>
    <g:textField class="easyui-validatebox myui" name="wflxdh" value="${hqzrContractInstance?.wflxdh}"/>
</span>
<span id="divdflxdh${pageId}" class="fieldcontain  ">
    <label for="dflxdh">
        <g:message code="baseContract.dflxdh.label" default="Dflxdh" />

    </label>
    <g:textField class="easyui-validatebox myui" name="dflxdh" value="${hqzrContractInstance?.dflxdh}"/>
</span>

<span id="divwfjsczh${pageId}" class="fieldcontain  ">
    <label for="wfjsczh">
        <g:message code="baseContract.wfjsczh.label" default="Wfjsczh" />

    </label>
    <g:textField class="easyui-validatebox myui" name="wfjsczh" value="${hqzrContractInstance?.wfjsczh}"/>
</span>

<span id="divdffstdcz${pageId}" class="fieldcontain  ">
    <label for="dffstdcz">
        <g:message code="baseContract.dffstdcz.label" default="Dffstdcz" />

    </label>
    <g:textField class="easyui-validatebox myui" name="dffstdcz" value="${hqzrContractInstance?.dffstdcz}"/>
</span>
<span id="divwfjsemail${pageId}" class="fieldcontain  ">
    <label for="wfjsemail">
        <g:message code="baseContract.wfjsemail.label" default="Wfjsemail" />

    </label>
    <g:textField class="easyui-validatebox myui" name="wfjsemail" value="${hqzrContractInstance?.wfjsemail}"/>
</span>

<span id="divdffstdemail${pageId}" class="fieldcontain  ">
    <label for="dffstdemail">
        <g:message code="baseContract.dffstdemail.label" default="Dffstdemail" />

    </label>
    <g:textField class="easyui-validatebox myui" name="dffstdemail" value="${hqzrContractInstance?.dffstdemail}"/>
</span>


<p>其他信息</p>
<hr>

<span id="divzdr${pageId}" class="fieldcontain  ">
    <label for="maker${pageId}">
        <g:message code="baseContract.zdr.label" default="Zdr" />

    </label>
    <g:hiddenField name="${hqzrContractInstance?.maker?.id}"></g:hiddenField>
    <input  id="maker${pageId}"  value="${hqzrContractInstance?.maker?.userRealName}" disabled="" >
</span>

<span id="divzdrq${pageId}" class="fieldcontain  ">
    <label for="makeDate${pageId}">
        <g:message code="baseContract.zdrq.label" default="Zdrq" />

    </label>
    <input  id="makeDate${pageId}" date value="${hqzrContractInstance?.makeDate?.getTime()}"  disabled="" >
</span>

<span id="divshr${pageId}" class="fieldcontain  ">
    <label for="checker${pageId}">
        <g:message code="baseContract.shr.label" default="Shr" />

    </label>
    <g:textField name="checker" id="checker${pageId}"   value="${hqzrContractInstance?.checker?.userRealName}" disabled="" ></g:textField>
</span>
<span id="divshrq${pageId}" class="fieldcontain  ">
    <label for="checkDate${pageId}">
        <g:message code="baseContract.shrq.label" default="Shrq" />

    </label>
    <input id="checkDate${pageId}"   date value="${hqzrContractInstance?.checkDate?.getTime()}"  disabled="" >
</span>
<span id="divbz${pageId}" class="fieldcontain  ">
    <label for="bz">
        <g:message code="baseContract.bz.label" default="Bz" />

    </label>
    <g:textArea  name="bz" value="${hqzrContractInstance?.bz}"  ></g:textArea>
</span>



