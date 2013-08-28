<%@ page import="com.app.ywms.rk.hyjh.Yhyjh" %>
<script>

    /**
    *命名规则  onSelect+参照id+pageId
* @param index
* @param data
     */
    function onSelectbdCumandoc${pageId}(index,data){
        if(data==null){
            var form=$('#form${pageId}');
            $('#bdCumandoctel',form).val('');
            $('#bdCumandoclinkman',form).val('');
            $('#bdCumandoclinkmail',form).val('');
        }else{
            var form=$('#form${pageId}');

            $('#bdCumandoctel',form).val(data.pkCubasdoc.phone);
            $('#bdCumandoclinkman',form).val(data.pkCubasdoc.linkman);
            $('#bdCumandoclinkmail',form).val(data.pkCubasdoc.email);
        }
    }
    /**
     *命名规则  onChange+参照id+pageId
     * @param newValue
     * @param oldValue
     */
    function onChangebdCumandoc${pageId}(newValue, oldValue){

            var form=$('#form${pageId}');
            $('#bdCumandoctel',form).val('');
            $('#bdCumandoclinkman',form).val('');
            $('#bdCumandoclinkmail',form).val('');

    }
</script>

<g:hiddenField name="id" value="${yhyjhInstance?.id}" />
<g:hiddenField name="version" value="${yhyjhInstance?.version}" />
<g:hiddenField name="billTypeCode" value="YHYJH"></g:hiddenField>
<g:hiddenField name="businessType.id" value="${yhyjhInstance?.businessType?.id}"></g:hiddenField>
    <span id="divbusinessName${pageId}" class="fieldcontain  " >
        <label for="businessName${pageId}"  >
            <g:message code="yhyjh.businessName.label" />

        </label>
        <input id="businessName${pageId}"  value="${yhyjhInstance?.businessType?.name}"  disabled=""/>

    </span>

    <span id="divbillno${pageId}" class="fieldcontain  " >
        <label for="billno"  >
            <g:message code="yhyjh.billno.label" default="Billno" />

        </label>
        <g:textField class="myui" name="billno" value="${yhyjhInstance?.billno}" disabled=""/>

    </span>


    <span id="divbilldate${pageId}" class="fieldcontain  required" >
        <label for="billdate${pageId}"  class="required">
            <g:message code="yhyjh.billdate.label" default="Billdate" />
            <span class="required-indicator">*</span>
        </label>
        <input name="billdate" id="billdate${pageId}" date class="easyui-datebox" required="" value="${yhyjhInstance?.billdate?.getTime()}">

    </span>

    <span id="divbdCumandoc${pageId}" class="fieldcontain  ">
        <label for="bdCumandoc${pageId}" class="required">
            <g:message code="yhyjh.bdCumandoc.label" default="Bd Cumandoc" />
            <span class="required-indicator">*</span>
        </label>
        <g:refTemplate code="refBdCustomer" model="[id:'bdCumandoc',name:'bdCumandoc.id',value:yhyjhInstance?.bdCumandoc?.id,required:true,onSelect:'onSelectbdCumandoc'+pageId,onChange:'onChangebdCumandoc'+pageId]"></g:refTemplate>

    </span>
    <span id="" class="fieldcontain ">
        <label for="bdCumandoctel${pageId}"  >
            <g:message code="yhyjh.bdCumandoctel.label" default="货主联系电话" />

        </label>
        <g:textField id="bdCumandoctel${pageId}" name="bdCumandoctel" class="myui" disabled="" ></g:textField>

    </span>
    <span id="" class="fieldcontain ">
        <label for="bdCumandoclinkman${pageId}"  >
            <g:message code="yhyjh.bdCumandoclinkman.label" default="联系人姓名" />

        </label>
        <g:textField id="bdCumandoclinkman${pageId}" name="bdCumandoclinkman"   disabled=""></g:textField>

    </span>


    <span id="" class="fieldcontain ">
        <label for="bdCumandoclinkmai${pageId}l"  >
            <g:message code="yhyjh.bdCumandoclinkmail.label" default="联系人邮箱" />

        </label>
        <g:textField id="bdCumandoclinkmail${pageId}" name="bdCumandoclinkmail"   disabled=""></g:textField>

    </span>



    <span id="divcddw${pageId}" class="fieldcontain  ">
        <label for="cddw${pageId}"  >
            <g:message code="yhyjh.cddw.label" default="Cddw" />

        </label>
        <g:refTemplate code="refBdCumandoc" model="[id:'cddw',name:'cddw.id',value:yhyjhInstance?.cddw?.id]"></g:refTemplate>


    </span>

    <span id="divkjxyzdw${pageId}" class="fieldcontain  ">
        <label for="kjxyzdw${pageId}" >
            <g:message code="yhyjh.kjxyzdw.label" default="Kjxyzdw" />

        </label>
        <g:refTemplate code="refBdCumandoc" model="[id:'kjxyzdw',name:'kjxyzdw.id',value:yhyjhInstance?.kjxyzdw?.id]"></g:refTemplate>

    </span>


    <span id="divchuanming${pageId}" class="fieldcontain  ">
        <label for="chuanming${pageId}" >
            <g:message code="yhyjh.chuanming.label" default="Chuanming" />

        </label>

        <g:refTemplate code="refYshipdoc" model="[id:'chuanming',name:'chuanming.id',value:yhyjhInstance?.chuanming?.id]"></g:refTemplate>

    </span>


    <span id="divhangci${pageId}" class="fieldcontain  ">
        <label for="hangci"  >
            <g:message code="yhyjh.hangci.label" default="Hangci" />

        </label>
        <g:textField class="easyui-validatebox" name="hangci" value="${yhyjhInstance?.hangci}"/>

    </span>


    <span id="divkbgk${pageId}" class="fieldcontain  ">
        <label for="kbgk${pageId}"  >
            <g:message code="yhyjh.kbgk.label" default="Kbgk" />

        </label>
        <g:textField class="easyui-validatebox myui" name="kbgk" id="kbgk${pageId}" value="${yhyjhInstance?.kbgk}"/>

    </span>

    <span id="divqhgk${pageId}" class="fieldcontain  ">
        <label for="qhgk${pageId}" >
            <g:message code="yhyjh.qhgk.label" default="Qhgk" />

        </label>
        <g:textField class="easyui-validatebox myui"  id="qhgk${pageId}"  name="qhgk" value="${yhyjhInstance?.qhgk}"/>

    </span>

    <span id="divwyfs${pageId}" class="fieldcontain  required">
        <label for="myfs${pageId}" class="required">
            <g:message code="yhyjh.myfs.label" default="Wyfs" />

        </label>

        <g:select name="myfs"  id="myfs${pageId}"  from="[[index:0,value:'内贸'],[index:1,value:'外贸'],[index:2,value:'内外贸']]" optionKey="index" optionValue="value"  value="${yhyjhInstance?.myfs}" required=""/>

    </span>


    <span id="divyjdhrq${pageId}" class="fieldcontain  ">
        <label for="yjdhrq${pageId}" >
            <g:message code="yhyjh.yjdhrq.label" default="Yjdhrq" />

        </label>
        <input name="yjdhrq" id="yjdhrq${pageId}" date class="easyui-datebox"  value="${yhyjhInstance?.yjdhrq?.getTime()}">

    </span>



<span id="divnote${pageId}" class="fieldcontain  ">
    <label for="note${pageId}" >
        <g:message code="yhyjh.note.label" default="Note" />

    </label>
    <g:textField class="easyui-validatebox myui" name="note" id="note${pageId}"  value="${yhyjhInstance?.note}"/>

</span>
<hr>

    <span id="divmaker${pageId}" class="fieldcontain  ">
        <label for="maker${pageId}" >
            <g:message code="yhyjh.maker.label" default="Maker" />

        </label>
        <input type="hidden" name="maker.id"   value="${yhyjhInstance?.maker?.id}">
        <input id="maker${pageId}" disabled=""  class="myui" value="${yhyjhInstance?.maker?.userRealName}">

    </span>

    <span id="divmakeDate${pageId}" class="fieldcontain  ">
        <label for="makeDate${pageId}" >
            <g:message code="yhyjh.makeDate.label" default="Make Date" />

        </label>
        <g:hiddenField name="checkDate" value="${yhyjhInstance?.checkDate?.getTime()}"></g:hiddenField>
        <input name="makeDate" id="makeDate${pageId}" date  disabled="" value="${yhyjhInstance?.makeDate?.getTime()}">
    </span>



    <span id="divchecker${pageId}" class="fieldcontain  ">
        <label for="checker" >
            <g:message code="yhyjh.checker.label" default="Checker" />

        </label>

        <input  id="checker" class="myui" value="${yhyjhInstance?.checker?.userRealName}" disabled="">

    </span>

    <span id="divcheckDate${pageId}" class="fieldcontain  ">
        <label for="checkDate${pageId}" >
            <g:message code="yhyjh.checkDate.label" default="Check Date" />

        </label>

        <input name="checkDate" id="checkDate${pageId}" date  value="${yhyjhInstance?.checkDate?.getTime()}" disabled="">


    </span>

    <span id="divbdCorp${pageId}" class="fieldcontain  ">
        <label for="bdCorp" >
            <g:message code="yhyjh.bdCorp.label" default="Bd Corp" />

        </label>
        <input id="bdCorp" name="bdCorp.unitname" class="myui" disabled="" value="${yhyjhInstance?.bdCorp?.unitName}">
        <input type="hidden" name="bdCorp.id"  value="${yhyjhInstance?.bdCorp?.id}">

    </span>



