<script>

    function getHeadData(){

        var rows= $('#table${pageId}').datagrid('getSelections');
        var data=new Array();
        for(var i=0;i<rows.length;i++){
            data.push(rows[i].id);
        }
        if(data.length==0){
            $.messager.show({
                title:'警告',
                msg:'请选择${message(code: 'icSpecial.label', default: 'IcSpecial')}主信息!'
            });
            return false;
        }
        return {'data':data,'businessKey':'${businessKey}','sourceBillTypeCode':'${billTypeCode}'};
    }


    function ${handler}(){


       var rows= $('#table${pageId}').datagrid('getRows');
        var num=rows.length;

        var data=new Array();

        for(var i=0;i<num;i++){

            var sub=$('#tb-sub${pageId}-'+i);

            var bodyrows;
            try{

                bodyrows=sub.datagrid('getSelections');
            }catch (e){

                continue;
            }



            if(bodyrows.length==0)
                continue;
            for(var c=0;c<bodyrows.length;c++){

                data.push(bodyrows[c].id);

            }

        }

        if(data.length==0){
        $.messager.show({
                title:'警告',
                msg:'请选择${message(code: 'icSpecial.label', default: 'IcSpecial')}明细数据!'
            });
        return false;
        }

        return {'data':data,'businessKey':'${businessKey}','sourceBillTypeCode':'${billTypeCode}'};
    }




</script>


<div id="tb${pageId}">
    <a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="onOpenQuery${pageId}()">
        ${message(code: 'default.button.query.label',default: '查询')}
    </a>
</div>
<g:render template="list" model="[reQuery:true,targetBill:targetBill]"></g:render>