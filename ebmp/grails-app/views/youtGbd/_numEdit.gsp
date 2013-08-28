<script>
    function mz1Change${pageId}(newValue,oldValue){
        var pz1=$('#pz1${pageId}').numberbox('getValue');
        var fysl1=Number(newValue)-Number(pz1)
        $('#fysl1${pageId}').numberbox('setValue',fysl1)
    }
    function pz1Change${pageId}(newValue,oldValue){
        var mz1=$('#mz1${pageId}').numberbox('getValue');
        var fysl1=Number(mz1)-Number(newValue)
        $('#fysl1${pageId}').numberbox('setValue',fysl1)
    }
</script>
<form id="numForm${pageId}"  method="post" >
    <fieldset class="form" >
        <span  class="fieldcontain  ">
            <label for="pz1${pageId}" class="required">
                <g:message code="youtGbd.pz.label" default="Pz" />

            </label>


            <input id="pz1${pageId}" name="pz"  value="${youtGbdInstance?.pz}" class="easyui-numberbox" style="color: red" data-options="precision:2,onChange:pz1Change${pageId}" >


        </span>


        <span  class="fieldcontain  ">
            <label for="mz1${pageId}" class="required">
                <g:message code="youtGbd.mz.label" default="Mz" />

            </label>


            <input id="mz1${pageId}" name="mz"  value="${youtGbdInstance?.mz}" class="easyui-numberbox" style="color: red" data-options="precision:2,onChange:mz1Change${pageId}" >


        </span>

        <span  class="fieldcontain  ">
            <label for="fysl1${pageId}" class="required">
                <g:message code="youtGbd.fysl.label" default="Fysl" />

            </label>


            <input id="fysl1${pageId}" name="fysl"  value="${youtGbdInstance?.fysl}" class="easyui-numberbox disabled" style="color: red" data-options="precision:2" readonly="">


        </span>
    </fieldset>
</form>