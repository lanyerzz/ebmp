<%@ page import="com.app.ywms.rk.cbdgd.Ycbdgd" %>

<g:hiddenField name="id" value="${ycbdgdInstance?.id}" />
<g:hiddenField name="version" value="${ycbdgdInstance?.version}" />
<g:hiddenField name="businessType.id" value="${ycbdgdInstance?.businessType?.id}"/>
<g:hiddenField name="sourceBillType.id" value="${ycbdgdInstance?.sourceBillType?.id}"></g:hiddenField>
<g:hiddenField name="sourceBillTypeCode" value="${ycbdgdInstance?.sourceBillTypeCode}"></g:hiddenField>

<input type="hidden" id="billTypeCode" name="billTypeCode"  value="YCBDGD" >
<span id="divbusinessName${pageId}" class="fieldcontain  " >
    <label for="businessName"  >
        <g:message code="ycbdgd.businessName.label" default="billTypeName" />

    </label>
    <input class="myui" id="businessName"  value="${ycbdgdInstance?.businessType?.name}"  disabled=""/>

</span>

<span id="divbillno${pageId}" class="fieldcontain ">
    <label for="billno">
        <g:message code="ycbdgd.billno.label" default="Billno" />
    </label>
    <g:textField class="easyui-validatebox myui"  name="billno" disabled="true"   value="${ycbdgdInstance?.billno}"/>

</span>


<span id="divbilldate${pageId}" class="fieldcontain ">
    <label for="billdate" class="required">
        <g:message code="ycbdgd.billdate.label" default="Billdate" />
        <span class="required-indicator">*</span>
    </label>
    <input id="billdate" name="billdate" date class="easyui-datebox" value="${ycbdgdInstance?.billdate?.getTime()}" required="true">

</span>


<span id="divyjdgrq${pageId}" class="fieldcontain  ">
    <label for="yjdgrq">
        <g:message code="ycbdgd.yjdgrq.label" default="Yjdgrq" />
        
    </label>

        <input id="yjdgrq" name="yjdgrq" class="myui" date  value="${ycbdgdInstance?.yjdgrq?.getTime()}" disabled="true">
</span>

<span id="divchuanming${pageId}" class="fieldcontain  ">
    <label for="chuanming${pageId}">
        <g:message code="ycbdgd.chuanming.label" default="Chuanming" />

    </label>


    <g:refTemplate code="refYshipdoc"  model="[id:'chuanming',name:'chuanming.id',value:ycbdgdInstance?.chuanming?.id]"></g:refTemplate>

</span>
<span id="divnote${pageId}" class="fieldcontain  ">
    <label for="note">
        <g:message code="ycbdgd.note.label" default="Note" />

    </label>
    <g:textField class="easyui-validatebox myui" name="note" value="${ycbdgdInstance?.note}"/>

</span>






<hr>


<span id="divmaker${pageId}" class="fieldcontain  ">
    <label for="maker${pageId}" >
        <g:message code="ycbdgd.maker.label" default="Maker" />

    </label>
    <input type="hidden" name="maker.id"  value="${ycbdgdInstance?.maker?.id}">
    <input id="maker${pageId}" disabled=""   value="${ycbdgdInstance?.maker?.userRealName}">

</span>

<span id="divmakeDate${pageId}" class="fieldcontain  ">
    <label for="makeDate${pageId}" >
        <g:message code="ycbdgd.makeDate.label" default="Make Date" />

    </label>
    <g:hiddenField name="makeDate" value="${ycbdgdInstance?.makeDate?.getTime()}"></g:hiddenField>
    <input name="makeDate" id="makeDate${pageId}" date   disabled="" value="${ycbdgdInstance?.makeDate?.getTime()}">
</span>



<span id="divchecker${pageId}" class="fieldcontain  ">
    <label for="checker${pageId}" style="width: 100px">
        <g:message code="ycbdgd.checker.label" default="Checker" />

    </label>
    <input  id="checker${pageId}" class="myui" value="${ycbdgdInstance?.checker?.userRealName}" disabled="">

</span>

<span id="divcheckDate${pageId}" class="fieldcontain  ">
    <label for="checkDate${pageId}" >
        <g:message code="ycbdgd.checkDate.label" default="Check Date" />

    </label>
    <input name="checkDate" id="checkDate${pageId}" date class="myui"  value="${ycbdgdInstance?.checkDate?.getTime()}" disabled="">


</span>
<span id="divbdCorp${pageId}" class="fieldcontain  ">
    <label for="bdCorp${pageId}" >
        <g:message code="yhyjh.bdCorp.label" default="Bd Corp" />

    </label>
    <input id="bdCorp${pageId}" name="bdCorp.unitname" disabled="" value="${ycbdgdInstance?.bdCorp?.unitName}">
    <input type="hidden" name="bdCorp.id"  value="${ycbdgdInstance?.bdCorp?.id}">

</span>

