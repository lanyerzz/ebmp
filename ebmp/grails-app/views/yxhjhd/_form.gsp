<%@ page import="com.app.ywms.rk.xhjhd.Yxhjhd" %>

<g:hiddenField name="id" value="${yxhjhdInstance?.id}" />
<g:hiddenField name="version" value="${yxhjhdInstance?.version}" />
<g:hiddenField name="businessType.id" value="${yxhjhdInstance?.businessType?.id}"/>
<g:hiddenField name="billTypeCode" value="YXHJHD" />
<g:hiddenField name="sourceBillType.id" value="${yxhjhdInstance?.sourceBillType?.id}"></g:hiddenField>
<g:hiddenField name="sourceBillTypeCode" value="${yxhjhdInstance?.sourceBillTypeCode}"></g:hiddenField>
<p style="color: red">基本资料</p><hr>
<span id="divbusinessName${pageId}" class="fieldcontain  " >
    <label for="businessName${pageId}"  >
        <g:message code="yxhjhd.businessName.label" default="billTypeName" />

    </label>
    <input id="businessName${pageId}"  value="${yxhjhdInstance?.businessType?.name}"  disabled=""/>

</span>




<span id="divbillno${pageId}" class="fieldcontain  ">
    <label for="billno${pageId}">
        <g:message code="yxhjhd.billno.label" default="Billno" />

    </label>
    <g:textField class="easyui-validatebox" id="billno${pageId}" name="billno" value="${yxhjhdInstance?.billno}" disabled=""/>
</span>

<span  class="fieldcontain  ">
    <label for="billdate${pageId}">
        <g:message code="yxhjhd.billdate.label" default="billdate" />

    </label>
    <input class="easyui-datebox" id="billdate${pageId}" name="billdate" date value="${yxhjhdInstance?.billdate?.getTime()}" />
</span>


<span id="divzxlx${pageId}" class="fieldcontain  ">
    <label for="zxlx${pageId}">
        <g:message code="yxhjhd.zxlx.label" default="Zxlx" />

    </label>
    <input id="zxlx${pageId}" value="卸货" class="myui" disabled="true">
    <input name="zxlx" id="zxlx" value="1" type="hidden">
</span>

<span id="divmyxz${pageId}" class="fieldcontain  ">
    <label for="myxz${pageId}" class="required">
        <g:message code="yxhjhd.myxz.label" default="Myxz" />

    </label>
    <g:select name="myxz" id="${pageId}"   from="[[index:0,value:'内贸'],[index:1,value:'外贸']]" optionKey="index" optionValue="value"  value="${yhyjhInstance?.myxz}" required="true" />
</span>

<span id="divyykhqr${pageId}" class="fieldcontain  ">
    <label for="yykhqr${pageId}">
        <g:message code="yxhjhd.yykhqr.label" default="Yykhqr" />

    </label>
    <g:checkBox name="yykhqr" id="yykhqr${pageId}" value="${yxhjhdInstance?.yykhqr}" />
</span>

<p>船舶基本资料</p>
<hr>

<span id="divshipdoc${pageId}" class="fieldcontain  required">
    <label for="shipdoc${pageId}">
        <g:message code="yxhjhd.shipdoc.label" default="Shipdoc" />
        <span class="required-indicator">*</span>
    </label>
    <g:refTemplate code="refYshipdoc" model="[id:'shipdoc',name: 'shipdoc.id',value:yxhjhdInstance?.shipdoc?.id,required:true]"></g:refTemplate>
</span>


<span id="divyjdgrq${pageId}" class="fieldcontain  required">
    <label for="yjdgrq${pageId}" class="required">
        <g:message code="yxhjhd.yjdgrq.label" default="Yjdgrq" />
        <span class="required-indicator">*</span>
    </label>
    <input id="yjdgrq${pageId}" name="yjdgrq" class="easyui-datebox" date required="true" value="${yxhjhdInstance?.yjdgrq?.getTime()}">
</span>

<span id="divcddw${pageId}" class="fieldcontain  ">
    <label for="cddw">
        <g:message code="yxhjhd.cddw.label" default="Cddw" />

    </label>
    <g:refTemplate id="cddw" code="refBdCustomer" model="[id:'cddw',name:'cddw.id',value:yxhjhdInstance?.cddw?.id]"></g:refTemplate>
</span>


<span id="divlygk${pageId}" class="fieldcontain  ">
    <label for="lygk${pageId}">
        <g:message code="yxhjhd.lygk.label" default="Lygk" />

    </label>
    <g:textField class="easyui-validatebox myui" name="lygk" id="lygk${pageId}" value="${yxhjhdInstance?.lygk}"/>
</span>

<span id="divddtzsj${pageId}" class="fieldcontain  ">
    <label for="ddtzsj${pageId}">
        <g:message code="yxhjhd.ddtzsj.label" default="Ddtzsj" />

    </label>
    <g:textField class="easyui-validatebox myui" name="ddtzsj" id="ddtzsj${pageId}" value="${yxhjhdInstance?.ddtzsj}"/>
</span>

<span id="divfsdx${pageId}" class="fieldcontain  ">
    <label for="fsdx${pageId}">
        <g:message code="yxhjhd.fsdx.label" default="Fsdx" />

    </label>
    <g:checkBox name="fsdx" id="fsdx${pageId}" value="${yxhjhdInstance?.fsdx}" />
</span>


<p style="color: red">其他信息</p>
<hr>

<span id="divmaker${pageId}" class="fieldcontain  ">
    <label for="maker${pageId}">
        <g:message code="yxhjhd.maker.label" default="Maker" />

    </label>
    <input type="hidden" name="maker.id" value="${yxhjhdInstance?.maker?.id}">
    <input id="maker${pageId}" value="${yxhjhdInstance?.maker?.userRealName}"  disabled="true">
</span>

<span  class="fieldcontain  ">
    <label for="makeDate${pageId}">
        <g:message code="yxhjhd.makedate.label" default="Makedate" />

    </label>
    <input id="makeDate" type="hidden" value="${yxhjhdInstance?.makeDate?.getTime()}">
    <input id="makeDate${pageId}"  value="${yxhjhdInstance?.makeDate?.getTime()}" date disabled="true">

</span>

<span id="divsigner${pageId}" class="fieldcontain  ">
    <label for="checker${pageId}">
        <g:message code="yxhjhd.signer.label" default="Signer" />

    </label>
    <input id="checker${pageId}" value="${yxhjhdInstance?.checker?.userRealName}"  disabled="true">
</span>
<span id="divsigndate${pageId}" class="fieldcontain  ">
    <label for="checkDate_">
        <g:message code="yxhjhd.signdate.label" default="Signdate" />

    </label>
    <input id="checkDate_" name="checkDate_"  value="${yxhjhdInstance?.checkDate?.getTime()}" date disabled="true">
</span>

<span id="divqtms${pageId}" class="fieldcontain  ">
    <label for="qtms">
        <g:message code="yxhjhd.qtms.label" default="Qtms" />

    </label>
    <g:textField class="easyui-validatebox myui" name="qtms" value="${yxhjhdInstance?.qtms}"/>
</span>

<span id="divnote${pageId}" class="fieldcontain  ">
    <label for="note">
        <g:message code="yxhjhd.note.label" default="Note" />

    </label>
    <g:textField class="easyui-validatebox myui" name="note" value="${yxhjhdInstance?.note}"/>
</span>





