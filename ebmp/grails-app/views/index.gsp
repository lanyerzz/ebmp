
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>WMS</title>
    <link rel="stylesheet" type="text/css" href="${resource(dir:'css',file: 'my.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir:'themes',file: 'default/easyui.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir:'themes',file: 'icon.css')}">

    <script type="text/javascript" src="${resource(dir:'js',file: 'jquery-2.0.0.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js',file: 'jquery.easyui.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js',file: 'locale/easyui-lang-zh_CN.js')}" charset="utf-8"></script>
    <script type="text/javascript" src="${resource(dir:'js',file: 'my.js')}" charset="utf-8"></script>
    <script type="text/javascript" src="${resource(dir:'js',file: 'datagrid-scrollview.js')}" charset="utf-8"></script>
    <script type="text/javascript" src="${resource(dir:'js',file: 'datagrid-detailview.js')}" charset="utf-8"></script>
    <script type="text/javascript" src="${resource(dir:'js',file: 'jquery.edatagrid.js')}" charset="utf-8"></script>
    <script type="text/javascript" src="${resource(dir:'js',file: 'filterbuilder.js')}" charset="utf-8"></script>



    <g:include controller="loginInfo" action="index"></g:include>
   <g:include view="_plugin.gsp"></g:include>
    <script>


    function openNode(node){

        $.post('${createLink(controller: 'smFunction',action: 'queryNodeByNode')}',{funCode:node},function(json){

            openNodeInWindow(json);
        })


    }

    var _TRUE_LABEL='${g.message(code: 'default.boolean.true')}';
    var _FALSE_LABEL= '${g.message(code:'default.boolean.false')}';
    function booleanFormate(value,row){
        if(value=='true')
            return '${g.message(code: 'default.boolean.true')}';
        else
            return '${g.message(code:'default.boolean.false')}';
    }

        var userRealName

       // create_component_url="${createLink(controller: 'pubRefResource',action: 'createComponent')}";
        $(function(){

            $('#loginInfo').text('');
            $('#loginInfo').text('欢迎 ' + loginUser.userRealName + ',登录公司：' + loginCorp.unitName);
            $('#login_corp_id').val(loginCorp.id);
            $('#login_j_username').val(loginUser.username);


        });
        function changeCorp(d){
           var isValid= $('#changeCorpForm').form('validate');
            if (!isValid){
                //$.messager.progress('close');	// hide progress bar while the form is invalid
                return;
            }
            var obj= $('#changeCorpForm').serializeObject();
            $.post('${createLink(controller:'loginInfo',action: 'changeCorp')}',obj,function(json){
                window.location.reload();
            });
        }


        function onChangeCorp(){
            $('<div>').dialog({
                title:'切换登录公司',
                resizable:false,
                modal:true,
                width:300,
                height:180,

                href:'${createLink(controller:'loginInfo',action:'openChangeCorpDlg')}',
                buttons:[{
                    text : '切换',
                    handler : function() {
                        var d = $(this).closest('.window-body');
                        changeCorp(d);
                    }
                }],
                onClose : function() {
                    $(this).dialog('destroy');
                }
            });
        }

        function onLockWindow(){


            $.get('logout');


        }

        function openLock(){
            $('#password').val('');
            $('#validateCode').val('');
            $('#captchaImg').attr('src','${createLink(controller: 'captcha')}?'+Math.random());
            $('#lockWindow').dialog('open');
        }

        function unLock(){
            var obj = $('#lockWindowForm').serializeObject();
            obj['ajax']=true;

            $.post('j_spring_security_check',obj,function(json){
                if(json.error!=null && json.error !=undefined){
                    $('#login_message').html(json.error);
                    $('#captchaImg').attr('src','${createLink(controller: 'captcha')}?'+Math.random());
                }else{
                    $('#lockWindow').dialog('close');
                }


            });
        }


        function deleteLink(e, node){

            e.preventDefault();

            var isLeaf=$('#funTreeDefine').tree('isLeaf', node.target);
            if(!isLeaf) return;
            $('#funTreeDefine').tree('select', node.target);
            // display context menu
            $('#deletemenu').menu('show', {
                left: e.pageX,
                top: e.pageY

            });
        }

        function ondeletedefine(item){

            var node= $('#funTreeDefine').tree('getSelected');
            $.post('${createLink(controller: 'smUserinterface',action: 'delete')}',{id:node.id},function(json){
                $('#funTreeDefine').tree('remove',node.target);
            });

        }

        function addDefine(node){


                $('#funTreeDefine').tree('append',{

                    data:[node]
                });


        }

    function _onBeforeClose(title,index){

      var tab=  $('#centerTabs').tabs('getTabIndex',index);


    }

    </script>
</head>
<body class="easyui-layout" >

<div id="lockWindow" class="easyui-dialog" title="登陆" style="width:400px;height:200px;"
     data-options="resizable:true,modal:true,closed:true,closable:false" >
    <div id="login_message" style=" margin-left: 30px;margin-top: 10px;
    color: #cc0000;"></div>
    <form id="lockWindowForm" method="post" onsubmit="unLock();return false;" style="margin-top: 10px">
        <fieldset class="form">
            <input type="hidden" id="login_corp_id" name="loginCorp.id" >
            <input type="hidden" name="j_username" id="login_j_username">

            <div>
                <label style="width: 60px">密码:</label>
                <input id="password" name="j_password" style="width: 160px" type="password" class="easyui-validatebox"
                       required="true"/>
            </div>
            <div>
                <label for='validateCode' style="width: 60px" ><g:message code="springSecurity.login.validateCode.label"/>:</label>
                <input type='text' class='text_' name='validateCode' id='validateCode' style="width: 80px;margin-top: 0px;vertical-align: middle" />
                <img style="vertical-align: middle;cursor:pointer"  id="captchaImg" onclick="this.src='${createLink(controller: 'captcha')}?'+Math.random();" height="25px" style="margin-top:0px">
            </div>
            <div style="vertical-align: middle;text-align: center;margin-top: 20px">
                <input type="submit" value="登陆" >
            </div>
        </fieldset>
    </form>

</div>

<div id="deletemenu" class="easyui-menu" style="width:120px;" data-options="onClick:ondeletedefine">
    <div>删除快捷方式</div>
</div>
<div id="public_ref"></div>
    <div data-options="region:'north',split:false,border:false" style="height:50px;background:#1C3A70;padding:0px;overflow: hidden" >
        <div style="height: 36px;
        line-height: 36px;
        overflow: hidden;
        float: left;
        padding-left: 20px;
        padding-top: 13px;
        font-size: 20px;
        font-weight: bold;
        color: white;">EBMP 液态仓储管理系统</div>
        <div style="float:right;padding-top:10px;padding-right:20px;">
            <div id="printView_view" style="height: 0px;"></div>
            <div id="fileWritePlugin" style="height: 0px;"> </div>
            <div id="commPluginView" style="height: 0px;"></div>


             %{--<a href="#" onclick="alert(document.commPlugin.commBuffer);">${resource(file: 'applet',base: 'http://localhost:8080/ebmp')}</a>--}%
            <div style="text-align: right;height: 10px" id="loadMsg"></div>

            <div style="float:right;padding-top:4px;">
                <span id="loginInfo" style="margin-right: 40px;color: #bfbfbf"></span>
                <a href="#" ></a>
                %{--<a href="#" onclick="onChangeCorp()">切换公司</a>--}%
                <a href="#" onclick="onLockWindow()">锁屏</a>
                <a href="#" onclick="">修改密码</a>
                <a href="${createLink(controller:'logout',action:'index')}">退出</a>

            </div>
        </div>
    </div>
    <div data-options="region:'west',split:true,title:'功能菜单'" style="width:150px;padding:0px;" id="funNode" >

        <div class="easyui-accordion" style="width:auto;height:636px;padding: 0px;margin-left: 0px" data-options="fit:true,border:false">

            <div title="快捷键" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;">
                <ul id="funTreeDefine"   class="easyui-tree" data-options="url:'${createLink(controller: 'smUserinterface',action: 'query')}',onDblClick: openMainTag,
                    onContextMenu:deleteLink">
                </ul>
            </div>
            <g:include controller="smFunction" action="queryModuleByUser"/>

        </div>
    </div>

    <div data-options="region:'south',border:false" style="height:5px;background:#A9FACD;padding:10px;"></div>
    <div id="center" data-options="region:'center'" >


        <div id="centerTabs" class="easyui-tabs" data-options="tools:'#tab-tools',fit:true, onBeforeClose: function(title){ }" style="width:auto;height:662px;">
            <div title="桌面" data-options="fit:true"  >

            </div>
            %{--<div title="Tab2" data-options="closable:true,cache:false,href:'tabs_href_test.html'" style="padding:20px;">
                This is Tab2 with close button.
            </div>--}%

       %{--     <div title="Tab4 with iframe" data-options="closable:true" style="overflow:hidden">
                <iframe scrolling="yes" frameborder="0"  src="http://www.jeasyui.com/forum/index.php" style="width:100%;height:100%;"></iframe>
            </div>--}%





    </div>
</div>
</body>
</html>