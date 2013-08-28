
<form id="batchForm${pageId}" method="post">


    <div id="divpubBilltype${pageId}" class="fieldcontain  required">
        <label for="pubBilltype${pageId}">
            <g:message code="pubActionscript.pubBilltype.label" default="Pub Billtype" />
            <span class="required-indicator">*</span>
        </label>
        <g:refTemplate code="refPubBilltype" model="[id:'pubBilltype',name:'pubBilltype.id']" required="true"></g:refTemplate>

    </div>
    <br>
    <hr>

    <div class="fieldcontain">
        <label for="beforeQuery">beforeQuery</label>
        <input type="checkbox" id="beforeQuery" name="beforeQuery" title="beforeQuery">
    </div>
    <div class="fieldcontain">
        <label for="afterQuery">afterQuery</label>
        <input type="checkbox" id="afterQuery" name="afterQuery" title="afterQuery">
    </div>
    <div class="fieldcontain">
        <label for="beforeCreate">beforeCreate</label>
        <input type="checkbox"  id="beforeCreate" name="beforeCreate" title="beforeCreate">
    </div>
    <div class="fieldcontain">
        <label for="afterCreate">afterCreate</label>
        <input type="checkbox"  id="afterCreate" name="afterCreate" title="afterQuery">
    </div>
    <div class="fieldcontain">
        <label for="beforeDelete">beforeDelete</label>
        <input type="checkbox" id="beforeDelete" name="beforeDelete" title="beforeDelete">
    </div>
    <div class="fieldcontain">
        <label for="afterDelete">afterDelete</label>
        <input type="checkbox" id="afterDelete" name="afterDelete" title="afterDelete">

    </div>
    <div class="fieldcontain">
        <label for="beforeSave">beforeSave</label>
        <input type="checkbox" id="beforeSave" name="beforeSave" title="beforeSave">
    </div>
    <div class="fieldcontain">
        <label for="afterSave">afterSave</label>
        <input type="checkbox" id="afterSave" name="afterSave" title="afterSave">
    </div>
    <div class="fieldcontain">
        <label for="beforeCheck">beforeCheck</label>
        <input type="checkbox" id="beforeCheck" name="beforeCheck" title="beforeCheck">
    </div>
    <div class="fieldcontain">
        <label for="afterCheck">afterCheck</label>
        <input type="checkbox" id="afterCheck" name="afterCheck" title="afterCheck">
    </div>
    <div class="fieldcontain">
        <label for="beforeUnCheck">beforeUnCheck</label>
        <input type="checkbox" id="beforeUnCheck" name="beforeUnCheck" title="beforeUnCheck">
    </div>
    <div class="fieldcontain">
        <label for="afterUnCheck">afterUnCheck</label>
        <input type="checkbox" id="afterUnCheck" name="afterUnCheck" title="afterUnCheck">
    </div>
    <div class="fieldcontain">
        <label for="beforeQueryBody">beforeQueryBody</label>
        <input type="checkbox" id="beforeQueryBody" name="beforeQueryBody" title="afterUnCheck">
    </div>
    <div class="fieldcontain">
    <label for="afterQueryBody">afterQueryBody</label>
    <input type="checkbox" id="afterQueryBody" name="afterQueryBody" title="afterUnCheck">
</div>
</form>

