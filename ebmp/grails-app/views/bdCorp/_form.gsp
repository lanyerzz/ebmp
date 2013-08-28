<%@ page import="com.app.bd.corp.BdCorp" %>


<g:hiddenField name="id" value="${bdCorpInstance?.id}" />
<g:hiddenField name="version" value="${bdCorpInstance?.version}" />

<g:hiddenField  name="fathercorp" value="${bdCorpInstance?.fathercorp}"/>


<div id="divunitCode${pageId}}" class="fieldcontain  ">
    <label for="unitCode">
        <g:message code="bdCorp.unitCode.label" default="公司编码" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox myui" name="unitCode" maxlength="40" value="${bdCorpInstance?.unitCode}" required="true"/>

</div>


<div id="divunitName${pageId}}" class="fieldcontain  ">
    <label for="unitName">
        <g:message code="bdCorp.unitName.label" default="公司名称" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox myui" name="unitName" maxlength="50" value="${bdCorpInstance?.unitName}" required="true"/>

</div>

<div id="divunitshortname${pageId}}" class="fieldcontain  ">
    <label for="unitshortname">
        <g:message code="bdCorp.unitshortname.label" default="公司简称" />

    </label>
    <g:textField class="easyui-validatebox myui" name="unitshortname" value="${bdCorpInstance?.unitshortname}"/>

</div>

<div id="divforeignname${pageId}}" class="fieldcontain  ">
    <label for="foreignname">
        <g:message code="bdCorp.foreignname.label" default="外文名称" />

    </label>
    <g:textField class="easyui-validatebox myui" name="foreignname" value="${bdCorpInstance?.foreignname}"/>

</div>


<div id="divbegindate${pageId}" class="fieldcontain  ">
    <label for="begindate">
        <g:message code="bdCorp.begindate.label" default="业务开始日期" />
        
    </label>
    <input  name="begindate" id="begindate"  value="${bdCorpInstance?.begindate?.getTime() }" date class="easyui-datebox"  />

</div>


<div id="divenddate${pageId}" class="fieldcontain  ">
    <label for="enddate">
        <g:message code="bdCorp.enddate.label" default="业务结束日期" />
    </label>
    %{--<input name="enddate" id="enddate"  value="${formatDate(date:bdCorpInstance?.enddate,timeZone: TimeZone.getTimeZone("UTC")) }" date type="date"/>--}%
    <input  name="enddate" id="enddate"   value="${bdCorpInstance?.enddate?.getTime() }" date class="easyui-datebox"  />

</div>



<div id="divcurrencyType${pageId}}" class="fieldcontain  ">
    <label for="currencyType">
        <g:message code="bdCorp.currencyType.label" default="币种" />
        
    </label>

      <g:refTemplate  code="refBdCurrtype" model="[id:'currencyType'+pageId,name:'currencyType.id',value:bdCorpInstance?.currencyType?.id]"></g:refTemplate>


</div>

<div id="divurl${pageId}}" class="fieldcontain  ">
    <label for="url">
        <g:message code="bdCorp.url.label" default="Web网址" />

    </label>
    <g:field type="url" class="easyui-validatebox myui" data-options="validType:'url'" name="url" maxlength="100" value="${bdCorpInstance?.url}"/>

</div>


<div id="divfax1${pageId}}" class="fieldcontain  ">
    <label for="fax1">
        <g:message code="bdCorp.fax1.label" default="传真1" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="fax1" value="${bdCorpInstance?.fax1}"/>

</div>


<div id="divfax2${pageId}}" class="fieldcontain  ">
    <label for="fax2">
        <g:message code="bdCorp.fax2.label" default="传真2" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="fax2" value="${bdCorpInstance?.fax2}"/>

</div>


<div id="divishasaccount${pageId}}" class="fieldcontain  ">
    <label for="ishasaccount">
        <g:message code="bdCorp.ishasaccount.label" default="是否已建帐" />
        
    </label>
    <g:checkBox name="ishasaccount" value="${bdCorpInstance?.ishasaccount}" />

</div>


<div id="divisseal${pageId}}" class="fieldcontain  ">
    <label for="isseal">
        <g:message code="bdCorp.isseal.label" default="是否封存" />
        
    </label>
    <g:checkBox name="isseal" value="${bdCorpInstance?.isseal}" />

</div>


<div id="divmemo${pageId}}" class="fieldcontain  ">
    <label for="memo">
        <g:message code="bdCorp.memo.label" default="备注" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="memo" value="${bdCorpInstance?.memo}"/>

</div>


<div id="divphone1${pageId}}" class="fieldcontain  ">
    <label for="phone1">
        <g:message code="bdCorp.phone1.label" default="电话1" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="phone1" value="${bdCorpInstance?.phone1}"/>

</div>


<div id="divphone2${pageId}}" class="fieldcontain  ">
    <label for="phone2">
        <g:message code="bdCorp.phone2.label" default="电话2" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="phone2" value="${bdCorpInstance?.phone2}"/>

</div>


<div id="divphone3${pageId}}" class="fieldcontain  ">
    <label for="phone3">
        <g:message code="bdCorp.phone3.label" default="电话3" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="phone3" value="${bdCorpInstance?.phone3}"/>

</div>



<div id="divzipCode${pageId}}" class="fieldcontain  ">
    <label for="zipCode">
        <g:message code="bdCorp.zipCode.label" default="邮政编码" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="zipCode" value="${bdCorpInstance?.zipCode}"/>

</div>

<div id="divbriefintro${pageId}}" class="fieldcontain  ">
    <label for="briefintro">
        <g:message code="bdCorp.briefintro.label" default="简介" />

    </label>
    <g:textField class="easyui-validatebox myui" name="briefintro" value="${bdCorpInstance?.briefintro}"/>

</div>

