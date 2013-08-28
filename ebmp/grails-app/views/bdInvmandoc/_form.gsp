<%@ page import="com.app.bd.invmandoc.BdInvmandoc" %>

<g:hiddenField name="id" value="${bdInvmandocInstance?.id}" />
<g:hiddenField name="version" value="${bdInvmandocInstance?.version}" />


<span id="divinvcode${pageId}" class="fieldcontain  required">
    <label for="invcode">
        <g:message code="bdInvbasdoc.invcode.label" default="Invcode" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox myui" name="invcode" required="true" value="${bdInvmandocInstance?.pkInvbasdoc?.invcode}" disabled="true"/>
</span>


<span id="divinvname${pageId}" class="fieldcontain  required">
    <label for="invname">
        <g:message code="bdInvbasdoc.invname.label" default="Invname" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox myui" name="invname" required="true" value="${bdInvmandocInstance?.pkInvbasdoc?.invname}" disabled="true"/>
</span>

<span id="divforinvname${pageId}" class="fieldcontain  ">
    <label for="forinvname">
        <g:message code="bdInvbasdoc.forinvname.label" default="Forinvname" />

    </label>
    <g:textField class="easyui-validatebox myui" name="forinvname" value="${bdInvmandocInstance?.pkInvbasdoc?.forinvname}" disabled="true"/>
</span>

<span id="divinvspec${pageId}" class="fieldcontain  ">
    <label for="invspec">
        <g:message code="bdInvbasdoc.invspec.label" default="Invspec" />

    </label>
    <g:textField class="easyui-validatebox myui" name="invspec" value="${bdInvmandocInstance?.pkInvbasdoc?.invspec}" disabled="true"/>
</span>


<span id="divinvtype${pageId}" class="fieldcontain  ">
    <label for="invtype">
        <g:message code="bdInvbasdoc.invtype.label" default="Invtype" />

    </label>
    <g:textField class="easyui-validatebox myui" name="invtype" value="${bdInvmandocInstance?.pkInvbasdoc?.invtype}" disabled="true"/>
</span>


<span id="divbdmeasdoc${pageId}" class="fieldcontain  ">
    <label for="bdmeasdoc">
        <g:message code="bdInvbasdoc.bdmeasdoc.label" default="Bdmeasdoc" />

    </label>
    <input id="bdmeasdoc" value="${bdInvmandocInstance?.pkInvbasdoc?.bdmeasdoc?.measname}" readonly="true" class="myui">
</span>


<span id="divpkCumandoc${pageId}" class="fieldcontain">
    <label for="pkCumandoc${pageId}">
        <g:message code="bdInvmandoc.pkCumandoc.label" default="主供应商" />
    </label>
    <g:refTemplate code="refBdVender" model="[id:'pkCumandoc',name:'pkCumandoc.id',value:bdInvmandocInstance?.pkCumandoc?.id]"></g:refTemplate>
    %{--<g:select id="pkCumandoc" name="pkCumandoc.id" from="${com.app.bd.cumandoc.BdCumandoc.list()}" optionKey="id" optionValue="pkCumandoc.pkCubasdoc.custname" value="${bdInvmandocInstance?.pkCumandoc?.id}" class="many-to-one" noSelection="['null':'']"/>--}%
</span>


<span id="divrefSalePrice${pageId}" class="fieldcontain  ">
    <label for="refSalePrice">
        <g:message code="bdInvmandoc.refSalePrice.label" default="参考售价" />

    </label>
    <g:field name="refSalePrice" class="easyui-numberbox myui" value="${fieldValue(bean: bdInvmandocInstance, field: 'refSalePrice')}"/>
</span>

<span id="divlowestPrice${pageId}" class="fieldcontain  ">
    <label for="lowestPrice">
        <g:message code="bdInvmandoc.lowestPrice.label" default="最低售价" />
        
    </label>
    <g:field name="lowestPrice" class="easyui-numberbox myui" value="${fieldValue(bean: bdInvmandocInstance, field: 'lowestPrice')}"/>
</span>


<span id="divmantaxItem${pageId}" class="fieldcontain  ">
    <label for="mantaxItem">
        <g:message code="bdInvmandoc.mantaxItem.label" default="税目" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="mantaxItem" value="${bdInvmandocInstance?.mantaxItem}"/>
</span>


<span id="divmaxPrice${pageId}" class="fieldcontain  ">
    <label for="maxPrice">
        <g:message code="bdInvmandoc.maxPrice.label" default="最高限价" />
        
    </label>
    <g:field name="maxPrice" class="easyui-numberbox myui" value="${fieldValue(bean: bdInvmandocInstance, field: 'maxPrice')}"/>
</span>




<span id="divprodArea${pageId}" class="fieldcontain  ">
    <label for="prodArea">
        <g:message code="bdInvmandoc.prodArea.label" default="产地" />

    </label>
    <g:textField class="easyui-validatebox myui" name="prodArea" value="${bdInvmandocInstance?.prodArea}"/>
</span>
<br>
<span id="divkeepWasteRate${pageId}" class="fieldcontain  ">
    <label for="keepWasteRate">
        <g:message code="bdInvmandoc.keepWasteRate.label" default="保管损耗率" />

    </label>
    <g:field name="keepWasteRate" class="easyui-numberbox myui" value="${fieldValue(bean: bdInvmandocInstance, field: 'keepWasteRate')}"/>
</span>




<span id="divoutPriority${pageId}" class="fieldcontain  ">
    <label for="outPriority">
        <g:message code="bdInvmandoc.outPriority.label" default="出库优先级" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="outPriority" value="${bdInvmandocInstance?.outPriority}"/>
</span>





<span id="divqualityDayNum${pageId}" class="fieldcontain  ">
    <label for="qualityDayNum">
        <g:message code="bdInvmandoc.qualityDayNum.label" default="保质期" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="qualityDayNum" value="${bdInvmandocInstance?.qualityDayNum}"/>
</span>



<span id="divqualityPeriodUnit${pageId}" class="fieldcontain  ">
    <label for="qualityPeriodUnit">
        <g:message code="bdInvmandoc.qualityPeriodUnit.label" default="保质期单位" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="qualityPeriodUnit" value="${bdInvmandocInstance?.qualityPeriodUnit}"/>
</span>


<span id="divrecurrentchkcyc${pageId}" class="fieldcontain  ">
    <label for="recurrentchkcyc">
        <g:message code="bdInvmandoc.recurrentchkcyc.label" default="定期检验周期" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="recurrentchkcyc" value="${bdInvmandocInstance?.recurrentchkcyc}"/>
</span>



<span id="divaccFlag${pageId}" class="fieldcontain  ">
    <label for="accFlag">
        <g:message code="bdInvmandoc.accFlag.label" default="是否辅币核算成本" />

    </label>
    <g:checkBox name="accFlag" value="${bdInvmandocInstance?.accFlag}" />
</span>

<span id="divnegAllowed${pageId}" class="fieldcontain  ">
    <label for="negAllowed">
        <g:message code="bdInvmandoc.negAllowed.label" default="是否允许负库存" />

    </label>
    <g:checkBox name="negAllowed" value="${bdInvmandocInstance?.negAllowed}" />
</span>


<span id="divoutTrackIn${pageId}" class="fieldcontain  ">
    <label for="outTrackIn">
        <g:message code="bdInvmandoc.outTrackIn.label" default="是否出库跟踪入库" />

    </label>
    <g:checkBox name="outTrackIn" value="${bdInvmandocInstance?.outTrackIn}" />
</span>

<span id="divqualityManFlag${pageId}" class="fieldcontain  ">
    <label for="qualityManFlag">
        <g:message code="bdInvmandoc.qualityManFlag.label" default="是否保质期管理" />

    </label>
    <g:checkBox name="qualityManFlag" value="${bdInvmandocInstance?.qualityManFlag}" />
</span>



<span id="divserialManaFlag${pageId}" class="fieldcontain  ">
    <label for="serialManaFlag">
        <g:message code="bdInvmandoc.serialManaFlag.label" default="是否进行序列号管理" />
        
    </label>
    <g:checkBox name="serialManaFlag" value="${bdInvmandocInstance?.serialManaFlag}" />
</span>


<span id="divwholemanaflag${pageId}" class="fieldcontain  ">
    <label for="wholemanaflag">
        <g:message code="bdInvmandoc.wholemanaflag.label" default="是否批次管理" />
        
    </label>
    <g:checkBox name="wholemanaflag" value="${bdInvmandocInstance?.wholemanaflag}" />
</span>

<span id="divsealFlag${pageId}" class="fieldcontain  ">
    <label for="sealFlag">
        <g:message code="bdInvmandoc.sealFlag.label" default="封存标志" />

    </label>
    <g:checkBox name="sealFlag" value="${bdInvmandocInstance?.sealFlag}" />
</span>


<span id="divcinvmneCode${pageId}" class="fieldcontain  ">
    <label for="cinvmneCode">
        <g:message code="bdInvmandoc.cinvmneCode.label" default="助记码" />

    </label>
    <g:textField class="easyui-validatebox myui" name="cinvmneCode" value="${bdInvmandocInstance?.cinvmneCode}"/>
</span>
<br>

<span id="divmemo${pageId}" class="fieldcontain  ">
    <label for="memo">
        <g:message code="bdInvmandoc.memo.label" default="备注" />

    </label>
    <g:textArea class="easyui-validatebox myui" name="memo" value="${bdInvmandocInstance?.memo}" style="width:100pt;height:80pt;"/>
</span>