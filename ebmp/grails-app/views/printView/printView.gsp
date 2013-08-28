<script>
    function onprintView_Print(tmid){

      //var tempid=  $('#printView_templet').val();
      var url= window.location.host;

       url="http://"+url;

        var params={templet:tmid,queryParams:${_params}};

       $('#printView_view').html(" <APPLET  name='printer' CODE = 'com.app.applet.print.PrintViewAplet.class' ARCHIVE = 'jreprint.jar,commons-digester-2.1.jar,jasperreports-applet-5.1.0.jar,jasperreports-5.1.0.jar,commons-logging-1.1.1.jar,commons-collections-2.1.1.jar' WIDTH = '0' HEIGHT = '0'>  <PARAM NAME = 'REPORT_URL' VALUE ='"+url+"${url}'> <PARAM NAME = 'CODEBASE' VALUE ='"+url+"${resource(file: 'applet')}'> <PARAM NAME = 'sessionid' VALUE ='${request.getSession().getId()}'> <PARAM NAME = 'senddata' VALUE ='data="+encodeURI(JSON.stringify(params))+"'> <hr>  </APPLET>");


      $('#printer_dlg').dialog('destroy');
    }
    function closeThisDlg(){
        var d = $(this).closest('.window-body');
        d.dialog('destroy');
    }
</script>

<g:if test="${data.size==0}">
<strong>
  请先配置该节点打印模板
</strong>
</g:if>
<g:elseif test="${data.size==1}">
    <script>

        $(onprintView_Print('${data[0].id}'));
        closeThisDlg();
    </script>
    <strong>正在打印，请稍等...</strong>
</g:elseif>
<g:elseif test="${data.size>1}">

                <div id="printView_view" style="margin-top: 50px">
                    <label for="templet" style="margin-left: 50px">
                        <g:message code="tmTempletallot.tmTemplet.label"></g:message>
                    </label>
                    <g:select id="printView_templet" name="templet" from="${data}" optionValue="templetName" optionKey="id" required="true" class="easyui-validatebox" />
                    <a href="#" class="easyui-linkbutton" iconCls=""
                       onclick="onprintView_Print(this.value)">${message(code: 'default.button.print.label', default: '打印')}</a>
                </div>

</g:elseif>