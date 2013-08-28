<select id="${id}" name="${name}" class="easyui-combotree"
        data-options="url:'${createLink(controller: 'bdCorp',action: 'query')}',
        value:'${textValue}',
        required:true,loadFilter:loadFilter${p_pageId}"></select>
<script>
    $(function(){
       var forms= $('#${id}').closest('form');
        $('[name="${name}"]',forms).val('${idValue}');
    });
    function loadFilter${p_pageId}(data,parent){

        return data;
    }
</script>