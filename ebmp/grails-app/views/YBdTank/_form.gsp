<%@ page import="com.app.ywms.bd.tank.YBdTank" %>

<g:hiddenField name="id" value="${YBdTankInstance?.id}" />
<g:hiddenField name="version" value="${YBdTankInstance?.version}" />

<p style="color:red">基本信息</p>
<hr>
<span id="divcode${pageId}" class="fieldcontain  ">
    <label for="code">
        <g:message code="YBdTank.code.label" default="Code" />

    </label>
    <g:textField class="easyui-validatebox myui" name="code" value="${YBdTankInstance?.code}"/>
    <div id="code_message" hidden="" name="message" class="errors" role="status"></div>
</span>



<span id="divgllx${pageId}" class="fieldcontain  ">
    <label for="gllx">
        <g:message code="YBdTank.gllx.label" default="Gllx" />

    </label>
    <g:select name="gllx" class="myui" from="[[index:0,value:'使用中'],[index:1,value:'包罐'],[index:2,value:'清空'],[index:3,value:'停用']]" optionKey="index" optionValue="value" noSelection="['':'-请选择管理类型-']" value="${YBdTankInstance.gllx}"/>
    <div id="gllx_message" hidden="" name="message" class="errors" role="status"></div>
</span>






<span id="divbcrj${pageId}" class="fieldcontain  ">
    <label for="bcrj">
        <g:message code="YBdTank.bcrj.label" default="Bcrj" />

    </label>
    <g:field name="bcrj" class="easyui-numberbox myui" value="${fieldValue(bean: YBdTankInstance, field: 'bcrj')}"/>
    <div id="bcrj_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<br>

<span id="divaqrj${pageId}" class="fieldcontain  ">
    <label for="aqrj">
        <g:message code="YBdTank.aqrj.label" default="Aqrj" />
        
    </label>
    <g:field name="aqrj" class="easyui-numberbox myui" value="${fieldValue(bean: YBdTankInstance, field: 'aqrj')}"/>
    <div id="aqrj_message" hidden="" name="message" class="errors" role="status"></div>
</span>



<span id="divbdInvmandoc${pageId}" class="fieldcontain  ">
    <label for="bdInvmandoc">
        <g:message code="YBdTank.bdInvmandoc.label" default="Bd Invmandoc" />
        
    </label>
    <g:refTemplate code="refBdInvmandoc" model="[id:'bdInvmandoc',name:'bdInvmandoc.id',value:YBdTankInstance?.bdInvmandoc?.id]"></g:refTemplate>
    <div id="bdInvmandoc_message" hidden="" name="message" class="errors" role="status"></div>
</span>


<br>
<span id="divdescribe${pageId}" class="fieldcontain  ">
    <label for="describe">
        <g:message code="YBdTank.describe.label" default="Describe" />

    </label>
    <g:textField class="easyui-validatebox myui" name="describe" value="${YBdTankInstance?.describe}" style="width:50%"/>
    <div id="describe_message" hidden="" name="message" class="errors" role="status"></div>
</span>
<br>
<span id="divbg${pageId}" class="fieldcontain  ">
    <label for="bg">
        <g:message code="YBdTank.bg.label" default="Bg" />
        
    </label>
    <g:checkBox name="bg" value="${YBdTankInstance?.bg}" />
    <div id="bg_message" hidden="" name="message" class="errors" role="status"></div>
</span>


<span id="divzzgq${pageId}" class="fieldcontain  ">
    <label for="zzgq">
        <g:message code="YBdTank.zzgq.label" default="Zzgq" />

    </label>
    <g:checkBox name="zzgq" value="${YBdTankInstance?.zzgq}" />
    <div id="zzgq_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divbonded${pageId}" class="fieldcontain  ">
    <label for="bonded">
        <g:message code="YBdTank.bonded.label" default="Bonded" />
        
    </label>
    <g:checkBox name="bonded" value="${YBdTankInstance?.bonded}" />
    <div id="bonded_message" hidden="" name="message" class="errors" role="status"></div>
</span>
<br>

<span id="divzgzf${pageId}" class="fieldcontain  ">
    <label for="zgzf">
        <g:message code="YBdTank.zgzf.label" default="Zgzf" />

    </label>
    <g:checkBox name="zgzf" value="${YBdTankInstance?.zgzf}" />
    <div id="zgzf_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divrxhz${pageId}" class="fieldcontain  ">
    <label for="rxhz">
        <g:message code="YBdTank.rxhz.label" default="Rxhz" />

    </label>
    <g:checkBox name="rxhz" value="${YBdTankInstance?.rxhz}" />
    <div id="rxhz_message" hidden="" name="message" class="errors" role="status"></div>
</span>


<span id="divxuni${pageId}" class="fieldcontain  ">
    <label for="xuni">
        <g:message code="YBdTank.xuni.label" default="Xuni" />

    </label>
    <g:checkBox name="xuni" value="${YBdTankInstance?.xuni}" />
    <div id="xuni_message" hidden="" name="message" class="errors" role="status"></div>
</span>



<p style="color:red">计量信息</p><hr>

<span id="divbw${pageId}" class="fieldcontain  ">
    <label for="bw">
        <g:message code="YBdTank.bw.label" default="Bw" />

    </label>
    <g:checkBox name="bw" value="${YBdTankInstance?.bw}" />
    <div id="bw_message" hidden="" name="message" class="errors" role="status"></div>
</span>

</br>

<span id="divgd${pageId}" class="fieldcontain  ">
    <label for="gd">
        <g:message code="YBdTank.gd.label" default="Gd" />(米)

    </label>
    <g:field name="gd" class="easyui-numberbox myui" value="${fieldValue(bean: YBdTankInstance, field: 'gd')}"/>
    <div id="gd_message" hidden="" name="message" class="errors" role="status"></div>
</span>


<span id="divgdsl${pageId}" class="fieldcontain  ">
    <label for="gdsl">
        <g:message code="YBdTank.gdsl.label" default="Gdsl" />(L)

    </label>
    <g:field name="gdsl" class="easyui-numberbox myui" value="${fieldValue(bean: YBdTankInstance, field: 'gdsl')}"/>
    <div id="gdsl_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divjyzsbh${pageId}" class="fieldcontain  ">
    <label for="jyzsbh">
        <g:message code="YBdTank.jyzsbh.label" default="Jyzsbh" />

    </label>
    <g:textField class="easyui-validatebox myui" name="jyzsbh" value="${YBdTankInstance?.jyzsbh}" />
    <div id="jyzsbh_message" hidden="" name="message" class="errors" role="status"></div>
</span>
<br>
<span id="divjyrq${pageId}" class="fieldcontain  ">
    <label for="jyrq">
        <g:message code="YBdTank.jyrq.label" default="Jyrq" />

    </label>
    <input name="jyrq" id="jyrq" date  value="${YBdTankInstance?.jyrq?.getTime()}" class="easyui-datebox"/>
    <div id="jyrq_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divyxrq${pageId}" class="fieldcontain  ">
    <label for="yxrq">
        <g:message code="YBdTank.yxrq.label" default="Yxrq" />

    </label>
    <input name="yxrq" id="yxrq" date  value="${YBdTankInstance?.yxrq?.getTime()}" class="easyui-datebox" />
    <div id="yxrq_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divjygs${pageId}" class="fieldcontain  ">
    <label for="jygs">
        <g:message code="YBdTank.jygs.label" default="Jygs" />

    </label>
    <g:textField class="easyui-validatebox myui" name="jygs" value="${YBdTankInstance?.jygs}"/>
    <div id="jygs_message" hidden="" name="message" class="errors" role="status"></div>
</span>
<br>
<span id="divjyyj${pageId}" class="fieldcontain  ">
    <label for="jyyj">
        <g:message code="YBdTank.jyyj.label" default="Jyyj" />

    </label>
    <g:textField class="easyui-validatebox myui" name="jyyj" value="${YBdTankInstance?.jyyj}"/>
    <div id="jyyj_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divjysm${pageId}" class="fieldcontain  ">
    <label for="jysm">
        <g:message code="YBdTank.jysm.label" default="Jysm" />

    </label>
    <g:textField class="easyui-validatebox myui" name="jysm" value="${YBdTankInstance?.jysm}"/>
    <div id="jysm_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divgd1${pageId}" class="fieldcontain  ">
    <label for="gd1">
        <g:message code="YBdTank.gd1.label" default="Gd1" />(米)

    </label>
    <g:field name="gd1" class="easyui-numberbox myui" value="${fieldValue(bean: YBdTankInstance, field: 'gd1')}"/>
    <div id="gd1_message" hidden="" name="message" class="errors" role="status"></div>
</span>
<br>

<span id="divgd2${pageId}" class="fieldcontain  ">
    <label for="gd2">
        <g:message code="YBdTank.gd2.label" default="Gd2" />

    </label>
    <g:field name="gd2" class="easyui-numberbox myui" value="${fieldValue(bean: YBdTankInstance, field: 'gd2')}"/>
    <div id="gd2_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divzhijing${pageId}" class="fieldcontain  ">
    <label for="zhijing">
        <g:message code="YBdTank.zhijing.label" default="Zhijing" />(米)

    </label>
    <g:field name="zhijing" class="easyui-numberbox myui" value="${fieldValue(bean: YBdTankInstance, field: 'zhijing')}"/>
    <div id="zhijing_message" hidden="" name="message" class="errors" role="status"></div>
</span>


<span id="divcode2${pageId}" class="fieldcontain  ">
    <label for="code2">
        <g:message code="YBdTank.code2.label" default="Code2" />

    </label>
    <g:textField class="easyui-validatebox myui" name="code2" value="${YBdTankInstance?.code2}"/>
    <div id="code2_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<p style="color: red">管理说明</p>
<hr>
<span id="divglsm${pageId}" class="fieldcontain  ">
    <label for="glsm">
        <g:message code="YBdTank.glsm.label" default="Glsm" />

    </label>
    <g:textArea class="easyui-validatebox myui" name="glsm" value="${YBdTankInstance?.glsm}"/>
    <div id="glsm_message" hidden="" name="message" class="errors" role="status"></div>
</span>

