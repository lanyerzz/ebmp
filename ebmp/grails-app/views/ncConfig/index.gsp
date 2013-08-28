<script>

    function save${pageId}(){
        var form=  $('#form${pageId}').serialize();
        $.post('${createLink(action: 'save')}',form,function(json){

            $('#form${pageId}').showMessage(json);
        });
    }

    function save1${pageId}(){
        var form=  $('#form1${pageId}').serialize();
        $.post('${createLink(action: 'save1')}',form,function(json){

            $('#form${pageId}').showMessage(json);
        });
    }

</script>

<p>数据下载参数设置</p>
<div style="border-width: 5px;border-color: red;display: inline-block">
    <form id="form${pageId}" method="post">
        <fieldset class="form" >
            <g:render template="downConfig"/>
        </fieldset>
        <a href="#" class="easyui-linkbutton" onclick="save${pageId}();">保存</a>
    </form>

</div>
<hr>
<p>数据上传参数设置</p>
<div style="border-width: 5px;border-color: red;display: inline-block">
    <form id="form1${pageId}" method="post">
        <fieldset class="form" >
            <g:render template="upConfig"/>
        </fieldset>
        <a href="#" class="easyui-linkbutton" onclick="save1${pageId}();">保存</a>
    </form>

</div>