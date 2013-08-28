<script>


    function downInvCl${pageId}(){
        $('#downInvCl${pageId}').linkbutton('disable')
        $.post('${createLink(controller: 'ncDown',action: 'InvClsDown')}',null,function(json){
            $('#downInvCl${pageId}').showMessage(json);
            $.messager.alert('完成','下载任务完成!','info');
        });
    }

    function downBdPake${pageId}(){
        $('#downBdPake${pageId}').linkbutton('disable')
        $.post('${createLink(controller: 'ncDown',action: 'BdPackDown')}',null,function(json){
            $('#downInvCl${pageId}').showMessage(json);
            $.messager.alert('完成','下载任务完成!','info');
        });
    }

    function downInv${pageId}(){
        $('#downInv${pageId}').linkbutton('disable');
        $.post('${createLink(controller: 'ncDown',action: 'INvDown')}',null,function(json){
            $('#downInvCl${pageId}').showMessage(json);
            $.messager.alert('完成','下载任务完成!','info');
        });
    }

    function downMeasdoc${pageId}(){
        $('#downMeasdoc${pageId}').linkbutton('disable');
        $.post('${createLink(controller: 'ncDown',action: 'MeasDocDown')}',null,function(json){
            $('#downMeasdoc${pageId}').showMessage(json);
            $.messager.alert('完成','下载任务完成!','info');
        });
    }

    function downCurrency${pageId}(){
        $('#downCurrency${pageId}').linkbutton('disable');
        $.post('${createLink(controller: 'ncDown',action: 'CurrencyDown')}',null,function(json){
            $('#downCurrency${pageId}').showMessage(json);
            $.messager.alert('完成','下载任务完成!','info');
        });
    }

    function downArea${pageId}(){
        $('#downArea${pageId}').linkbutton('disable');
        $.post('${createLink(controller: 'ncDown',action: 'AreaDown')}',null,function(json){
            $('#downArea${pageId}').showMessage(json);
            $.messager.alert('完成','下载任务完成!','info');
        });
    }


    function downCust${pageId}(){
        $('#downCust${pageId}').linkbutton('disable');
        $.post('${createLink(controller: 'ncDown',action: 'CustDown')}',null,function(json){
            $('#downCust${pageId}').showMessage(json);
            $.messager.alert('完成','下载任务完成!','info');
        });
    }

    function downOnhandnum${pageId}(){
        $('#downOnhandnum${pageId}').linkbutton('disable');
        $.post('${createLink(controller: 'ncDown',action: 'onHandnumDown')}',null,function(json){
            $('#downOnhandnum${pageId}').showMessage(json);
            $.messager.alert('完成','下载任务完成!','info');
        });
    }

</script>


<p>下载数据</p>
<div>
    <a href="#" id="downInvCl${pageId}" class="easyui-linkbutton" onclick="downInvCl${pageId}();">存货分类下载</a>
    <a href="#" id="downBdPake${pageId}" class="easyui-linkbutton" onclick="downBdPake${pageId}();">包装信息下载</a>
    <a href="#" id="downMeasdoc${pageId}" class="easyui-linkbutton" onclick="downMeasdoc${pageId}();">计量单位下载</a>
    <a href="#" id="downCurrency${pageId}" class="easyui-linkbutton" onclick="downCurrency${pageId}();">币种下载</a>
    <a href="#" id="downArea${pageId}" class="easyui-linkbutton" onclick="downArea${pageId}();">地区分类下载</a>

</div>
<br>
<br>
<br>
<br>
<a href="#" id="downInv${pageId}" class="easyui-linkbutton" onclick="downInv${pageId}();">存货下载</a>
<a href="#" id="downCust${pageId}" class="easyui-linkbutton" onclick="downCust${pageId}();">客商下载</a>
<a href="#" id="downOnhandnum${pageId}" class="easyui-linkbutton" onclick="downOnhandnum${pageId}();">现存量下载</a>

