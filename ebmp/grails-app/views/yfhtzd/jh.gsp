<%@ page import="grails.converters.JSON" %>
<script>



    $(function(){

        $('#distribute${pageId}').datagrid({
            data:${data as JSON},
            checkOnSelect:true,
            selectOnCheck:true,
            rownumbers:true,
            fit:true,
            fitColumns:true,
            onCheckAll:function(rows){
                $.each(rows,function(i,v){
                    if(i<5)
                        $('#distribute${pageId}').datagrid('check',i);
                    else
                        $('#distribute${pageId}').datagrid('uncheck',i);
                });


            }
        });
        var rows=$('#distribute${pageId}').datagrid('getRows')
        $.each(rows,function(i,v){
            if(v.zzjh==true)
             $('#distribute${pageId}').datagrid('selectRow',i);
        });

        initFileWritePlugin();

    });




    function getCarNos${pageId}(){
      var data=  $('#distribute${pageId}').edatagrid('getChecked');
      return data;
    }


</script>



<table id="distribute${pageId}"
       rownumbers="true"
       fit="true" >

<thead>
<th checkbox="true"></th>
<th field="carNo">车号</th>
</thead>
</table>