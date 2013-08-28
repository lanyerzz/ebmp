<%@ page import="com.app.ic.bill.IcGeneralHead" %>

<g:hiddenField name="id" value="${config?.id}" />
<g:hiddenField name="version" value="${config?.version}" />


<span  class="fieldcontain  ">
    <label for="urladdress${pageId}">
        NC外部交换平台地址
    </label>

    <input id="urladdress${pageId}" name="urladdress"  value="${upconfig?.urladdress}"  >
</span>

<span  class="fieldcontain  ">
    <label for="account${pageId}">
        帐套

    </label>

    <input id="account${pageId}" name="account"   value="${upconfig?.account}" >
</span>
