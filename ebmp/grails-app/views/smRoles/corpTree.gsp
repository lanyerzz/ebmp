<%@ page import="com.app.bd.corp.BdCorp" %>
<script>
    $('#corpTree${pageId}').tree({
        data:${data}
    });
</script>
<ul id="corpTree${pageId}"  class="easyui-tree"   fit="true" checkbox="true" cascadeCheck="false">

</ul>

