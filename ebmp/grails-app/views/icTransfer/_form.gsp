<%@ page import="com.app.ic.special.IcSpecial" %>

<g:hiddenField name="id" value="${icSpecialInstance?.id}" />
<g:hiddenField name="version" value="${icSpecialInstance?.version}" />
<g:hiddenField name="businessType.id" value="${icSpecialInstance?.businessType?.id}"/>
<g:hiddenField name="billTypeCode" value="${icSpecialInstance?.billTypeCode}" ></g:hiddenField>
<g:hiddenField name="billtype.id" value="${icSpecialInstance?.billtype?.id}" ></g:hiddenField>
<g:hiddenField name="sourceBillType.id" value="${icSpecialInstance?.sourceBillType?.id}" ></g:hiddenField>
<g:hiddenField name="bdCorp.id" value="${icSpecialInstance?.bdCorp?.id}"></g:hiddenField>


%{--<span  class="fieldcontain  ">--}%
    %{--<label for="businessType${pageId}"  >--}%
        %{--<g:message code="icSpecial.businessType.label" default="Business Type" />--}%

    %{--</label>--}%


    %{--<input id="businessType${pageId}" name="businessType"  value="${icSpecialInstance?.businessType?.name}" disabled="true"   >--}%

%{--</span>--}%
<span  class="fieldcontain  ">
    <label for="billno${pageId}"  >
        <g:message code="icSpecial.billno.label" default="Billno" />

    </label>


    <input id="billno${pageId}" name="billno"  value="${icSpecialInstance?.billno}" disabled="true"   >

</span>




<span  class="fieldcontain  required">
    <label for="billdate${pageId}"  >
        <g:message code="icSpecial.billdate.label" default="Billdate" />
    </label>

    
    <input id="billdate${pageId}" name="billdate"   value="${icSpecialInstance?.billdate?.getTime()}" class="easyui-datebox" date validType="dateValidate" >
    
</span>







<span  class="fieldcontain  required">
    <label for="inwarehouse${pageId}" class="required" >
        <g:message code="icSpecial.inwarehouse.label" default="Inwarehouse" />
        <span class="required-indicator">*</span>
    </label>

    


    <g:refTemplate code="refBdStordoc" model="[id:'inwarehouse',name:'inwarehouse.id',value:icSpecialInstance?.inwarehouse?.id]"></g:refTemplate>

    
</span>



<span  class="fieldcontain  required">
    <label for="outwarehouse${pageId}" class="required" >
        <g:message code="icSpecial.outwarehouse.label" default="Outwarehouse" />
        <span class="required-indicator">*</span>
    </label>

    


    <g:refTemplate code="refBdStordoc" model="[id:'outwarehouse',name:'outwarehouse.id',value:icSpecialInstance?.outwarehouse?.id]"></g:refTemplate>

    
</span>



<span  class="fieldcontain  ">
    <label for="adjuster${pageId}"  >
        <g:message code="icSpecial.adjuster.label" default="Adjuster" />
        
    </label>

    


    <g:refTemplate code="refBdPsndoc" model="[id:'adjuster',name:'adjuster.id',value:icSpecialInstance?.adjuster?.id]"></g:refTemplate>

    
</span>





%{--<span  class="fieldcontain  ">--}%
    %{--<label for="inbsr${pageId}"  >--}%
        %{--<g:message code="icSpecial.inbsr.label" default="Inbsr" />--}%

    %{--</label>--}%




    %{--<g:refTemplate code="refBdPsndoc" model="[id:'inbsr',name:'inbsr.id',value:icSpecialInstance?.inbsr?.id]"></g:refTemplate>--}%


%{--</span>--}%



%{--<span  class="fieldcontain  ">--}%
    %{--<label for="indept${pageId}"  >--}%
        %{--<g:message code="icSpecial.indept.label" default="Indept" />--}%

    %{--</label>--}%




    %{--<g:refTemplate code="refBdDeptdoc" model="[id:'indept',name:'indept.id',value:icSpecialInstance?.indept?.id]"></g:refTemplate>--}%


%{--</span>--}%







<span  class="fieldcontain  ">
    <label for="cshlddiliverdate${pageId}"  >
        <g:message code="icSpecial.cshlddiliverdate.label" default="Cshlddiliverdate" />
        
    </label>

    
    <input id="cshlddiliverdate${pageId}" name="cshlddiliverdate"   value="${icSpecialInstance?.cshlddiliverdate?.getTime()}" class="easyui-datebox" date validType="dateValidate" >
    
</span>












%{--<span  class="fieldcontain  ">--}%
    %{--<label for="outbsor${pageId}"  >--}%
        %{--<g:message code="icSpecial.outbsor.label" default="Outbsor" />--}%
        %{----}%
    %{--</label>--}%

    %{----}%


    %{--<g:refTemplate code="refBdPsndoc" model="[id:'outbsor',name:'outbsor.id',value:icSpecialInstance?.outbsor?.id]"></g:refTemplate>--}%

    %{----}%
%{--</span>--}%



%{--<span  class="fieldcontain  ">--}%
    %{--<label for="outdeptid${pageId}"  >--}%
        %{--<g:message code="icSpecial.outdeptid.label" default="Outdeptid" />--}%
        %{----}%
    %{--</label>--}%

    %{----}%


    %{--<g:refTemplate code="refBdDeptdoc" model="[id:'outdeptid',name:'outdeptid.id',value:icSpecialInstance?.outdeptid?.id]"></g:refTemplate>--}%

    %{----}%
%{--</span>--}%



%{--<span  class="fieldcontain  ">--}%
    %{--<label for="shldarrivedate${pageId}"  >--}%
        %{--<g:message code="icSpecial.shldarrivedate.label" default="Shldarrivedate" />--}%
        %{----}%
    %{--</label>--}%

    %{----}%
    %{--<input id="shldarrivedate${pageId}" name="shldarrivedate"   value="${icSpecialInstance?.shldarrivedate}" class="easyui-datebox" date validType="dateValidate" >--}%
    %{----}%
%{--</span>--}%







<span  class="fieldcontain  ">
    <label for="vnote${pageId}"  >
        <g:message code="icSpecial.vnote.label" default="Vnote" />
        
    </label>

    
    <input id="vnote${pageId}" name="vnote"  value="${icSpecialInstance?.vnote}">
    
</span>


<p>其他</p>

<span  class="fieldcontain  ">
    <label for="maker${pageId}"  >
        <g:message code="icSpecial.maker.label" default="Maker" />

    </label>


    <g:hiddenField name="maker.id" value="${icSpecialInstance?.maker?.id}"></g:hiddenField>
    <input id="maker${pageId}" name="maker" value="${icSpecialInstance?.maker?.userRealName}" disabled="true"   canSave="false">

</span>


<span  class="fieldcontain  ">
    <label for="makeDate${pageId}"  >
        <g:message code="icSpecial.makeDate.label" default="Make Date" />

    </label>


    <g:hiddenField name="makeDate" value="${icSpecialInstance?.makeDate?.getTime()}"></g:hiddenField>
    <input id="makeDate${pageId}" name="makeDate" value="${icSpecialInstance?.makeDate?.getTime()}" disabled="true" date  >

</span>


<span  class="fieldcontain  ">
    <label for="checker${pageId}"  >
        <g:message code="icSpecial.checker.label" default="Checker" />

    </label>


    <input id="checker${pageId}" name="checker" value="${icSpecialInstance?.checker?.userRealName}" disabled="true"   canSave="false">

</span>


<span  class="fieldcontain  ">
    <label for="checkDate${pageId}"  >
        <g:message code="icSpecial.checkDate.label" default="Check Date" />

    </label>


    <g:hiddenField name="checkDate" value="${icSpecialInstance?.checkDate?.getTime()}"></g:hiddenField>
    <input id="checkDate${pageId}" name="checkDate" value="${icSpecialInstance?.checkDate?.getTime()}" disabled="true" date  >

</span>



<span  class="fieldcontain  ">
    <label for="bdCorp${pageId}"  >
        <g:message code="icSpecial.bdCorp.label" default="Bd Corp" />

    </label>


    <input id="bdCorp${pageId}" name="bdCorp" value="${icSpecialInstance?.bdCorp?.unitName}" disabled="true"   canSave="false">

</span>