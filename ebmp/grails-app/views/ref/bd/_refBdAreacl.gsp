

<g:set var="p_pageId" value="${java.util.UUID.randomUUID().toString().replaceAll('-','')}"></g:set>
<input type="hidden" id="v${p_pageId}" name="${name}" value="${value}">
<input id="${id}${pageId}"  value="${text}" >
<div id="clear${p_pageId}" style="background-color: #b7d2ff;text-align: center;">
    <a href="#" onclick="clear${p_pageId}()">清除</a>
</div>
<script>
    function clear${p_pageId}(){

        $('#v${p_pageId}').val('');
        $('#${id}${pageId}').combotree('clear');
    }
    $(function(){

        $('#${id}${pageId}').combotree({
            panelHeight:'auto',
            onShowPanel:function(){
                var options= $('#${id}${pageId}').combotree('options');
                if(options.loaded==true)
                    return;
                $('#${id}${pageId}').combotree('reload','${createLink(controller: 'bdAreacl',action: 'query')}');
                options.loaded=true;


            },
            required: ${required?:false},

            onChange:function(newValue, oldValue){
                $('#v${p_pageId}').val(newValue);
            },
            loadFilter:function(data,parent){
                $.each(data,function(i,v){

                    v['text']= v.areaclname
                });
                return data;
            }
        });

        $('#clear${p_pageId}').appendTo($('#${id}${pageId}').combo('panel'));
        <g:if test="${value!=null}">
        $('#${id}${pageId}').combotree('loadData', [{
            id: '${text}',
            text: '${text}',
            areaclname:'${text}'
        }]);
        </g:if>



    });


</script>