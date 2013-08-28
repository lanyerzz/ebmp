<% import com.app.bd.invmandoc.BdInvmandoc %>
<% import com.app.bd.cumandoc.BdCumandoc %>
<% import grails.persistence.Event %>
<%=packageName%>
<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
<script>



    \$(function(){
        \$('#table\${pageId}').datagrid({
            url:"\${createLink(action: 'query')}?targetBill=\${targetBill}&businessType=\${businessType}",

            onDblClickRow:function(rowIndex, rowData){
                onShow\${pageId}();
            },
            view: detailview,
            detailFormatter:function(index,row){
                return '<div style="padding:2px"><table id="tb-sub\${pageId}-' + index + '" ></table></div>';
            },
            onExpandRow: function(index,row){
                \$('#tb-sub\${pageId}-'+index).datagrid({
                    url:'\${createLink(action: 'queryBody')}?headId='+row.id+'&targetBill=\${targetBill}',
                    fitColumns:true,
                    singleSelect:true,
                    rownumbers:true,

                    height:'auto',
                    singleSelect:false,
                    columns:[[]],
                    onResize:function(){
                        \$('#table\${pageId}').datagrid('fixDetailRowHeight',index);
                    },
                    onLoadSuccess:function(){
                        setTimeout(function(){
                            \$('#table\${pageId}').datagrid('fixDetailRowHeight',index);
                        },0);
                    }
                });
                \$('#table\${pageId}').datagrid('fixDetailRowHeight',index);
            }
        });
    });












    function onOpenQuery\${pageId}(){

        \$('<div/>').dialog({
            title:'查询',
            iconCls:'icon-search',
            resizable:true,
            modal:true,
//            fit:true,
            width :600,
            height:500,
            // inline:true,
            href:'\${createLink(action: 'createQuery')}',
            buttons:[{
                text : '查询',
                iconCls : 'icon-search',
                handler : function() {
                    var d = \$(this).closest('.window-body');
                    onQuery\${pageId}(d);
                }
            }],
            onClose : function() {
                \$(this).dialog('destroy');
            }
        });
    }

    function onQuery\${pageId}(d){

        var criters= getCriter\${pageId}();

        \$('#table\${pageId}').datagrid('reload',{queryParams:JSON.stringify(criters)});
        \$(d).dialog('destroy');
    }







</script>




%{--表格--}%
<table id="table\${pageId}"
       rownumbers="true"
       fit="true" toolbar="#tb\${pageId}" singleSelect="true"  pagination="true" pageSize="30">

    <thead>

    <tr>

        <% excludedProps = Event.allEvents.toList() << 'id' << 'version'
        allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
        props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && it.type != null && !Collection.isAssignableFrom(it.type) }
        Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
        props.eachWithIndex { p, i ->

                if (p.name=='maker') { %>
        <th field="${p.name}.userRealName" sortable="true" width="100" data-options="formatter:defaultFormatter"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}"/></th>
        <% }else if (p.name=='checker') { %>
        <th field="${p.name}.userRealName" sortable="true" width="100" data-options="formatter:defaultFormatter"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}"/></th>
        <% }else if (p.name=='makeDate') { %>
        <th field="${p.name}" sortable="true" width="100" data-options="formatter:dateFormate"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}"/></th>
        <% }else if (p.name=='checkDate') { %>
        <th field="${p.name}" sortable="true" width="100" data-options="formatter:dateFormate"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}"/></th>
        <% }else if (p.name=='bdCorp') { %>
        <th field="${p.name}.unitName" sortable="false" width="100" data-options="formatter:defaultFormatter"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}"/></th>
        <% }else if (p.type==Date) { %>
        <th field="${p.name}" sortable="true" width="100" data-options="formatter:dateFormate"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}"/></th>
        <% }else if (p.type==BdCumandoc) { %>
        <th field="${p.name}.pkCubasdoc.custname" sortable="true" width="100" data-options="formatter:defaultFormatter"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}"/></th>
        <% }else if (p.type==BdInvmandoc) { %>
        <th field="${p.name}.pkInvbasdoc.invname" sortable="true" width="100" data-options="formatter:defaultFormatter"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}"/></th>
        <% }else if (p.type==Boolean) { %>
        <th field="${p.name}" sortable="true" width="100" data-options="formatter:booleanFormate"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}"/></th>

        <%}else if(p.oneToOne){%>

        <th field="${p.name}.name" sortable="true" width="100" data-options="formatter:defaultFormatter"><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}"/></th>


        <% }else { %>
        <th field="${p.name}" sortable="true" width="100">\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}</th>
        <% }

        } %>
    </tr>
    </thead>
</table>



