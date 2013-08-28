



<%@ page contentType="text/html;charset=UTF-8" %>
<g:each in="${moduleData}" var="data" status="i">
    <script>
        function addLink${i}(e, node){

            e.preventDefault();

            var isLeaf=$('#funTree${i}').tree('isLeaf', node.target);
            if(!isLeaf) return;
            $('#funTree${i}').tree('select', node.target);
            // display context menu
            $('#mm${i}').menu('show', {
                left: e.pageX,
                top: e.pageY

            });
        }

        function onAdd${i}(item){

            var node= $('#funTree${i}').tree('getSelected');
            $.post('${createLink(controller: 'smUserinterface',action: 'save')}',{functionId:node.id},function(json){
                $.messager.show({title:'成功',msg:'快捷键添加成功！'});
                addDefine(json);
            });

        }

    </script>
    <div title="${data.funName}" data-options="" style="padding:10px;">
        <ul id="funTree${i}" style="" class="easyui-tree" data-options="url:'${createLink(controller: 'smFunction',action: 'queryChildByUser')}?pid=${data.id}',onDblClick: openMainTag,
        onContextMenu:addLink${i}">
        </ul>

    </div>
    <div id="mm${i}" class="easyui-menu" style="width:120px;" data-options="onClick:onAdd${i}">
        <div>增加快捷方式</div>
    </div>
</g:each>

