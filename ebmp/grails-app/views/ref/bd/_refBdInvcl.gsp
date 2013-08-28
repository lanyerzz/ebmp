<g:set  var="p_pageId" value="${java.util.UUID.randomUUID().toString().replaceAll('-','')}"></g:set>
<select id="${id}" name="${name}" class="easyui-combotree" style="width:200px;"
        data-options="url:'${createLink(controller: 'bdInvcl',action: 'query')}',
        value:'${textValue}',
        required:true,loadFilter:loadFilter${p_pageId}"></select>
<script>
    $(function(){
        var forms= $('#${id}').closest('form');
        $('[name="${name}"]',forms).val('${idValue}');
    });
    function loadFilter${p_pageId}(data,parent){

        return data.text=data.invclassName;
    }
</script>