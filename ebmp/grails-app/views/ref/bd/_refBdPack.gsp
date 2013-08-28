<g:set var="p_pageId" value="${java.util.UUID.randomUUID().toString().replaceAll('-','')}"></g:set>
<g:if test="${inForm==true}">
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
                panelHeight:400,
                onShowPanel:function(){
                    var options= $('#${id}${pageId}').combotree('options');
                    if(options.loaded==true)
                        return;
                    $('#${id}${pageId}').combotree('reload','${createLink(controller: 'bdPack',action: 'queryTree')}');
                    options.loaded=true;


                },
                required: ${required?:false},

                onChange:function(newValue, oldValue){
                    $('#v${p_pageId}').val(newValue);
                },
                loadFilter:function(data,parent){
                    $.each(data,function(i,v){

                        v['text']= v.name
                    });
                    return data;
                }
            });

            $('#clear${pageId}').appendTo($('#${id}${pageId}').combo('panel'));
            <g:if test="${value!=null}">
            $('#${id}${pageId}').combotree('loadData', [{
                id: '${text}',
                text: '${text}',
                name:'${text}'
            }]);
            </g:if>



        });


    </script>
</g:if>
<g:else>
    <th field="${field}"   sortable="false" width="100"  editor="{type:'comboxtree',options:{
                cid:'${field}${pageId}',
                _url:'${createLink(controller: 'bdPack',action: 'queryTree')}',
                <g:if test="${onSelect}">onSelect:${onSelect},</g:if>
                _textField:'name',
                panelHeight:400,
                onShowPanel:function(){
                    var options= $('#${field}${pageId}').combotree('options');
                    if(options.loaded==true)
                        return;
                    $('#${field}${pageId}').combotree('reload','${createLink(controller: 'bdPack',action: 'queryTree')}');
                    options.loaded=true;
                },
                loadFilter:function(data,parent){
                    $.each(data,function(i,v){

                        v['text']= v.name;
                        v['attributes']=v;
                    });
                    return data;
                }

              }
              }"

        data-options="canSave:false,formatter:function(value,row){

                   if(value!=undefined && value!=null){
                        row['${field}.id']=value.id;
                        return value.name;

                    }else{
                        delete row['${field}.id'];
                     row['${field}']=null;
                        return '';
                    }
            }">
        ${title}</th>
</g:else>