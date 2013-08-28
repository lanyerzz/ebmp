<script>


    function fpmx${pageId}(){


        var data= $('#bodyTable${pageId}').datagrid('getRows');



        if(data.length>0){

            $.messager.confirm('警告','单据明细将被清除,确认要重新分配明细?',function(q){
                if(q){

                    onCreateDistribute${pageId}();
                }else{

                }
            });
        }else{
            onCreateDistribute${pageId}();
        }



    }


   function  onCreateDistribute${pageId}(){
       var hz=$('#zcdw${pageId}').combogrid('getValue');
       var hw=$('#hw${pageId}').combogrid('getValue');
       if(hz==null || hz=='')
       {
           $.messager.alert('警告！','转出单位不能为空！')
           return;
       }
       if(hw==null || hw=='')
       {
           $.messager.alert('警告！','货物不能为空！')
           return;
       }

       $('<div/>').dialog({
           title:'分配明细',
           iconCls:'icon-edit',
           resizable:false,
           modal:true,
           width:900,
           height:600,

           href:'${createLink(action:'createDistribute' )}?hz='+hz+'&hw='+hw+'&headId=${yzmtdhInstance?.id}',
           buttons:[{
               text : '分配',
               iconCls : 'icon-edit',
               handler : function() {
                   var d = $(this).closest('.window-body');
                   distribute${pageId}(d);
               }
           }],
           onClose : function() {
               $(this).dialog('destroy');
           }
       });
   }

    $(function(){

        <g:if test="${ac=='create'}">
            $('#bodyTable${pageId}').datagrid({});
        </g:if>
        <g:elseif test="${ac=='edit'}">
        $('#bodyTable${pageId}').datagrid({url:"${createLink(action: 'queryBody',id: yzmtdhInstance?.id)}"});
        </g:elseif>
        <g:elseif test="${ac=='show'}">
        $('#bodyTable${pageId}').datagrid({url:"${createLink(action: 'queryBody',id: yzmtdhInstance?.id)}"});
        </g:elseif>

    });

    function distribute${pageId}(d){
      var data=  getDistributeData${pageId}();
        if(data==false) return;
      $('#bodyTable${pageId}').datagrid('loadData',data);
        d.dialog('destroy');
    }
</script>

<g:if test="${ac!='show'}">
%{--按钮--}%
    <div id="bodytb${pageId}">
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="fpmx${pageId}()">
            分配明细
        </a>

    </div>
</g:if>

%{--表格--}%
<table id="bodyTable${pageId}"
        title="提单明细"
        remoteSort="false"
       rownumbers="true"
       fit="true" toolbar="#bodytb${pageId}" singleSelect="true"  >

    <thead>

    <tr>
        %{--合同号--}%
        <th field="rk.ht.contractNo" sortable="false" data-options="canSave:false,
        formatter:function(value,row){

            return getObjectAttr(row,'rk.ht.contractNo');
        }
    "><g:message code="baseContract.contractNo.label"/></th>
        %{--相关合同号--}%
        <th field="rk.ht.contractNo2" sortable="false"  data-options="canSave:false,
        formatter:function(value,row){

            return getObjectAttr(row,'rk.ht.contractNo2');
        }
    "><g:message code="baseContract.contractNo2.label"/></th>
        %{--批次--}%
        <th field="rk.pc" sortable="false" data-options="canSave:false,
        formatter:function(value,row){

            return getObjectAttr(row,'rk.pc');
        }
    "><g:message code="yzmtdb.pc.label"/></th>

        %{--入库类型--}%
        %{--上游单据类型--}%
        <th field="rk.sourceBillType.billtypename" sortable="false" data-options="canSave:false,
        formatter:function(value,row){

            return getObjectAttr(row,'rk.sourceBillType.billtypename');
        }
    "><g:message code="yzmtdb.sourceBillType.billtypename.label"/></th>
        %{--上游单据号--}%
        <th field="rk.sourceBillCode" sortable="false" data-options="canSave:false,
        formatter:function(value,row){

            return getObjectAttr(row,'rk.sourceBillCode');
        }
    "><g:message code="yzmtdb.sourceBillCode.label"/></th>

        <th field="tdsl" sortable="true" data-options="formatter:function(value,row){
            return getObjectAttr(row,'rk.insl');
        }">${message(code: 'yzmtdh.tdsl.label', default: 'Tdsl')}</th>



        <th field="bcky" sortable="true" data-options="sum:true">${message(code: 'yzmtdb.bcky.label', default: 'Bcky')}</th>

        <th field="bcsy" sortable="true" data-options="sum:true">${message(code: 'yzmtdb.bcsy.label', default: 'Bcsy')}</th>



        <th field="vnote" sortable="true">${message(code: 'yzmtdb.vnote.label', default: 'Vnote')}</th>

    </tr>
    </thead>
</table>