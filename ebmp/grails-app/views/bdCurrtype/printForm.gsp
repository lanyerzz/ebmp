<form id="printForm${pageId}" action="save" >

    <fieldset class="form">
        <div>
            <label for="templet">
                <g:message code="tmTempletallot.tmTemplet.label"></g:message>
            </label>
            <g:refTemplate id="templet" code="refTmTemplet" model="[id:'templet'+pageId,name:'templet.id']" required="true"></g:refTemplate>
        </div>
    </fieldset>
</form>