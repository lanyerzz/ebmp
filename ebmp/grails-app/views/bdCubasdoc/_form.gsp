<%@ page import="com.app.bd.cubasdoc.BdCubasdoc" %>

<g:hiddenField name="id" value="${bdCubasdocInstance?.id}" />
<g:hiddenField name="version" value="${bdCubasdocInstance?.version}" />
<g:hiddenField name="pkAreacl.id" value="${bdCubasdocInstance?.pkAreacl?.id}" />



<span id="divcustcode${pageId}" class="fieldcontain  required">
    <label for="custcode">
        <g:message code="bdCubasdoc.custcode.label" default="Custcode" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox myui" name="custcode" required="true"  value="${bdCubasdocInstance?.custcode}"/>

</span>


<span id="divcustname${pageId}" class="fieldcontain  required">
    <label for="custname">
        <g:message code="bdCubasdoc.custname.label" default="Custname" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox myui" name="custname" required="true" value="${bdCubasdocInstance?.custname}"/>
    <div id="custname_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divcustprop${pageId}" class="fieldcontain  ">
    <label for="custprop">
        <g:message code="bdCubasdoc.custprop.label" default="Custprop" />

    </label>
    <g:select  name="custprop" from="${[[index:0,value:'外部单位'],[index:1,value:'内部公司']]}" optionKey="index" optionValue="value" noSelection="['':'-选择客商类型-']" value="${bdCubasdocInstance?.custprop}" />
    <div id="custprop_message" hidden="" name="message" class="errors" role="status"></div>
</span>
<br>
<span id="divblockUp${pageId}" class="fieldcontain  ">
    <label for="blockUp">
        <g:message code="bdCubasdoc.blockUp.label" default="Block Up" />

    </label>
    <g:checkBox name="blockUp" value="${bdCubasdocInstance?.blockUp}" />
    <div id="blockUp_message" hidden="" name="message" class="errors" role="status"></div>
</span>
</br>
<span id="divcustshortname${pageId}" class="fieldcontain  ">
    <label for="custshortname">
        <g:message code="bdCubasdoc.custshortname.label" default="Custshortname" />

    </label>
    <g:textField class="easyui-validatebox myui" name="custshortname" value="${bdCubasdocInstance?.custshortname}"/>
    <div id="custshortname_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divengname${pageId}" class="fieldcontain  ">
    <label for="engname">
        <g:message code="bdCubasdoc.engname.label" default="Engname" />

    </label>
    <g:textField class="easyui-validatebox myui" name="engname" value="${bdCubasdocInstance?.engname}"/>
    <div id="engname_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divmnecode${pageId}" class="fieldcontain  ">
    <label for="mnecode">
        <g:message code="bdCubasdoc.mnecode.label" default="Mnecode" />

    </label>
    <g:textField class="easyui-validatebox myui" name="mnecode" value="${bdCubasdocInstance?.mnecode}"/>
    <div id="mnecode_message" hidden="" name="message" class="errors" role="status"></div>
</span>
<p></p>
<span id="divsignClient${pageId}" class="fieldcontain  ">
    <label for="signClient">
        <g:message code="bdCubasdoc.signClient.label" default="Sign Client" />

    </label>
    <g:checkBox name="signClient" value="${bdCubasdocInstance?.signClient}" />
    <div id="signClient_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divtrader${pageId}" class="fieldcontain  ">
    <label for="trader">
        <g:message code="bdCubasdoc.trader.label" default="Trader" />

    </label>
    <g:checkBox name="trader" value="${bdCubasdocInstance?.trader}" />
    <div id="trader_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divdeliveryCorp${pageId}" class="fieldcontain  ">
    <label for="deliveryCorp">
        <g:message code="bdCubasdoc.deliveryCorp.label" default="Delivery Corp" />

    </label>
    <g:checkBox name="deliveryCorp" value="${bdCubasdocInstance?.deliveryCorp}" />
    <div id="deliveryCorp_message" hidden="" name="message" class="errors" role="status"></div>
</span>
<br>
<span id="divagentCorp${pageId}" class="fieldcontain  ">
    <label for="agentCorp">
        <g:message code="bdCubasdoc.agentCorp.label" default="Agent Corp" />

    </label>
    <g:checkBox name="agentCorp" value="${bdCubasdocInstance?.agentCorp}" />
    <div id="agentCorp_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divopeningCorp${pageId}" class="fieldcontain  ">
    <label for="openingCorp">
        <g:message code="bdCubasdoc.openingCorp.label" default="Opening Corp" />

    </label>
    <g:checkBox name="openingCorp" value="${bdCubasdocInstance?.openingCorp}" />
    <div id="openingCorp_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divexchange${pageId}" class="fieldcontain  ">
    <label for="exchange">
        <g:message code="bdCubasdoc.exchange.label" default="Exchange" />

    </label>
    <g:checkBox name="exchange" value="${bdCubasdocInstance?.exchange}" />
    <div id="exchange_message" hidden="" name="message" class="errors" role="status"></div>
</span>
<br>
<span id="divtransitwarehouse${pageId}" class="fieldcontain  ">
    <label for="transitwarehouse">
        <g:message code="bdCubasdoc.transitwarehouse.label" default="Transitwarehouse" />

    </label>
    <g:checkBox name="transitwarehouse" value="${bdCubasdocInstance?.transitwarehouse}" />
    <div id="transitwarehouse_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divuseWhenStorage${pageId}" class="fieldcontain  ">
    <label for="useWhenStorage">
        <g:message code="bdCubasdoc.useWhenStorage.label" default="Use When Storage" />

    </label>
    <g:checkBox name="useWhenStorage" value="${bdCubasdocInstance?.useWhenStorage}" />
    <div id="useWhenStorage_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<p></p>
<span id="divlegalbody${pageId}" class="fieldcontain  ">
    <label for="legalbody">
        <g:message code="bdCubasdoc.legalbody.label" default="Legalbody" />

    </label>
    <g:textField class="easyui-validatebox myui" name="legalbody" value="${bdCubasdocInstance?.legalbody}"/>
    <div id="legalbody_message" hidden="" name="message" class="errors" role="status"></div>
</span>



<span id="divconaddr${pageId}" class="fieldcontain  ">
    <label for="conaddr">
        <g:message code="bdCubasdoc.conaddr.label" default="Conaddr" />

    </label>
    <g:textField class="easyui-validatebox myui" name="conaddr" value="${bdCubasdocInstance?.conaddr}"/>
    <div id="conaddr_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divmobilephone1${pageId}" class="fieldcontain  ">
    <label for="mobilephone1">
        <g:message code="bdCubasdoc.mobilephone1.label" default="Mobilephone1" />

    </label>
    <g:textField class="easyui-validatebox myui" name="mobilephone1" value="${bdCubasdocInstance?.mobilephone1}"/>
    <div id="mobilephone1_message" hidden="" name="message" class="errors" role="status"></div>
</span>
<br>
<span id="divfax${pageId}" class="fieldcontain  ">
    <label for="fax">
        <g:message code="bdCubasdoc.fax.label" default="Fax" />

    </label>
    <g:textField class="easyui-validatebox myui" name="fax" value="${bdCubasdocInstance?.fax}"/>
    <div id="fax_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divurl${pageId}" class="fieldcontain  ">
    <label for="url">
        <g:message code="bdCubasdoc.url.label" default="Url" />

    </label>
    <g:field type="url" class="easyui-validatebox myui" data-options="validType:'url'" name="url" value="${bdCubasdocInstance?.url}"/>
    <div id="url_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divzipcode${pageId}" class="fieldcontain  ">
    <label for="zipcode">
        <g:message code="bdCubasdoc.zipcode.label" default="Zipcode" />

    </label>
    <g:textField class="easyui-validatebox myui" name="zipcode" value="${bdCubasdocInstance?.zipcode}"/>
    <div id="zipcode_message" hidden="" name="message" class="errors" role="status"></div>
</span>
<br>
<span id="divemail${pageId}" class="fieldcontain  ">
    <label for="email">
        <g:message code="bdCubasdoc.email.label" default="Email" />

    </label>
    <g:textField class="easyui-validatebox myui" name="email" value="${bdCubasdocInstance?.email}"/>
    <div id="email_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divrecordInfo${pageId}" class="fieldcontain  ">
    <label for="recordInfo">
        <g:message code="bdCubasdoc.recordInfo.label" default="Record Info" />

    </label>
    <g:textField class="easyui-validatebox myui" name="recordInfo" value="${bdCubasdocInstance?.recordInfo}"/>
    <div id="recordInfo_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divsampleGuarantee${pageId}" class="fieldcontain  ">
    <label for="sampleGuarantee">
        <g:message code="bdCubasdoc.sampleGuarantee.label" default="Sample Guarantee" />

    </label>
    <input style="width:150px" name="sampleGuarantee" id="sampleGuarantee" value="${bdCubasdocInstance?.sampleGuarantee?.getTime()}" date class="easyui-datebox"/>
    <div id="sampleGuarantee_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<p></p>
<span id="divcontractLinkman${pageId}" class="fieldcontain  ">
    <label for="contractLinkman">
        <g:message code="bdCubasdoc.contractLinkman.label" default="Contract Linkman" />

    </label>
    <g:textField class="easyui-validatebox myui" name="contractLinkman" value="${bdCubasdocInstance?.contractLinkman}"/>
    <div id="contractLinkman_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divphone1${pageId}" class="fieldcontain  ">
    <label for="phone1">
        <g:message code="bdCubasdoc.phone1.label" default="Phone1" />

    </label>
    <g:textField class="easyui-validatebox myui" name="phone1" value="${bdCubasdocInstance?.phone1}"/>
    <div id="phone1_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divfax1${pageId}" class="fieldcontain  ">
    <label for="fax1">
        <g:message code="bdCubasdoc.fax1.label" default="Fax1" />

    </label>
    <g:textField class="easyui-validatebox myui" name="fax1" value="${bdCubasdocInstance?.fax1}"/>
    <div id="fax1_message" hidden="" name="message" class="errors" role="status"></div>
</span>
<br>
<span id="divinvoiceLinkman${pageId}" class="fieldcontain  ">
    <label for="invoiceLinkman">
        <g:message code="bdCubasdoc.invoiceLinkman.label" default="Invoice Linkman" />

    </label>
    <g:textField class="easyui-validatebox myui" name="invoiceLinkman" value="${bdCubasdocInstance?.invoiceLinkman}"/>
    <div id="invoiceLinkman_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divphone2${pageId}" class="fieldcontain  ">
    <label for="phone2">
        <g:message code="bdCubasdoc.phone2.label" default="Phone2" />

    </label>
    <g:textField class="easyui-validatebox myui" name="phone2" value="${bdCubasdocInstance?.phone2}"/>
    <div id="phone2_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divfax2${pageId}" class="fieldcontain  ">
    <label for="fax2">
        <g:message code="bdCubasdoc.fax2.label" default="Fax2" />

    </label>
    <g:textField class="easyui-validatebox myui" name="fax2" value="${bdCubasdocInstance?.fax2}"/>
    <div id="fax2_message" hidden="" name="message" class="errors" role="status"></div>
</span>
<br>

<span id="divcontractInvoiceMailingAddress${pageId}" class="fieldcontain  ">
    <label for="contractInvoiceMailingAddress">
        <g:message code="bdCubasdoc.contractInvoiceMailingAddress.label" default="Contract Invoice Mailing Address" />

    </label>
    <g:textField class="easyui-validatebox myui" name="contractInvoiceMailingAddress" value="${bdCubasdocInstance?.contractInvoiceMailingAddress}"/>
    <div id="contractInvoiceMailingAddress_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divaccountStatementMailingAddress${pageId}" class="fieldcontain  ">
    <label for="accountStatementMailingAddress">
        <g:message code="bdCubasdoc.accountStatementMailingAddress.label" default="Account Statement Mailing Address" />

    </label>
    <g:textField class="easyui-validatebox myui" name="accountStatementMailingAddress" value="${bdCubasdocInstance?.accountStatementMailingAddress}"/>
    <div id="accountStatementMailingAddress_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divconsignee${pageId}" class="fieldcontain  ">
    <label for="consignee">
        <g:message code="bdCubasdoc.consignee.label" default="Consignee" />

    </label>
    <g:textField class="easyui-validatebox myui" name="consignee" value="${bdCubasdocInstance?.consignee}"/>
    <div id="consignee_message" hidden="" name="message" class="errors" role="status"></div>
</span>
<br>
<span id="divzipcode1${pageId}" class="fieldcontain  ">
    <label for="zipcode1">
        <g:message code="bdCubasdoc.zipcode1.label" default="Zipcode1" />

    </label>
    <g:textField class="easyui-validatebox myui" name="zipcode1" value="${bdCubasdocInstance?.zipcode1}"/>
    <div id="zipcode1_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divphone3${pageId}" class="fieldcontain  ">
    <label for="phone3">
        <g:message code="bdCubasdoc.phone3.label" default="Phone3" />

    </label>
    <g:textField class="easyui-validatebox myui" name="phone3" value="${bdCubasdocInstance?.phone3}"/>
    <div id="phone3_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divfax3${pageId}" class="fieldcontain  ">
    <label for="fax3">
        <g:message code="bdCubasdoc.fax3.label" default="Fax3" />

    </label>
    <g:textField class="easyui-validatebox myui" name="fax3" value="${bdCubasdocInstance?.fax3}"/>
    <div id="fax3_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<p></p>
<span id="divcommercialInstruments${pageId}" class="fieldcontain  ">
    <label for="commercialInstruments">
        <g:message code="bdCubasdoc.commercialInstruments.label" default="Commercial Instruments" />

    </label>
    <g:textField class="easyui-validatebox myui" name="commercialInstruments" value="${bdCubasdocInstance?.commercialInstruments}"/>
    <div id="commercialInstruments_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divorganizationalSetupCard${pageId}" class="fieldcontain  ">
    <label for="organizationalSetupCard">
        <g:message code="bdCubasdoc.organizationalSetupCard.label" default="Organizational Setup Card" />

    </label>
    <g:textField class="easyui-validatebox myui" name="organizationalSetupCard" value="${bdCubasdocInstance?.organizationalSetupCard}"/>
    <div id="organizationalSetupCard_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divtaxRegistryNo${pageId}" class="fieldcontain  ">
    <label for="taxRegistryNo">
        <g:message code="bdCubasdoc.taxRegistryNo.label" default="Tax Registry No" />

    </label>
    <g:textField class="easyui-validatebox myui" name="taxRegistryNo" value="${bdCubasdocInstance?.taxRegistryNo}"/>
    <div id="taxRegistryNo_message" hidden="" name="message" class="errors" role="status"></div>
</span>
<br>
<span id="divgrade${pageId}" class="fieldcontain  ">
    <label for="grade">
        <g:message code="bdCubasdoc.grade.label" default="Grade" />

    </label>
    <g:textField class="easyui-validatebox myui" name="grade" value="${bdCubasdocInstance?.grade}"/>
    <div id="grade_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divcreditmny${pageId}" class="fieldcontain  ">
    <label for="creditmny">
        <g:message code="bdCubasdoc.creditmny.label" default="Creditmny" />

    </label>
    <g:field name="creditmny" class="easyui-numberbox myui" value="${fieldValue(bean: bdCubasdocInstance, field: 'creditmny')}"/>
    <div id="creditmny_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divaccountsReceivablePeriod${pageId}" class="fieldcontain  ">
    <label for="accountsReceivablePeriod">
        <g:message code="bdCubasdoc.accountsReceivablePeriod.label" default="Accounts Receivable Period" />

    </label>
    <g:field name="accountsReceivablePeriod" class="easyui-numberbox myui" value="${fieldValue(bean: bdCubasdocInstance, field: 'accountsReceivablePeriod')}"/>
    <div id="accountsReceivablePeriod_message" hidden="" name="message" class="errors" role="status"></div>
</span>
<br>
<span id="divaccountsPayablePeriod${pageId}" class="fieldcontain  ">
    <label for="accountsPayablePeriod">
        <g:message code="bdCubasdoc.accountsPayablePeriod.label" default="Accounts Payable Period" />

    </label>
    <g:field name="accountsPayablePeriod" class="easyui-numberbox myui" value="${fieldValue(bean: bdCubasdocInstance, field: 'accountsPayablePeriod')}"/>
    <div id="accountsPayablePeriod_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<p></p>
<span id="divmsgservice${pageId}" class="fieldcontain  ">
    <label for="msgservice">
        <g:message code="bdCubasdoc.msgservice.label" default="Msgservice" />

    </label>
    <g:checkBox name="msgservice" value="${bdCubasdocInstance?.msgservice}" />
    <div id="msgservice_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divemailservice${pageId}" class="fieldcontain  ">
    <label for="emailservice">
        <g:message code="bdCubasdoc.emailservice.label" default="Emailservice" />

    </label>
    <g:checkBox name="emailservice" value="${bdCubasdocInstance?.emailservice}" />
    <div id="emailservice_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divasOwnerNotify${pageId}" class="fieldcontain  ">
    <label for="asOwnerNotify">
        <g:message code="bdCubasdoc.asOwnerNotify.label" default="As Owner Notify" />

    </label>
    <g:checkBox name="asOwnerNotify" value="${bdCubasdocInstance?.asOwnerNotify}" />
    <div id="asOwnerNotify_message" hidden="" name="message" class="errors" role="status"></div>
</span>
<br>
<span id="divdeliveryNotify${pageId}" class="fieldcontain  ">
    <label for="deliveryNotify">
        <g:message code="bdCubasdoc.deliveryNotify.label" default="Delivery Notify" />

    </label>
    <g:checkBox name="deliveryNotify" value="${bdCubasdocInstance?.deliveryNotify}" />
    <div id="deliveryNotify_message" hidden="" name="message" class="errors" role="status"></div>
</span>

</br>

<span id="divreceivePhone${pageId}" class="fieldcontain  ">
    <label for="receivePhone">
        <g:message code="bdCubasdoc.receivePhone.label" default="Receive Phone" />

    </label>
    <g:textField class="easyui-validatebox myui" name="receivePhone" value="${bdCubasdocInstance?.receivePhone}"/>
    <div id="receivePhone_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divtextShort${pageId}" class="fieldcontain  ">
    <label for="textShort">
        <g:message code="bdCubasdoc.textShort.label" default="Text Short" />

    </label>
    <g:textField class="easyui-validatebox myui" name="textShort" value="${bdCubasdocInstance?.textShort}"/>
    <div id="textShort_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divreceiveEmail${pageId}" class="fieldcontain  ">
    <label for="receiveEmail">
        <g:message code="bdCubasdoc.receiveEmail.label" default="Receive Email" />

    </label>
    <g:textField class="easyui-validatebox myui" name="receiveEmail" value="${bdCubasdocInstance?.receiveEmail}"/>
    <div id="receiveEmail_message" hidden="" name="message" class="errors" role="status"></div>
</span>
<p></p>
<span id="divmemo${pageId}" class="fieldcontain  ">
    <label for="memo">
        <g:message code="bdCubasdoc.memo.label" default="Memo" />

    </label>
    <g:textArea class="easyui-validatebox myui" name="memo" value="${bdCubasdocInstancbdCubasdocInstancee?.memo}" style="width:100pt;height:100pt;"/>
    <div id="memo_message" hidden="" name="message" class="errors" role="status"></div>
</span>


