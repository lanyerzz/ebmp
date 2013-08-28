<ul id="allotTree${pageId}"  class="easyui-tree"
    url="${createLink(controller: 'bdPsnbasdoc', action: 'openAllotDlg')}"
    data-options='data:${data as grails.converters.JSON}'
    idField="id" treeField="deptName" fit="true" checkbox="true" cascadeCheck="true">
</ul>