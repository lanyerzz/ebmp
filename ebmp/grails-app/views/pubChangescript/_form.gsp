<%@ page import="com.app.pub.change.PubChangescript" %>

<g:hiddenField name="id" value="${pubChangescriptInstance?.id}" />
<g:hiddenField name="version" value="${pubChangescriptInstance?.version}" />


<div id="divchangeFrom${pageId}" class="fieldcontain  ">
    <label for="changeFrom${pageId}">
        <g:message code="pubChangescript.changeFrom.label" default="Change From" />
        
    </label>
    <g:refTemplate code="refPubBilltype" model="[id:'changeFrom',name:'changeFrom.id',value:pubChangescriptInstance?.changeFrom?.id]"></g:refTemplate>
</div>


<div id="divchangeTo${pageId}" class="fieldcontain  ">
    <label for="changeTo${pageId}">
        <g:message code="pubChangescript.changeTo.label" default="Change To" />
        
    </label>
    <g:refTemplate code="refPubBilltype" model="[id:'changeTo',name:'changeTo.id',value:pubChangescriptInstance?.changeTo?.id]"></g:refTemplate>


</div>


<div id="divpath${pageId}" class="fieldcontain  ">
    <label for="path${pageId}">
        <g:message code="pubChangescript.path.label" default="Path" />
        
    </label>

    <g:textField disabled="" name="path" id="${pageId}" value="${pubChangescriptInstance?.path}"/>

</div>

