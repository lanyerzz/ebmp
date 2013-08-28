<%@ page import="com.app.ywms.bd.shipdoc.Yshipdoc" %>

<g:hiddenField name="id" value="${yshipdocInstance?.id}" />
<g:hiddenField name="version" value="${yshipdocInstance?.version}" />

<p style="color:red">船舶基本信息</p>
<hr>

<span id="divshipname${pageId}" class="fieldcontain  required">
    <label for="shipname">
        <g:message code="yshipdoc.shipname.label" default="Shipname" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField class="easyui-validatebox myui" name="shipname" required="true"  value="${yshipdocInstance?.shipname}"/>
</span>


<span id="divshipcountry${pageId}" class="fieldcontain  ">
    <label for="shipcountry">
        <g:message code="yshipdoc.shipcountry.label" default="Shipcountry" />

    </label>
    <g:textField class="easyui-validatebox myui" name="shipcountry" value="${yshipdocInstance?.shipcountry}"/>
</span>


<span id="divshipforeignname${pageId}" class="fieldcontain  ">
    <label for="shipforeignname">
        <g:message code="yshipdoc.shipforeignname.label" default="Shipforeignname" />

    </label>
    <g:textField class="easyui-validatebox myui" name="shipforeignname" value="${yshipdocInstance?.shipforeignname}"/>
</span>
<br>
<span id="divbuildYear${pageId}" class="fieldcontain  ">
    <label for="buildYear">
        <g:message code="yshipdoc.buildYear.label" default="Build Year" />

    </label>
    <input id="buildYear" name="buildYear" value="${yshipdocInstance?.buildYear?.getTime()}" date class="easyui-datebox">
</span>

<span id="divzjm${pageId}" class="fieldcontain  ">
    <label for="zjm">
        <g:message code="yshipdoc.zjm.label" default="Zjm" />

    </label>
    <g:textField class="easyui-validatebox myui" name="zjm" value="${yshipdocInstance?.zjm}"/>
</span>


<span id="divshiptype${pageId}" class="fieldcontain  ">
    <label for="shiptype">
        <g:message code="yshipdoc.shiptype.label" default="Shiptype" />

    </label>
    <g:select name="shiptype" from="${[[index:0,value:'内轮'],[index:1,value:'外轮'],[index:2,value:'其他']]}" value="${yshipdocInstance.shiptype}" optionKey="index" optionValue="value" noSelection="['':'请选择船舶类型']"></g:select>
    <div id="shiptype_message" hidden="" name="message" class="errors" role="status"></div>
</span>
<br>
<span id="divshiplength${pageId}" class="fieldcontain  ">
    <label for="shiplength">
        <g:message code="yshipdoc.shiplength.label" default="Shiplength" />

    </label>
    <g:field name="shiplength" class="easyui-numberbox myui" value="${fieldValue(bean: yshipdocInstance, field: 'shiplength')}"/>
</span>

<span id="divshipwidth${pageId}" class="fieldcontain  ">
    <label for="shipwidth">
        <g:message code="yshipdoc.shipwidth.label" default="Shipwidth" />

    </label>
    <g:field name="shipwidth" class="easyui-numberbox myui" value="${fieldValue(bean: yshipdocInstance, field: 'shipwidth')}"/>
</span>

<span id="divdraft${pageId}" class="fieldcontain  ">
    <label for="draft">
        <g:message code="yshipdoc.draft.label" default="Draft" />

    </label>
    <g:field name="draft" class="easyui-numberbox myui" value="${fieldValue(bean: yshipdocInstance, field: 'draft')}"/>
</span>
<br>
<span id="divload${pageId}" class="fieldcontain  ">
    <label for="load">
        <g:message code="yshipdoc.load.label" default="Load" />

    </label>
    <g:field name="load" class="easyui-numberbox myui" value="${fieldValue(bean: yshipdocInstance, field: 'load')}"/>
</span>


<span id="divgrossweight${pageId}" class="fieldcontain  ">
    <label for="grossweight">
        <g:message code="yshipdoc.grossweight.label" default="Grossweight" />

    </label>
    <g:field name="grossweight" class="easyui-numberbox myui" value="${fieldValue(bean: yshipdocInstance, field: 'grossweight')}"/>
</span>

<span id="divnetweight${pageId}" class="fieldcontain  ">
    <label for="netweight">
        <g:message code="yshipdoc.netweight.label" default="Netweight" />

    </label>
    <g:field name="netweight" class="easyui-numberbox myui" value="${fieldValue(bean: yshipdocInstance, field: 'netweight')}"/>
</span>
<br>
<span id="divdl${pageId}" class="fieldcontain  ">
    <label for="dl">
        <g:message code="yshipdoc.dl.label" default="Dl" />

    </label>
    <g:checkBox name="dl" value="${yshipdocInstance?.dl}" />
</span>

<span id="divyrk${pageId}" class="fieldcontain  ">
    <label for="yrk">
        <g:message code="yshipdoc.yrk.label" default="Yrk" />

    </label>
    <g:checkBox name="yrk" value="${yshipdocInstance?.yrk}" />
</span>


<p style="color:red">保安基本信息</p>
<hr>


<span id="divbazsh${pageId}" class="fieldcontain  ">
    <label for="bazsh">
        <g:message code="yshipdoc.bazsh.label" default="Bazsh" />

    </label>
    <g:textField class="easyui-validatebox myui" name="bazsh" value="${yshipdocInstance?.bazsh}"/>
</span>

<span id="divbadj${pageId}" class="fieldcontain  ">
    <label for="badj">
        <g:message code="yshipdoc.badj.label" default="Badj" />

    </label>
    <g:textField class="easyui-validatebox myui" name="badj" value="${yshipdocInstance?.badj}"/>
</span>

<span id="divbasm${pageId}" class="fieldcontain  ">
    <label for="basm">
        <g:message code="yshipdoc.basm.label" default="Basm" />

    </label>
    <g:textField class="easyui-validatebox myui" name="basm" value="${yshipdocInstance?.basm}"/>
</span>

<p style="color:red">船舶联系方式</p>
<hr>



<span id="divchuanzhu${pageId}" class="fieldcontain  ">
    <label for="chuanzhu">
        <g:message code="yshipdoc.chuanzhu.label" default="chuanzhu" />

    </label>
    <g:textField class="easyui-validatebox myui" name="chuanzhu" value="${yshipdocInstance?.chuanzhu}"/>
</span>

<span id="divlinkman${pageId}" class="fieldcontain  ">
    <label for="linkman">
        <g:message code="yshipdoc.linkman.label" default="Linkman" />

    </label>
    <g:textField class="easyui-validatebox myui" name="linkman" value="${yshipdocInstance?.linkman}"/>
</span>

<span id="divlinktel${pageId}" class="fieldcontain  ">
    <label for="linktel">
        <g:message code="yshipdoc.linktel.label" default="Linktel" />

    </label>
    <g:textField class="easyui-validatebox myui" name="linktel" value="${yshipdocInstance?.linktel}"/>
</span>
<br>

<span id="divhead${pageId}" class="fieldcontain  ">
    <label for="head">
        <g:message code="yshipdoc.head.label" default="Head" />

    </label>
    <g:textField class="easyui-validatebox myui" name="head" value="${yshipdocInstance?.head}"/>
</span>

<p style="color:red">附加信息</p>
<hr>


<span id="divmaker${pageId}" class="fieldcontain  ">
    <label for="maker">
        <g:message code="yshipdoc.maker.label" default="Maker" />

    </label>
    <input id="maker" value="${yshipdocInstance?.maker?.userRealName}" readonly="true" class="myui">
</span>

<span id="divmakedate${pageId}" class="fieldcontain  ">
    <label for="makedate">
        <g:message code="yshipdoc.makedate.label" default="Makedate" />

    </label>
    <input id="makedate" name="makedate" date  value="${yshipdocInstance?.makedate?.getTime()}" readonly="true" class="myui">
</span>


<span id="divsyz${pageId}" class="fieldcontain  ">
    <label for="syz">
        <g:message code="yshipdoc.syz.label" default="syz" />

    </label>
    <g:checkBox name="syz" value="${yshipdocInstance?.syz}" />
</span>


<br>
<span id="divnote${pageId}" class="fieldcontain  ">
    <label for="note">
        <g:message code="yshipdoc.note.label" default="Note" />

    </label>
    <g:textField class="easyui-validatebox myui" name="note" value="${yshipdocInstance?.note}"/>
</span>



