<%@ page import="com.app.bd.carsinfo.BdCarsinfo" %>

<g:hiddenField name="id" value="${bdCarsinfoInstance?.id}" />
<g:hiddenField name="version" value="${bdCarsinfoInstance?.version}" />


<div id="divcarCode${pageId}}" class="fieldcontain  required">
    <label for="carCode">
        <g:message code="bdCarsinfo.carCode.label" default="Car Code" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox myui" name="carCode" required="true"  value="${bdCarsinfoInstance?.carCode}"/>
    <div id="carCode_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divcarNo${pageId}}" class="fieldcontain  required">
    <label for="carNo">
        <g:message code="bdCarsinfo.carNo.label" default="Car No" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox myui" name="carNo" required="true" value="${bdCarsinfoInstance?.carNo}"/>
    <div id="carNo_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divyszjyxq${pageId}}" class="fieldcontain  ">
    <label for="yszjyxq">
        <g:message code="bdCarsinfo.yszjyxq.label" default="运输证件有效期" />
        
    </label>
    <input name="yszjyxq" id="yszjyxq" date  value="${bdCarsinfoInstance?.yszjyxq?.getTime()}" class="easyui-datebox" />
    <div id="yszjyxq_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divylrqyxq${pageId}}" class="fieldcontain  ">
    <label for="ylrqyxq">
        <g:message code="bdCarsinfo.ylrqyxq.label" default="压力容器有效期" />
        
    </label>
    <input name="ylrqyxq" id="ylrqyxq" date  value="${bdCarsinfoInstance?.ylrqyxq?.getTime()}"  class="easyui-datebox" />

    <div id="ylrqyxq_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divapprovedLoading${pageId}}" class="fieldcontain  ">
    <label for="approvedLoading">
        <g:message code="bdCarsinfo.approvedLoading.label" default="Approved Loading" />
        
    </label>
    <g:field name="approvedLoading" value="${fieldValue(bean: bdCarsinfoInstance, field: 'approvedLoading')}" type="" class="myui"/>
    <div id="approvedLoading_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divcarOwner${pageId}}" class="fieldcontain  ">
    <label for="carOwner">
        <g:message code="bdCarsinfo.carOwner.label" default="Car Owner" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="carOwner" value="${bdCarsinfoInstance?.carOwner}"/>
    <div id="carOwner_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divcarOwnerId${pageId}}" class="fieldcontain  ">
    <label for="carOwnerId">
        <g:message code="bdCarsinfo.carOwnerId.label" default="Car Owner Id" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="carOwnerId" value="${bdCarsinfoInstance?.carOwnerId}"/>
    <div id="carOwnerId_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divcarType${pageId}}" class="fieldcontain  required">
    <label for="carType">
        <g:message code="bdCarsinfo.carType.label" default="Car Type" />
        <span class="required-indicator">*</span>
    </label>
    <g:select name="carType" from="${[[index:0,value:"普通半挂"],[index:1,value:"罐式全挂"],[index:2,value:"集装箱全挂"]]}" optionKey="index" optionValue="value" noSelection="['':'-选择挂车类型-']" value="${bdCarsinfoInstance?.carType}"/>
    <div id="carType_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divcarrier${pageId}}" class="fieldcontain  ">
    <label for="carrier">
        <g:message code="bdCarsinfo.carrier.label" default="Carrier" />
        
    </label>
    <g:refTemplate code="refBdCumandoc" model="[id:'carrier',name:'carrier.id',value:bdCarsinfoInstance?.carrier?.id]"></g:refTemplate>
    <div id="carrier_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divclqsdw${pageId}}" class="fieldcontain  ">
    <label for="clqsdw">
        <g:message code="bdCarsinfo.clqsdw.label" default="Clqsdw" />
        
    </label>
    <g:refTemplate code="refBdCumandoc" model="[id:'clqsdw',name:'clqsdw.id',value:bdCarsinfoInstance?.clqsdw?.id]"></g:refTemplate>
    <div id="clqsdw_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divdeadweight${pageId}}" class="fieldcontain  ">
    <label for="deadweight">
        <g:message code="bdCarsinfo.deadweight.label" default="Deadweight" />
        
    </label>
    <g:field name="deadweight" value="${fieldValue(bean: bdCarsinfoInstance, field: 'deadweight')}" class="myui"/>
    <div id="deadweight_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divisLoadlimit${pageId}}" class="fieldcontain  ">
    <label for="isLoadlimit">
        <g:message code="bdCarsinfo.isLoadlimit.label" default="Is Loadlimit" />
        
    </label>
    <g:checkBox name="isLoadlimit" value="${bdCarsinfoInstance?.isLoadlimit}" />
    <div id="isLoadlimit_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divlinkMan${pageId}}" class="fieldcontain  ">
    <label for="linkMan">
        <g:message code="bdCarsinfo.linkMan.label" default="Link Man" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="linkMan" value="${bdCarsinfoInstance?.linkMan}"/>
    <div id="linkMan_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divlinkPhone${pageId}}" class="fieldcontain  ">
    <label for="linkPhone">
        <g:message code="bdCarsinfo.linkPhone.label" default="Link Phone" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="linkPhone" value="${bdCarsinfoInstance?.linkPhone}"/>
    <div id="linkPhone_message" hidden="" name="message" class="errors" role="status"></div>
</div>




<div id="divylrqzNo${pageId}}" class="fieldcontain  ">
    <label for="ylrqzNo">
        <g:message code="bdCarsinfo.ylrqzNo.label" default="Ylrqz No" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="ylrqzNo" value="${bdCarsinfoInstance?.ylrqzNo}"/>
    <div id="ylrqzNo_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divyszjCode${pageId}}" class="fieldcontain  ">
    <label for="yszjCode">
        <g:message code="bdCarsinfo.yszjCode.label" default="Yszj Code" />
        
    </label>
    <g:textField class="easyui-validatebox myui" name="yszjCode" value="${bdCarsinfoInstance?.yszjCode}"/>
    <div id="yszjCode_message" hidden="" name="message" class="errors" role="status"></div>
</div>

<div id="divmemo${pageId}}" class="fieldcontain  ">
    <label for="memo">
        <g:message code="bdCarsinfo.memo.label" default="Memo" />

    </label>
    <g:textArea class="easyui-validatebox myui" name="memo" value="${bdCarsinfoInstance?.memo}" style="width:103pt;height:100pt;"/>
    <div id="memo_message" hidden="" name="message" class="errors" role="status"></div>
</div>
