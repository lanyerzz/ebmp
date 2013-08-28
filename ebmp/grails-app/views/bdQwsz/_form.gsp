<%@ page import="com.app.bd.qwsz.BdQwsz" %>

<g:hiddenField name="id" value="${bdQwszInstance?.id}" />
<g:hiddenField name="version" value="${bdQwszInstance?.version}" />


<div id="divcode${pageId}" class="fieldcontain  ">
    <label for="code">
        <g:message code="bdQwsz.code.label" default="Code" />

    </label>
    <g:textField class="easyui-validatebox myui" name="code" value="${bdQwszInstance?.code}"/>
    <div id="code_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divname${pageId}" class="fieldcontain  ">
    <label for="name">
        <g:message code="bdQwsz.name.label" default="Name" />

    </label>
    <g:textField class="easyui-validatebox myui" name="name" value="${bdQwszInstance?.name}"/>
    <div id="name_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divbdInvmandoc${pageId}" class="fieldcontain  ">
    <label for="bdInvmandoc">
        <g:message code="bdQwsz.bdInvmandoc.label" default="存货" />

    </label>
    <g:refTemplate code="refBdInvmandoc" model="[id:'bdInvmandoc',name:'bdInvmandoc.id',value:bdQwszInstance?.bdInvmandoc?.id]"></g:refTemplate>
    <div id="bdInvmandoc_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divcanUse${pageId}" class="fieldcontain  ">
    <label for="canUse">
        <g:message code="bdQwsz.canUse.label" default="Can Use" />

    </label>
    <g:checkBox name="canUse" value="${bdQwszInstance?.canUse}" />
    <div id="canUse_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divstate${pageId}" class="fieldcontain  ">
    <label for="state">
        <g:message code="bdQwsz.state.label" default="State" />

    </label>
    <g:radio name="state" value="open" title="打开" />打开
    <g:radio name="state" value="close" title="关闭" checked="true"/>关闭

    <div id="state_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divnote${pageId}" class="fieldcontain  ">
    <label for="note">
        <g:message code="bdQwsz.note.label" default="Note" />

    </label>
    <g:textArea class="easyui-validatebox myui" name="note" value="${bdQwszInstance?.note}"/>
    <div id="note_message" hidden="" name="message" class="errors" role="status"></div>
</div>




