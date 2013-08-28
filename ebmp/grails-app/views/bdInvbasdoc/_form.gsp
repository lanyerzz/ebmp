<%@ page import="com.app.bd.invbasdoc.BdInvbasdoc" %>

<g:hiddenField name="id" value="${bdInvbasdocInstance?.id}" />
<g:hiddenField name="version" value="${bdInvbasdocInstance?.version}" />
<g:hiddenField name="pkInvcl.id" value="${bdInvbasdocInstance?.pkInvcl?.id}"></g:hiddenField>



<span id="divinvcode${pageId}" class="fieldcontain  required" >
    <label for="invcode">
        <g:message code="bdInvbasdoc.invcode.label" default="Invcode" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox myui" name="invcode" required="true" value="${bdInvbasdocInstance?.invcode}"/>

</span>


<span id="divinvname${pageId}" class="fieldcontain  required">
    <label for="invname">
        <g:message code="bdInvbasdoc.invname.label" default="Invname" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox myui" name="invname" required="true" value="${bdInvbasdocInstance?.invname}"/>
</span>
<span id="divinvshortname${pageId}" class="fieldcontain  ">
    <label for="invshortname">
        <g:message code="bdInvbasdoc.invshortname.label" default="Invshortname" />

    </label>
    <g:textField class="easyui-validatebox myui" name="invshortname" value="${bdInvbasdocInstance?.invshortname}"/>
</span>
<br>
<span id="divbdmeasdoc${pageId}" class="fieldcontain  ">
    <label for="bdmeasdoc${pageId}">
        <g:message code="bdInvbasdoc.bdmeasdoc.label" default="Bdmeasdoc" />
        <span class="required-indicator">*</span>
    </label>
    <g:refTemplate  code="refBdMeasdoc"  model="[id:'bdmeasdoc',name:'bdmeasdoc.id',value:bdInvbasdocInstance?.bdmeasdoc?.id,required:true]" />

</span>


<span id="divbdmeasdoc1${pageId}" class="fieldcontain  ">
    <label for="bdmeasdoc1${pageId}">
        <g:message code="bdInvbasdoc.bdmeasdoc1.label" default="Bdmeasdoc1" />

    </label>
    <g:refTemplate  code="refBdMeasdoc" model="[id:'bdmeasdoc1',name:'bdmeasdoc1.id',value:bdInvbasdocInstance?.bdmeasdoc1?.id]" />
</span>


<span id="divbdmeasdoc2${pageId}" class="fieldcontain  ">
    <label for="bdmeasdoc2${pageId}">
        <g:message code="bdInvbasdoc.bdmeasdoc2.label" default="Bdmeasdoc2" />

    </label>
    <g:refTemplate  code="refBdMeasdoc" model="[id:'bdmeasdoc2'+pageId,name:'bdmeasdoc2.id',value:bdInvbasdocInstance?.bdmeasdoc2?.id]" />

</span>
<br>

<span id="divbdmeasdoc3${pageId}" class="fieldcontain  ">
    <label for="bdmeasdoc3${pageId}">
        <g:message code="bdInvbasdoc.bdmeasdoc3.label" default="Bdmeasdoc3" />

    </label>
    <g:refTemplate  code="refBdMeasdoc" model="[id:'bdmeasdoc3',name:'bdmeasdoc3.id',value:bdInvbasdocInstance?.bdmeasdoc3?.id]" />
</span>


<span id="divbdmeasdoc4${pageId}" class="fieldcontain  ">
    <label for="bdmeasdoc4${pageId}">
        <g:message code="bdInvbasdoc.bdmeasdoc4.label" default="Bdmeasdoc4" />

    </label>
    <g:refTemplate  code="refBdMeasdoc" model="[id:'bdmeasdoc4',name:'bdmeasdoc4.id',value:bdInvbasdocInstance?.bdmeasdoc4?.id]" />
</span>


<span id="divbdmeasdoc5${pageId}" class="fieldcontain  ">
    <label for="bdmeasdoc5${pageId}">
        <g:message code="bdInvbasdoc.bdmeasdoc5.label" default="Bdmeasdoc5" />

    </label>
    <g:refTemplate  code="refBdMeasdoc" model="[id:'bdmeasdoc5',name:'bdmeasdoc5.id',value:bdInvbasdocInstance?.bdmeasdoc5?.id]" />
</span>

<br>


<span id="divforinvname${pageId}" class="fieldcontain  ">
    <label for="forinvname">
        <g:message code="bdInvbasdoc.forinvname.label" default="Forinvname" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="forinvname" value="${bdInvbasdocInstance?.forinvname}"/>
</span>




<span id="divgraphid${pageId}" class="fieldcontain  ">
    <label for="graphid">
        <g:message code="bdInvbasdoc.graphid.label" default="Graphid" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="graphid" value="${bdInvbasdocInstance?.graphid}"/>
</span>

<span id="divinvspec${pageId}" class="fieldcontain  ">
    <label for="invspec">
        <g:message code="bdInvbasdoc.invspec.label" default="Invspec" />

    </label>
    <g:textField class="easyui-validatebox myui" name="invspec" value="${bdInvbasdocInstance?.invspec}"/>
</span>

<br>
<span id="divinvtype${pageId}" class="fieldcontain  ">
    <label for="invtype">
        <g:message code="bdInvbasdoc.invtype.label" default="Invtype" />

    </label>
    <g:textField class="easyui-validatebox myui" name="invtype" value="${bdInvbasdocInstance?.invtype}"/>
</span>


<span id="divheight${pageId}" class="fieldcontain  ">
    <label for="height">
        <g:message code="bdInvbasdoc.height.label" default="Height" />
        
    </label>
    <input id="height" name="height" class="easyui-numberbox myui" value="${fieldValue(bean: bdInvbasdocInstance, field: 'height')}"/>
</span>

<span id="divlength${pageId}" class="fieldcontain  ">
    <label for="length">
        <g:message code="bdInvbasdoc.length.label" default="Length" />

    </label>
    <input id="length" name="length" class="easyui-numberbox myui" value="${fieldValue(bean: bdInvbasdocInstance, field: 'length')}"/>
</span>
<br>
<span id="divwidth${pageId}" class="fieldcontain  ">
    <label for="width">
        <g:message code="bdInvbasdoc.width.label" default="Width" />

    </label>
    <input id="width" name="width" class="easyui-numberbox myui" value="${fieldValue(bean: bdInvbasdocInstance, field: 'width')}"/>
</span>

<span id="divinvbarcode${pageId}" class="fieldcontain  ">
    <label for="invbarcode">
        <g:message code="bdInvbasdoc.invbarcode.label" default="Invbarcode" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="invbarcode" value="${bdInvbasdocInstance?.invbarcode}"/>
</span>


<span id="divinvmnecode${pageId}" class="fieldcontain  ">
    <label for="invmnecode">
        <g:message code="bdInvbasdoc.invmnecode.label" default="Invmnecode" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="invmnecode" value="${bdInvbasdocInstance?.invmnecode}"/>
</span>
<br>

<span id="divinvpinpai${pageId}" class="fieldcontain  ">
    <label for="invpinpai">
        <g:message code="bdInvbasdoc.invpinpai.label" default="Invpinpai" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="invpinpai" value="${bdInvbasdocInstance?.invpinpai}"/>
</span>




<br>
<span id="divdiscountflag${pageId}" class="fieldcontain  ">
    <label for="discountflag">
        <g:message code="bdInvbasdoc.discountflag.label" default="Discountflag" />

    </label>
    <g:checkBox name="discountflag" value="${bdInvbasdocInstance?.discountflag}" />
</span>

<br>
<span id="divismngstockbygrswt${pageId}" class="fieldcontain  ">
    <label for="ismngstockbygrswt">
        <g:message code="bdInvbasdoc.ismngstockbygrswt.label" default="Ismngstockbygrswt" />
        
    </label>
    <g:checkBox name="ismngstockbygrswt" value="${bdInvbasdocInstance?.ismngstockbygrswt}" />
</span>


<span id="divisretail${pageId}" class="fieldcontain  ">
    <label for="isretail">
        <g:message code="bdInvbasdoc.isretail.label" default="Isretail" />
        
    </label>
    <g:checkBox name="isretail" value="${bdInvbasdocInstance?.isretail}" />
</span>


<span id="divisstorebyconvert${pageId}" class="fieldcontain  ">
    <label for="isstorebyconvert">
        <g:message code="bdInvbasdoc.isstorebyconvert.label" default="Isstorebyconvert" />
        
    </label>
    <g:checkBox name="isstorebyconvert" value="${bdInvbasdocInstance?.isstorebyconvert}" />
</span>

<br>
<span id="divlaborflag${pageId}" class="fieldcontain  ">
    <label for="laborflag">
        <g:message code="bdInvbasdoc.laborflag.label" default="Laborflag" />
        
    </label>
    <g:checkBox name="laborflag" value="${bdInvbasdocInstance?.laborflag}" />
</span>




<span id="divsealflag${pageId}" class="fieldcontain  ">
    <label for="sealflag">
        <g:message code="bdInvbasdoc.sealflag.label" default="Sealflag" />
        
    </label>
    <g:checkBox name="sealflag" value="${bdInvbasdocInstance?.sealflag}" />
</span>


<span id="divsetpartsflag${pageId}" class="fieldcontain  ">
    <label for="setpartsflag">
        <g:message code="bdInvbasdoc.setpartsflag.label" default="Setpartsflag" />
        
    </label>
    <g:checkBox name="setpartsflag" value="${bdInvbasdocInstance?.setpartsflag}" />
</span>

<br>

<span id="divshipunitnum${pageId}" class="fieldcontain  ">
    <label for="shipunitnum">
        <g:message code="bdInvbasdoc.shipunitnum.label" default="Shipunitnum" />
        
    </label>
    <input id="shipunitnum" name="shipunitnum" class="easyui-numberbox myui" value="${fieldValue(bean: bdInvbasdocInstance, field: 'shipunitnum')}"/>
</span>


<span id="divstoreunitnum${pageId}" class="fieldcontain  ">
    <label for="storeunitnum">
        <g:message code="bdInvbasdoc.storeunitnum.label" default="Storeunitnum" />
        
    </label>
    <input id="storeunitnum" name="storeunitnum" class="easyui-numberbox myui" value="${fieldValue(bean: bdInvbasdocInstance, field: 'storeunitnum')}"/>
</span>


<span id="divunitvolume${pageId}" class="fieldcontain  ">
    <label for="unitvolume">
        <g:message code="bdInvbasdoc.unitvolume.label" default="Unitvolume" />
        
    </label>
    <input id="unitvolume" name="unitvolume" class="easyui-numberbox myui" value="${fieldValue(bean: bdInvbasdocInstance, field: 'unitvolume')}"/>
</span>
<br>

<span id="divunitweight${pageId}" class="fieldcontain  ">
    <label for="unitweight">
        <g:message code="bdInvbasdoc.unitweight.label" default="Unitweight" />
        
    </label>
    <input id="unitweight" name="unitweight" class="easyui-numberbox myui" value="${fieldValue(bean: bdInvbasdocInstance, field: 'unitweight')}"/>

</span>


<span id="divweitunitnum${pageId}" class="fieldcontain  ">
    <label for="weitunitnum">
        <g:message code="bdInvbasdoc.weitunitnum.label" default="Weitunitnum" />
        
    </label>
    <input id="weitunitnum" name="weitunitnum" class="easyui-numberbox myui" value="${fieldValue(bean: bdInvbasdocInstance, field: 'weitunitnum')}"/>

</span>

<br>


<div id="divmemo${pageId}" class="fieldcontain  ">
    <label for="memo">
        <g:message code="bdInvbasdoc.memo.label" default="Memo" />

    </label>
    <g:textArea class="easyui-validatebox" name="memo" value="${bdInvbasdocInstance?.memo}" style="width:100pt;height:80pt;"/>
</div>
