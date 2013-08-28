<%@ page import="com.app.sm.roles.SmRoles" %>
<%@ page import="com.app.sm.function.SmFunction" %>
<script>


    function onAllot${pageId}(){

        var role = $('#roleTree${pageId}').tree('getSelected');
        if(role==null){
            $.messager.show({
                title:'警告',
                msg:'请选择角色下的公司!'
            });
            return;
        }

        var leaf=$('#roleTree${pageId}').tree('isLeaf',role.target);
        if(!leaf) {
            $.messager.show({
                title:'警告',
                msg:'请选择角色下的公司!'
            });
            return;
        }

        var _roleid=$('#roleTree${pageId}').tree('getParent',role.target).id;


        var _corpid=role.id;
        var nodes = $('#functionTree${pageId}').tree('getChecked','indeterminate');
        var nodes1 = $('#functionTree${pageId}').tree('getChecked');

        var keys = ''

        for(var i=0;i<nodes.length;i++){

            if(keys!='')keys+=',';
            keys+=nodes[i].id;

        }

        for(var i=0;i<nodes1.length;i++){

            if(keys!='')keys+=',';
            keys+=nodes1[i].id;

        }
        var obj = {'roleid':_roleid,'corpid':_corpid,'key':keys};
        if(nodes==null){
            obj = {'roleid':_roleid,'corpid':_corpid};
        }
        $.post('${createLink(controller:'smDistribution',action:'linkFunction')}',obj,function(json){
            $(this).showMessage(json);
        });


    }

</script>



<div class="easyui-layout" fit="true">
    %{--按钮--}%
    <div id="tb${pageId}" region="north">

        <a href="#" class="easyui-linkbutton" plain="true" iconCls="icon-save" onclick="onAllot${pageId}()">
            <g:message code="defautl.button.allot.label" default="分配" />
        </a>
    </div>
    <div region="west" style="width:300px" title='角色'>
        <ul id="roleTree${pageId}"  class="easyui-tree"

            url="${createLink(controller: 'smDistribution', action: 'loadRoleAndCorp')}"
            idField="id" treeField="funName" fit="true" onlyLeafCheck="true" data-options="onClick: function(node){

		        var roleid=$('#roleTree${pageId}').tree('getParent',node.target).id;
                //var roleid=$('#roleTree${pageId}').tree('isLeaf',node.target);
                var _url='${createLink(controller: 'smDistribution', action: 'queryFunction')}?roleid='+roleid+'&corpid='+node.id;
                $('#functionTree${pageId}').tree({
                    url:_url,

                    idField:'id',
                    treeField:'funName',
                    fit:'true',
                    checkbox:true,
                    cascadeCheck:true
                });
	        }">
        </ul>
    </div>
    <div region="center" title="节点">
        <ul id="functionTree${pageId}"  class="easyui-tree"
               url="${createLink(controller: 'smDistribution', action: 'queryFunction')}"
               idField="id" treeField="funName" fit="true" checkbox="true" cascadeCheck="true">
        </ul>
    </div>
</div>