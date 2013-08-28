<form id="changeCorpForm"  method="post" >
    <fieldset class="form" >
        <div>
            <label>公司:</label>
            <td> <g:refTemplate code="refBdCorp" model="[id:'corp',name:'corp',required:true]"/></td>
            %{--<g:select name="corp" from="${com.app.bd.corp.BdCorp.list()}" optionValue="unitName" optionKey="id" value="${loginCorp}" noSelection="['null':'']" required="true"></g:select>--}%
        </div>
    </fieldset>
</form>