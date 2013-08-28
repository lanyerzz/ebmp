<%@ page import="com.app.pub.billnorule.PubBillnorule" %>

<g:hiddenField name="id" value="${pubBillnoruleInstance?.id}" />
<g:hiddenField name="version" value="${pubBillnoruleInstance?.version}" />
<g:hiddenField name="pubbilltype.id" value="${pubBillnoruleInstance?.pubbilltype?.id}"/>

<div id="divpubbilltype${pageId}" class="fieldcontain  required" >
    <label for="pubbilltype">
        <g:message code="pubBillnorule.pubbilltype.label" default="Pubbilltype" />
        <span class="required-indicator">*</span>
    </label>
    <input id="pubbilltype" value="${pubBillnoruleInstance?.pubbilltype?.billtypename}" readonly="">
    %{--<g:refTemplate code="refPubBilltype" model="[id:'pubbilltype'+pageId,name:'pubbilltype.id',value:pubBillnoruleInstance?.pubbilltype?.id]" disable="true"/>--}%
    <div id="pubbilltype_message" hidden="" name="message" class="errors" role="status"></div>
</div>

<div id="divsubcode${pageId}" class="fieldcontain  ">
    <label for="subcode">
        <g:message code="pubBillnorule.subcode.label" default="自定义单据号前缀" />

    </label>
    <g:textField class="easyui-validatebox" name="subcode" value="${pubBillnoruleInstance?.subcode}"/>
    <div id="subcode_message" hidden="" name="message" class="errors" role="status"></div>
</div>

<div id="divnolength${pageId}" class="fieldcontain  required">
    <label for="nolength">
        <g:message code="pubBillnorule.nolength.label" default="单据号长度" />
        <span class="required-indicator">*</span>
    </label>
    <input id="nolength" name="nolength" class="easyui-numberbox" value="${pubBillnoruleInstance.nolength}" required=""/>
    <div id="nolength_message" hidden="" name="message" class="errors" role="status"></div>
</div>

<div id="divcurrentNo${pageId}" class="fieldcontain  required">
    <label for="currentNo">
        <g:message code="pubBillnorule.currentNo.label" default="流水号记录" />
        <span class="required-indicator">*</span>
    </label>
    <input id="currentNo" name="currentNo" class="easyui-numberbox" value="${pubBillnoruleInstance.currentNo}" required=""/>
    <div id="currentNo_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divbdate${pageId}" class="fieldcontain  ">
    <label for="bdate">
        <g:message code="pubBillnorule.bdate.label" default="是否按照日期编制单据号" />

    </label>
    <g:checkBox name="bdate" value="${pubBillnoruleInstance?.bdate}" />
    <div id="bdate_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divcleanByDay${pageId}" class="fieldcontain  ">
    <label for="cleanByDay">
        <g:message code="pubBillnorule.cleanByDay.label" default="是否按照日期清零" />

    </label>
    <g:checkBox name="cleanByDay" value="${pubBillnoruleInstance?.cleanByDay}" />
    <div id="cleanByDay_message" hidden="" name="message" class="errors" role="status"></div>
</div>