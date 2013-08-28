<script>




    var create_component_url="${createLink(controller: 'pubRefResource',action: 'createComponent')}";

    function initFileWritePlugin(){
        if(document.fileWritePlugin){

        }else{
            $('#fileWritePlugin').html(" <APPLET  name='fileWritePlugin' CODE = 'com.app.applet.file.FileWriter.class' ARCHIVE = 'fileWritePlugin.jar' WIDTH = '0' HEIGHT = '0'> <PARAM NAME = 'CODEBASE' VALUE ='${resource(dir: 'applet')}'></APPLET>");
        }
    }

    function fileWrite(content,filePath,append){

        if(document.fileWritePlugin)
            document.fileWritePlugin.write(content,filePath,append);
        else
            $.messager.alert('警告','插件未加载完成!');
    }


    function print(functionId,_controller,_action,params){
        var url='${createLink(controller: 'tmTemplet',action: 'queryPrintTemplet')}?functionId='+functionId+'&_controller='+_controller+'&_action='+_action+'&queryParams='+params;

        $('<div id="printer_dlg"/>').dialog({
            title:'打印',
            iconCls:'icon-print',
            resizable:false,
            modal:true,
            width:400,
            height:200,
            href:url,

            onClose : function() {
                $(this).dialog('destroy');
            }
        });
    }

    function readWeighbridge(){

        if(document.commPlugin)
            return document.commPlugin.getValue();
        else
            return 0;
    }
    function weighbridge_closeComm(){
        document.commPlugin.closeComm();
        $('#commPluginView').html("")
    }

    function weighbridge_stopRead(){
        return document.commPlugin.stopRead();

    }
    function weighbridge_startRead(){
        document.commPlugin.startRead();

    }
    function initWeighbridgePlugin(weighbridge_param , weighbridge_driver){
        if(document.commPlugin)
            return;
        $('#commPluginView').html(" <APPLET  name='commPlugin' CODE = 'com.app.applet.weighbridge.CommMain.class' ARCHIVE = 'commPlugin.jar,RXTXcomm.jar' WIDTH = '0' HEIGHT = '0'><PARAM NAME = 'CODEBASE' VALUE ='${resource(dir: 'applet')}'><param name='commParam' value='"+weighbridge_param+"'><param name='driver' value='"+weighbridge_driver+"'></APPLET><a href='#' onclick='weighbridge_closeComm()'>关闭Com口</a>");

    }


    function openWeighbridgeDlg(hander,carNo){


        $('<div />').dialog({
            title:'读磅',
            %{--content:"<iframe src='${createLink(controller: 'plugin',action: 'weighbridge')}?carNo="+carNo+" style='height: 100%;width: 400px;border-width: 0px'></iframe>",--}%
            href:'${createLink(controller: 'plugin',action: 'weighbridge')}?carNo'+carNo,
            resizable:false,
            modal:true,
            width:600,
            height:260,
            buttons:[{
                text : '确认',
                iconCls : 'icon-ok',
                handler : function() {

                    var value=   readWeighbridge();

                    hander(value);

                    var a = $(this).closest('.window-body');
//
                    a.dialog('destroy');
                }
            },{
                text : '参数设置',

                handler : function() {

                    weighbridge_setting();
                }
            }],
            onClose : function() {

                clearInterval(readWeighbridgeTimerId);
                $(this).dialog('destroy');
            }
    });
    }
</script>
