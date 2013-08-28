<%@ page import="com.app.so.order.SoSale" %>

<script>
    $(function(){
        $('#form${pageId}').dateFormate();
    });


</script>

<g:set var="ac" value="create"></g:set>


<div id="card${pageId}" class="easyui-layout"  fit="true">
    <div id="head" data-options="region:'north',title:'订单',split:true" style="height:280px;" >
        <form id="form${pageId}"  method="post">
            <fieldset class="form" >
                <g:render template="../soRec/form"/>
            </fieldset>
        </form>

    </div>

    <div  data-options="region:'center',title:'',split:true,border:false" >
        <g:render template="../soRec/bodyList"></g:render>
    </div>





</div>