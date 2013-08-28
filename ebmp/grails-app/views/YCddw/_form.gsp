<%@ page import="com.app.ywms.bd.cddw.YCddw" %>
<script>

    /**
     *命名规则  onSelect+参照id+pageId
     * @param index
     * @param data
     */
    function onSelectbdCumandoc${pageId}(index,data){

    }
    /**
     *命名规则  onChange+参照id+pageId
     * @param newValue
     * @param oldValue
     */
    function onChangebdCumandoc${pageId}(newValue, oldValue){



    }
</script>
<g:hiddenField name="id" value="${YCddwInstance?.id}" />
<g:hiddenField name="version" value="${YCddwInstance?.version}" />

<p style="color: red">基础信息</p>
<hr>
<span id="divcode${pageId}" class="fieldcontain ">
    <label for="code">
        <g:message code="YCddw.code.label" default="Code" />

    </label>
    <g:textField class="easyui-validatebox" name="code" required="true" class="easyui-validatebox" value="${YCddwInstance?.code}"/>
</span>


<span id="divname${pageId}" class="fieldcontain  required">
    <label for="name">
        <g:message code="YCddw.name.label" default="Name" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox" name="name" required="true" class="easyui-validatebox" value="${YCddwInstance?.name}"/>
</span>

<span id="divzjf${pageId}" class="fieldcontain  ">
    <label for="zjf">
        <g:message code="YCddw.zjf.label" default="Zjf" />

    </label>
    <g:textField class="easyui-validatebox" name="zjf" value="${YCddwInstance?.zjf}"/>
</span>
<br>
<span id="divblockUp${pageId}" class="fieldcontain  ">
    <label for="blockUp">
        <g:message code="YCddw.blockUp.label" default="Block Up" />

    </label>
    <g:checkBox name="blockUp" value="${YCddwInstance?.blockUp}" />
</span>

<span id="divbdCumandoc${pageId}" class="fieldcontain  ">
    <label for="bdCumandoc">
        <g:message code="YCddw.bdCumandoc.label" default="Bd Cumandoc" />

    </label>
    <g:refTemplate code="refBdCustomer" model="[id:'bdCumandoc',name:'bdCumandoc.id',value:YCddwInstance?.bdCumandoc?.id]"></g:refTemplate>
</span>

<p style="color: red">联系人信息</p>
<hr>

<span id="divlinkman${pageId}" class="fieldcontain  ">
    <label for="linkman">
        <g:message code="YCddw.linkman.label" default="Linkman" />

    </label>
    <g:textField class="easyui-validatebox" name="linkman" value="${YCddwInstance?.linkman}"/>
</span>


<span id="divfrdb${pageId}" class="fieldcontain  ">
    <label for="frdb">
        <g:message code="YCddw.frdb.label" default="Frdb" />

    </label>
    <g:textField class="easyui-validatebox" name="frdb" value="${YCddwInstance?.frdb}"/>
</span>


<span id="divlinktel${pageId}" class="fieldcontain  ">
    <label for="linktel">
        <g:message code="YCddw.linktel.label" default="Linktel" />

    </label>
    <g:textField class="easyui-validatebox" name="linktel" value="${YCddwInstance?.linktel}"/>
</span>
<br>

<span id="divfax${pageId}" class="fieldcontain  ">
    <label for="fax">
        <g:message code="YCddw.fax.label" default="Fax" />

    </label>
    <g:textField class="easyui-validatebox" name="fax" value="${YCddwInstance?.fax}"/>
</span>

<span id="divurl${pageId}" class="fieldcontain  ">
    <label for="url">
        <g:message code="YCddw.url.label" default="Url" />

    </label>
    <g:textField class="easyui-validatebox" name="url" value="${YCddwInstance?.url}"/>
</span>

<span id="divemail${pageId}" class="fieldcontain  ">
    <label for="email">
        <g:message code="YCddw.email.label" default="Email" />

    </label>
    <g:textField class="easyui-validatebox" name="email" value="${YCddwInstance?.email}"/>
</span>
<br>
<span id="divaddress${pageId}" class="fieldcontain  ">
    <label for="address">
        <g:message code="YCddw.address.label" default="Address" />

    </label>
    <g:textField class="easyui-validatebox" name="address" value="${YCddwInstance?.address}"/>
</span>

<p style="color: red">财务信息</p>
<hr>

<span id="divyyzz${pageId}" class="fieldcontain  ">
    <label for="yyzz">
        <g:message code="YCddw.yyzz.label" default="Yyzz" />

    </label>
    <g:textField class="easyui-validatebox" name="yyzz" value="${YCddwInstance?.yyzz}"/>
</span>

<span id="divzzjgdmz${pageId}" class="fieldcontain  ">
    <label for="zzjgdmz">
        <g:message code="YCddw.zzjgdmz.label" default="Zzjgdmz" />

    </label>
    <g:textField class="easyui-validatebox" name="zzjgdmz" value="${YCddwInstance?.zzjgdmz}"/>
</span>

<span id="divkhyh${pageId}" class="fieldcontain  ">
    <label for="khyh">
        <g:message code="YCddw.khyh.label" default="Khyh" />

    </label>
    <g:textField class="easyui-validatebox" name="khyh" value="${YCddwInstance?.khyh}"/>
</span>
<br>
<span id="divaccount${pageId}" class="fieldcontain  ">
    <label for="account">
        <g:message code="YCddw.account.label" default="Account" />

    </label>
    <g:textField class="easyui-validatebox" name="account" value="${YCddwInstance?.account}"/>
</span>

<span id="divswdjh${pageId}" class="fieldcontain  ">
    <label for="swdjh">
        <g:message code="YCddw.swdjh.label" default="Swdjh" />

    </label>
    <g:textField class="easyui-validatebox" name="swdjh" value="${YCddwInstance?.swdjh}"/>
</span>

<p style="color: red">其他信息</p>
<hr>

<span id="divmaker${pageId}" class="fieldcontain  ">
    <label for="maker">
        <g:message code="YCddw.maker.label" default="Maker" />

    </label>
    <input id="maker"  value="${YCddwInstance?.maker?.userRealName}" disabled="true">
</span>

<span id="divmakedate${pageId}" class="fieldcontain  ">
    <label for="makedate${pageId}">
        <g:message code="YCddw.makedate.label" default="Makedate" />

    </label>
    <g:hiddenField name="makedate" value="${YCddwInstance?.makedate?.getTime()}"></g:hiddenField>
    <input id="makedate${pageId}" name="makedate"  value="${YCddwInstance?.makedate?.getTime()}" date disabled="true">
</span>

<span id="divnote${pageId}" class="fieldcontain  ">
    <label for="note">
        <g:message code="YCddw.note.label" default="Note" />

    </label>
    <g:textField class="easyui-validatebox" name="note" value="${YCddwInstance?.note}"/>
</span>


