<%@ page import="com.app.ywms.ck.fhtzd.Yfhtzd" %>
<script>
    <g:if test="${yfhtzdInstance?.yjys==false}">
    $(function(){
        $('#spansjrq${pageId}').hide();
        $('#spanjsr${pageId}').hide();
        %{--$('#yjys${pageId}').hide();--}%
    });
    </g:if>

    function onyjys${pageId}(t){
       var obj= $("#form${pageId}").serializeObject();
       if(obj.yjys){
           $('#spansjrq${pageId}').show();
           $('#spanjsr${pageId}').show();
       }else{
           $('#spansjrq${pageId}').hide();
           $('#spanjsr${pageId}').hide();
       }
    }

    function onhw${pageId}(index,data){

        if(data==null){

            $('#invspec${pageId}').val('');
            $('#invtype${pageId}').val('');
        }else{
            $('#invspec${pageId}').val(data.pkInvbasdoc.invspec);
            $('#invtype${pageId}').val(data.pkInvbasdoc.invtype);
          }

    }

</script>

<g:hiddenField id="id${pageId}" name="id" value="${yfhtzdInstance?.id}"/>
<g:hiddenField name="version" value="${yfhtzdInstance?.version}"/>
<g:hiddenField name="businessType.id" value="${yfhtzdInstance?.businessType?.id}"/>
<g:hiddenField name="billTypeCode" value="${yfhtzdInstance?.billTypeCode}"></g:hiddenField>
<g:hiddenField name="billtype.id" value="${yfhtzdInstance?.billtype?.id}"></g:hiddenField>
<g:hiddenField name="sourceBillType.id" value="${yfhtzdInstance?.sourceBillType?.id}"></g:hiddenField>
<g:hiddenField name="sourceBillTypeCode" value="${yfhtzdInstance?.sourceBillTypeCode}"></g:hiddenField>
<g:hiddenField name="bdCorp.id" value="${yfhtzdInstance?.bdCorp?.id}"></g:hiddenField>


<span class="fieldcontain">
    <label for="businessType${pageId}">
        <g:message code="yfhtzd.businessType.label"/>

    </label>


    <input id="businessType${pageId}" name="businessType" disabled="" value="${yfhtzdInstance?.businessType?.name}">

</span>

<span class="fieldcontain">
    <label for="billno${pageId}">
        <g:message code="yfhtzd.billno.label" default="Billno"/>

    </label>


    <input id="billno${pageId}" name="billno" disabled=""  value="${yfhtzdInstance?.billno}">

</span>


<span class="fieldcontain">
    <label for="billdate${pageId}" class="required">
        <g:message code="yfhtzd.billdate.label" default="Billdate"/>

    </label>


    <input id="billdate${pageId}" name="billdate" date value="${yfhtzdInstance?.billdate?.getTime()}" class="easyui-datebox" required="" validType="dateValidate">

</span>



<span class="fieldcontain">
    <label for="khtdh${pageId}">
        <g:message code="yfhtzd.khtdh.label" default="Khtdh"/>

    </label>


    <input id="khtdh${pageId}" name="khtdh" value="${yfhtzdInstance?.khtdh}">

</span>



<span class="fieldcontain">
    <label for="yxrq${pageId}" class="required">
        <g:message code="yfhtzd.yxrq.label" default="Yxrq"/>

    </label>


    <input id="yxrq${pageId}" name="yxrq" value="${yfhtzdInstance?.yxrq?.getTime()}" class="easyui-datetimebox" datetime required="" validType="datetimeValidate">

</span>


<span class="fieldcontain">
    <label for="thdw${pageId}" class="required">
        <g:message code="yfhtzd.thdw.label" default="提货单位"/>

    </label>

    <g:refTemplate code="refBdCumandoc"
                   model="[id: 'thdw', name: 'thdw.id', value: yfhtzdInstance?.thdw?.id,required:true]"></g:refTemplate>

</span>

<span class="fieldcontain  ">
    <label for="hw${pageId}" class="required">
        <g:message code="yfhtzd.hw.label" default="货物"/>

    </label>

    <g:refTemplate code="refBdInvmandoc"
                   model="[id: 'hw', name: 'hw.id', value: yfhtzdInstance?.hw?.id,required:true,onSelect:'onhw'+pageId]"></g:refTemplate>

</span>


<span class="fieldcontain  ">
    <label for="invspec${pageId}" class="">
        <g:message code="yfhtzd.invspec.label" />

    </label>

    <input id="invspec${pageId}" disabled="" value="${yfhtzdInstance?.hw?.pkInvbasdoc?.invspec}">

</span>


<span class="fieldcontain  ">
    <label for="invtype${pageId}" class="">
        <g:message code="yfhtzd.invtype.label"/>

    </label>
    <input id="invtype${pageId}" disabled="" value="${yfhtzdInstance?.hw?.pkInvbasdoc?.invtype}">

</span>



<span class="fieldcontain  ">
    <label for="shdw${pageId}" class="required">
        <g:message code="yfhtzd.shdw.label" default="Shdw"/>

    </label>




    <g:refTemplate code="refBdCumandoc"
                   model="[id: 'shdw', name: 'shdw.id', value: yfhtzdInstance?.shdw?.id,required:true]"></g:refTemplate>

</span>



<span class="fieldcontain  ">
    <label for="tzsl${pageId}" class="required">
        <g:message code="yfhtzd.tzsl.label" default="Tzsl"/>

    </label>


    <input id="tzsl${pageId}" name="tzsl" value="${yfhtzdInstance?.tzsl}" class="easyui-numberbox" data-options="precision:2" required="">

</span>


<span class="fieldcontain ">
    <label for="cfkz${pageId}" class="required">
        <g:message code="yfhtzd.cfkz.label" default="Cfkz"/>
    </label>


    <input id="cfkz${pageId}" name="cfkz" required="" value="${yfhtzdInstance?.cfkz}" class="easyui-combobox" data-options="panelHeight:'auto',editable:false,valueField:'index',textField:'value',data:[{index:'0',value:'提单内控制超发'},{index:'1',value:'通知单内控制超发'},{index:'2',value:'严禁任何形式的超发'}]">

</span>
<span class="fieldcontain  ">
    <label for="zyfs${pageId}" class="required">
        <g:message code="yfhtzd.zyfs.label" default="Zyfs"/>

    </label>

    <input id="zyfs${pageId}" name="zyfs" value="${yfhtzdInstance?.zyfs?:'truck'}" required="" class="easyui-combobox" data-options="panelHeight:'auto',editable:false,valueField:'index',textField:'value',data:[{index:'house',value:'管道直放'},{index:'ship',value:'船运'},{index:'train',value:'火车'},{index:'truck',value:'槽车'},{index:'tz',value:'桶装'},{index:'tzdl',value:'定量灌装'}]">

</span>



<span class="fieldcontain">
    <label for="ccm${pageId}" class="required">
        <g:message code="yfhtzd.ccm.label" default="Ccm"/>

    </label>


    <input id="ccm${pageId}" name="ccm" value="${yfhtzdInstance?.ccm}" required="" class="easyui-validatebox">

</span>



<span class="fieldcontain  ">
    <label for="gch${pageId}">
        <g:message code="yfhtzd.gch.label" default="Gch"/>

    </label>


    <input id="gch${pageId}" name="gch" value="${yfhtzdInstance?.gch}">

</span>


<span class="fieldcontain  ">
    <label for="md${pageId}">
        <g:message code="yfhtzd.md.label" default="Md"/>

    </label>


    <input id="md${pageId}" name="md" value="${yfhtzdInstance?.md}">

</span>


<span class="fieldcontain  ">
    <label for="tj${pageId}">
        <g:message code="yfhtzd.tj.label" default="Tj"/>

    </label>


    <input id="tj${pageId}" name="tj" value="${yfhtzdInstance?.tj}">

</span>



<span class="fieldcontain  ">
    <label for="fhzt${pageId}">
        <g:message code="yfhtzd.fhzt.label" default="Fhzt"/>

    </label>


    <input id="fhzt${pageId}" name="fhzt" value="${yfhtzdInstance?.fhzt}">

</span>

<span class="fieldcontain  ">
    <label for="thtzsjh${pageId}">
        <g:message code="yfhtzd.thtzsjh.label" default="Thtzsjh"/>

    </label>


    <input id="thtzsjh${pageId}" name="thtzsjh" value="${yfhtzdInstance?.thtzsjh}">

</span>

<span class="fieldcontain  ">
    <label for="yjys${pageId}">
        <g:message code="yfhtzd.yjys.label" default="Yjys"/>

    </label>

    <g:checkBox name="yjys" id="yjys${pageId}"  value="${yfhtzdInstance?.yjys}"    onchange="onyjys${pageId}(this)"></g:checkBox>

    %{--<input type="checkbox" id="yjys${pageId}" name="yjys" onchange="onyjys${pageId}(this)" value="true">--}%

</span>
<span class="fieldcontain  "  id="spansjrq${pageId}">
    <label for="sjrq${pageId}">
        <g:message code="yfhtzd.sjrq.label" default="Sjrq"/>

    </label>


    <input id="sjrq${pageId}" name="sjrq" value="${yfhtzdInstance?.sjrq}" date class="easyui-datebox">

</span>




<span class="fieldcontain  " id="spanjsr${pageId}">
    <label for="jsr${pageId}">
        <g:message code="yfhtzd.jsr.label" default="Jsr"/>

    </label>

    <g:refTemplate code="refBdPsndoc"
                   model="[id: 'jsr', name: 'jsr.id', value: yfhtzdInstance?.jsr?.id]"></g:refTemplate>

</span>





<span class="fieldcontain-fat  ">
    <label for="jsms${pageId}">
        <g:message code="yfhtzd.jsms.label" default="Jsms"/>

    </label>


    <input id="jsms${pageId}" style="width: 600px" name="jsms" value="${yfhtzdInstance?.jsms}">

</span>



<span class="fieldcontain-fat" >
    <label for="bz${pageId}">
        <g:message code="yfhtzd.bz.label" default="Bz"/>

    </label>


    <input id="bz${pageId}" name="bz" style="width: 600px" value="${yfhtzdInstance?.bz}"/>

</span>
<hr>
<span class="fieldcontain  ">
    <label for="maker${pageId}">
        <g:message code="yfhtzd.maker.label" default="Maker"/>

    </label>

    <g:hiddenField name="maker.id" value="${yfhtzdInstance?.maker?.id}"></g:hiddenField>
    <input id="maker${pageId}" name="maker" value="${yfhtzdInstance?.maker?.userRealName}" disabled="true"
           canSave="false">

</span>

<span class="fieldcontain  ">
    <label for="makeDate_${pageId}">
        <g:message code="yfhtzd.makeDate.label" default="Make Date"/>

    </label>

    <g:hiddenField name="makeDate" value="${yfhtzdInstance?.makeDate?.getTime()}"></g:hiddenField>
    <input id="makeDate_${pageId}" name="makeDate_" value="${yfhtzdInstance?.makeDate?.getTime()}" disabled="true" date>

</span>

<span class="fieldcontain  ">
    <label for="checker${pageId}">
        <g:message code="yfhtzd.checker.label" default="Checker"/>

    </label>


    <input id="checker${pageId}" name="checker" value="${yfhtzdInstance?.checker?.userRealName}" disabled="true"
           canSave="false">


</span>
<span class="fieldcontain  ">
    <label for="checkDate${pageId}">
        <g:message code="yfhtzd.checkDate.label" default="Check Date"/>

    </label>


    <input id="checkDate${pageId}" name="checkDate" value="${yfhtzdInstance?.checkDate?.getTime()}" date disabled="">

</span>

<span class="fieldcontain  ">
    <label for="bdCorp${pageId}">
        <g:message code="yfhtzd.bdCorp.label" default="Bd Corp"/>

    </label>


    <input id="bdCorp${pageId}" name="bdCorp" value="${yfhtzdInstance?.bdCorp?.unitName}" disabled="true"
           canSave="false">

</span>