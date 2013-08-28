<%@ page import="com.app.ywms.ck.gbd.YoutGbd" %>

<script>

    $(function(){
        initFileWritePlugin();
    });


    function pz${pageId}(){

        openWeighbridgeDlg(setPZ${pageId},'${youtGbdInstance?.tzd?.ccm}');


    }
    /**
    *写屏幕
     */
    function writePM${pageId}(){
        var path=getCookie('weighbridge_filepath');
        if(path){
            var name=getCookie('weighbridge_name');
           var pz= $('#pz${pageId}').numberbox('getValue');
            pz=Number(pz)*1000;
           var mz= $('#mz${pageId}').numberbox('getValue');
            mz=Number(mz)*1000;
            var fysl= $('#fysl${pageId}').numberbox('getValue');
            fysl=Number(fysl)*1000;
            var content=name+"：${youtGbdInstance?.tzd?.ccm}\r\n"+
                    "鹤位：${youtGbdInstance?.tzd?.hw?.pkInvbasdoc?.invname}\r\n"+
                    "空载："+(pz==0? '00000' : pz)+"\r\n"+
                    "满载："+(mz==0? '00000' : mz)+"\r\n"+
                    "实重："+(fysl==0? '00000' : fysl)+"\r\n";

                    fileWrite(content,path,false);
        }
    }
    function setPZ${pageId}(value){

        $('#pz${pageId}').numberbox('setValue',(Number(value)/1000).toFixed(2));

        writePM${pageId}();

    }
    function mz${pageId}(){

        openWeighbridgeDlg(setMZ${pageId},'${youtGbdInstance?.tzd?.ccm}');
    }

    function setMZ${pageId}(value){
        $('#mz${pageId}').numberbox('setValue',(Number(value)/1000).toFixed(2));
        writePM${pageId}();
    }

    function mzChange${pageId}(newValue,oldValue){
        var pz=$('#pz${pageId}').numberbox('getValue');
        var fysl=Number(newValue)-Number(pz)
        $('#fysl${pageId}').numberbox('setValue',fysl)
    }

    function fyslChange${pageId}(newValue,oldValue){



       var fysl=Number(newValue)


       var rows= $('#bodyTable${pageId}').datagrid('getRows')

        $.each(rows,function(i,v){


              if(fysl<=0)
                return;
            var bcsy

            if(!isNaN(v.bcsy)){
                bcsy=Number(v.bcsy)
            }else{
                bcsy=0
            }

            if(fysl>bcsy){
                v.outnum=bcsy
                fysl=fysl-bcsy
            }else{
                v.outnum=fysl
                fysl=0
            }

        });


        //超出发运数量

        if(fysl>0){
            $.each(rows,function(i,v){
                if(fysl<=0)
                    return;
                var max
                if(!isNaN(v.max)){
                    max=Number(v.max)
                }else{
                    max=0
                }
                if(fysl>max){
                    fysl=fysl-max+v.outnum
                    v.outnum=max

                }else{
                    v.outnum=v.outnum+fysl
                    fysl=0
                }
            });

        }

//        alert(JSON.stringify(rows))

        $('#bodyTable${pageId}').datagrid('loadData',rows);



    }

    function checkNum${pageId}(){
       var sum= $('#bodyTable${pageId}').datagrid('sum','outnum');
        var fysl=$('#fysl${pageId}').numberbox('getValue');

        if(sum!=fysl){
            $.messager.show({
                title:'消息',
                msg:'表头发运数量与表体发运数量总和不一致！'
            });
            return false;
        }
        return true;
    }

</script>


<g:hiddenField name="id" value="${youtGbdInstance?.id}" />
<g:hiddenField name="version" value="${youtGbdInstance?.version}" />
<g:hiddenField name="businessType.id" value="${youtGbdInstance?.businessType?.id}"/>
<g:hiddenField name="billtype.id" value="${youtGbdInstance?.billtype?.id}" ></g:hiddenField>
<g:hiddenField name="bdCorp.id" value="${youtGbdInstance?.bdCorp?.id}"></g:hiddenField>
<g:hiddenField name="tzd.id" value="${youtGbdInstance?.tzd?.id}"></g:hiddenField>




<span  class="fieldcontain  ">
    <label for="businessType${pageId}">
        <g:message code="youtGbd.businessType.label" default="Business Type" />

    </label>


    <input id="businessType\${pageId}" name="businessType"  value="${youtGbdInstance?.businessType?.name}" disabled="true"   >

</span>

<span  class="fieldcontain">
    <label for="billno${pageId}" class="required">
        <g:message code="youtGbd.billno.label" default="billno" />
    </label>


    <input id="billno${pageId}" name="billno"   value="${youtGbdInstance?.billno}" disabled=""  >

</span>

<span  class="fieldcontain">
    <label for="billdate${pageId}" class="required">
        <g:message code="youtGbd.billdate.label" default="Billdate" />
        <span class="required-indicator">*</span>
    </label>

    
    <input id="billdate${pageId}" name="billdate"   value="${youtGbdInstance?.billdate?.getTime()}" class="easyui-datebox" date  >
    
</span>

<span  class="fieldcontain">
    <label for="thdw${pageId}" >
        <g:message code="youtGbd.thdw.label"  />
    </label>


    <input id="thdw${pageId}" name="thdw"   value="${youtGbdInstance?.tzd?.thdw?.pkCubasdoc?.custname}" disabled="" >

</span>
<span  class="fieldcontain">
    <label for="hw${pageId}" >
        <g:message code="youtGbd.thdw.label"  />
    </label>


    <input id="hw${pageId}" name="hw"   value="${youtGbdInstance?.tzd?.hw?.pkInvbasdoc?.invname}" disabled="" >

</span>

<span  class="fieldcontain">
    <label for="invspec${pageId}" >
        <g:message code="youtGbd.invspec.label"  />
    </label>


    <input id="invspec${pageId}"   value="${youtGbdInstance?.tzd?.hw?.pkInvbasdoc?.invspec}" disabled="" >

</span>
<span  class="fieldcontain">
    <label for="invtype${pageId}" >
        <g:message code="youtGbd.invtype.label"  />
    </label>


    <input id="invtype${pageId}"   value="${youtGbdInstance?.tzd?.hw?.pkInvbasdoc?.invtype}" disabled="" >

</span>

<span  class="fieldcontain">
    <label for="cph${pageId}" >
        <g:message code="youtGbd.cph.label"  />
    </label>


    <input id="cph${pageId}"   value="${youtGbdInstance?.tzd?.ccm}" disabled="" >

</span>


<span  class="fieldcontain  ">
    <label for="tzsl${pageId}">
        <g:message code="youtGbd.tzsl.label" default="Tzsl" />

    </label>


    <input id="tzsl${pageId}" name="tzsl"  value="${youtGbdInstance?.tzd?.tzsl}" class="easyui-numberbox" style="color: red" data-options="precision:2" disabled="">


</span>

<span  class="fieldcontain  ">
    <label for="pz${pageId}" class="required">
        <g:message code="youtGbd.pz.label" default="Pz" />

    </label>


    <input id="pz${pageId}" name="pz"  value="${youtGbdInstance?.pz}" class="easyui-numberbox" style="color: red" data-options="precision:2" readonly="">


</span>


<span  class="fieldcontain  ">
    <label for="mz${pageId}" class="required">
        <g:message code="youtGbd.mz.label" default="Mz" />

    </label>


    <input id="mz${pageId}" name="mz"  value="${youtGbdInstance?.mz}" class="easyui-numberbox" style="color: red" data-options="precision:2,onChange:mzChange${pageId}" readonly="">


</span>

<span  class="fieldcontain  ">
    <label for="fysl${pageId}" class="required">
        <g:message code="youtGbd.fysl.label" default="Fysl" />

    </label>


    <input id="fysl${pageId}" name="fysl"  value="${youtGbdInstance?.fysl}" class="easyui-numberbox" style="color: red" data-options="precision:2,onChange:fyslChange${pageId}" readonly="">


</span>

<span class="fieldcontain ">
    <label for="cfkz${pageId}" class="required">
        <g:message code="yfhtzd.cfkz.label" default="Cfkz"/>
    </label>


    <input id="cfkz${pageId}" name="cfkz" required="" disabled="" value="${youtGbdInstance?.tzd.cfkz}" class="easyui-combobox" data-options="panelHeight:'auto',editable:false,valueField:'index',textField:'value',data:[{index:'0',value:'提单内控制超发'},{index:'1',value:'通知单内控制超发'},{index:'2',value:'严禁任何形式的超发'}]">

</span>
<span class="fieldcontain  ">
    <label for="zyfs${pageId}" class="required">
        <g:message code="yfhtzd.zyfs.label" default="Zyfs"/>

    </label>

    <input id="zyfs${pageId}" name="zyfs" value="${youtGbdInstance?.tzd?.zyfs}" disabled="" required="" class="easyui-combobox" data-options="panelHeight:'auto',editable:false,valueField:'index',textField:'value',data:[{index:'house',value:'管道直放'},{index:'ship',value:'船运'},{index:'train',value:'火车'},{index:'truck',value:'槽车'},{index:'tz',value:'桶装'},{index:'tzdl',value:'定量灌装'}]">

</span>


<span  class="fieldcontain  ">
    <label for="fhzt${pageId}">
        <g:message code="youtGbd.fhzt.label" default="Fhzt" />
        
    </label>

    
    <input id="fhzt${pageId}" name="fhzt"  value="${youtGbdInstance?.fhzt}">
    
</span>



<span  class="fieldcontain  ">
    <label for="fsr${pageId}">
        <g:message code="youtGbd.fsr.label" default="Fsr" />
        
    </label>

    


    <g:refTemplate code="refBdPsndoc" model="[id:'fsr',name:'fsr.id',value:youtGbdInstance?.fsr?.id]"></g:refTemplate>

    
</span>




<br>
<span  class="fieldcontain-fat  ">
    <label for="bz${pageId}">
        <g:message code="youtGbd.bz.label" default="bz" />

    </label>


    <g:textArea id="bz${pageId}" name="bz"  value="${youtGbdInstance?.bz}"   />

</span>

<hr>


<span  class="fieldcontain  ">
    <label for="maker${pageId}">
        <g:message code="youtGbd.maker.label" default="Maker" />

    </label>


    <g:hiddenField name="maker.id" value="${youtGbdInstance?.maker?.id}"></g:hiddenField>
    <input id="maker${pageId}" name="maker" value="${youtGbdInstance?.maker?.userRealName}" disabled="true"   canSave="false">

</span>

<span  class="fieldcontain  ">
    <label for="makeDate${pageId}">
        <g:message code="youtGbd.makeDate.label" default="Make Date" />

    </label>


    <g:hiddenField name="makeDate" value="${youtGbdInstance?.makeDate?.getTime()}"></g:hiddenField>
    <input id="makeDate${pageId}" name="makeDate" value="${youtGbdInstance?.makeDate?.getTime()}" disabled="true" date  >

</span>


<span  class="fieldcontain  ">
    <label for="checker${pageId}">
        <g:message code="youtGbd.checker.label" default="Checker" />

    </label>


    <input id="checker${pageId}" name="checker" value="${youtGbdInstance?.checker?.userRealName}" disabled="true"   canSave="false">

</span>



<span  class="fieldcontain  ">
    <label for="checkDate${pageId}">
        <g:message code="youtGbd.checkDate.label" default="Check Date" />

    </label>


    <input id="checkDate${pageId}" name="checkDate"   value="${youtGbdInstance?.checkDate}"  date disabled="" >

</span>


<span  class="fieldcontain  ">
    <label for="bdCorp${pageId}">
        <g:message code="youtGbd.bdCorp.label" default="Bd Corp" />

    </label>

    <input id="bdCorp${pageId}" name="bdCorp" value="${youtGbdInstance?.bdCorp?.unitName}" disabled="true"   >

</span>