<g:set var="p_pageId" value="${java.util.UUID.randomUUID().toString().replaceAll('-','')}"></g:set>
<script>
    function read${p_pageId}(){
        $('#readCommPlugin${p_pageId}').html("<p style='font-size: 90px;'>"+(Number(readWeighbridge())/1000).toFixed(2) +"</p>");


    }
    $(weighbridge_init());

    var readWeighbridgeTimerId;

    function weighbridge_init(){

        //cookie中获取不到地磅参数
        var weighbridge_param= getCookie('weighbridge_param');
        var weighbridge_driver= getCookie('weighbridge_driver');


        if(weighbridge_param && weighbridge_driver){
            readWeighbridgeTimerId= setInterval(read${p_pageId},500);

            initWeighbridgePlugin(weighbridge_param,weighbridge_driver);



            %{--$('#readCommPlugin${p_pageId}').html("<iframe style='height: 100%;width: 100%;border-width: 0px' src='${createLink(action: 'createWeighbridgeApplet')}?weighbridge_param="+weighbridge_param+"&weighbridge_driver="+weighbridge_driver+"'></iframe>");--}%


            %{--$('#readCommPlugin${p_pageId}').html(" <APPLET  name='commPlugin' CODE = 'com.app.applet.weighbridge.WUI.class' ARCHIVE = 'commPlugin.jar,RXTXcomm.jar' WIDTH = '300' HEIGHT = '80'><PARAM NAME = 'CODEBASE' VALUE ='${resource(dir: 'applet')}'><param name='commParam' value='"+weighbridge_param+"'><param name='driver' value='"+weighbridge_driver+"'></APPLET>");--}%

        }else{
            weighbridge_setting();
//            setCookie('weighbridge_setting','COM1,1200, 8, 1, 0')
        }
    }


    function weighbridge_setting(){
        clearInterval(readWeighbridgeTimerId);
        $.post('${createLink(controller: 'YWeighbridge',action: 'query')}',null,function(json){
            if(json.rows.length==0){
                $.messager.alert('地磅参数未设置','地磅参数未设置');
            }
            else if(json.rows.length==1){//不需要用户选择
                setCookie('weighbridge_param',json.rows[0].commName+','+json.rows[0].ibit+','+json.rows[0].databits+','+json.rows[0].stopbits+','+json.rows[0].payity);
                setCookie('weighbridge_driver',json.rows[0].driver);
                weighbridge_init();
            }else {//用户选择对应的地磅参数
                var html=$('<input id="weighbridgePlugin" name="weighbridge" style="width: 200px">');


                $('#readCommPlugin${p_pageId}').html(html);

                $(html).combogrid(
                {
                    data:json.rows,
                    idField:'id',textField:'code', columns:[[
                    {field:'code',title:'${message(code: 'YWeighbridge.code.label', default: 'Code')}',width:100,sortable:true},
                    {field:'commName',title:'<g:message code="YWeighbridge.commName.label"  />',width:100,sortable:true},
                    {field:'ibit',title:'<g:message code="YWeighbridge.bit.label"  />',width:100,sortable:true},
                    {field:'databits',title:'<g:message code="YWeighbridge.databits.label"  />',width:100,sortable:true},
                    {field:'payity',title:'<g:message code="YWeighbridge.payity.label"  />',width:100,sortable:true},
                    {field:'stopbits',title:'<g:message code="YWeighbridge.stopbits.label"  />',width:100,sortable:true},
                    {field:'driver',title:'<g:message code="YWeighbridge.driver.label"  />',width:100,sortable:true}
                ]],panelWidth:530
                });
                $('#readCommPlugin${p_pageId}').append($('<br><br>'));
                $('#readCommPlugin${p_pageId}').append($('<input type="button" value="选择" style="width: 200px" onclick="weighbridge_onSelect()">'))
            }

        });

    }

    function weighbridge_onSelect(){

      var grid=  $('#weighbridgePlugin').combogrid('grid');

      var row = $(grid).datagrid('getSelected');

//        setCookie('weighbridge_setting',row.commName+','+row.ibit+','+row.databits+','+row.stopbits+','+row.payity);

       var param=row.commName+','+row.ibit+','+row.databits+','+row.stopbits+','+row.payity;
        setCookie('weighbridge_param',param);
        setCookie('weighbridge_driver',row.driver);
        setCookie('weighbridge_filepath',row.writeFilePath);
        setCookie('weighbridge_name',row.code);
        weighbridge_init();
    }

</script>


<div style="height: 100%;width: 100%;margin-top: 0px;border: 0">

    <div id="readCommPlugin${p_pageId}" style="background-color:#000000;margin-left: 0px;top: 0px;height: 100px;color: red;text-align: center;">

    </div>




    <div style="margin-top: 20px">
        <span  class="fieldcontain">
            <label  >
                最大自重
            </label>


            <input   value="${car?.max?:0}" disabled="" >

        </span>
        <span  class="fieldcontain">
            <label >
                最小自重
            </label>


            <input   value="${car?.min?:0}" disabled="" >

        </span>
        <span  class="fieldcontain">
            <label  >
                平均自重
            </label>


            <input    value="${((car?.max?:0)+(car?.min?:0))/2}" disabled="" >

        </span>
        <span  class="fieldcontain">
            <label  >
               上次称重
            </label>


            <input    value="${car?.current?:0}" disabled="" >

        </span>
    </div>
</div>

