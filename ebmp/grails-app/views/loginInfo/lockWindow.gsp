<form id="lockWindowForm" method="post">
    <fieldset class="form">
        <g:hiddenField name="loginCorp.id" value="${data?.loginCorp}"></g:hiddenField>
        <g:hiddenField name="j_username" value="${data?.username}"></g:hiddenField>
        <div>
            <label>密码:</label>
            <input id="password" name="j_password"  type="password" class="easyui-validatebox"
                   required="true"/>
        </div>
        <div>
            <label for='validateCode'><g:message code="springSecurity.login.validateCode.label"/>:</label>
            <input type='text' class='text_' name='validateCode' id='validateCode' style="width: 118px;margin-top: 0px;vertical-align: middle" />
            <img style="vertical-align: middle;cursor:pointer" src="${createLink(controller:'captcha' )}" onclick="this.src='${createLink(controller: 'captcha')}?'+Math.random();" height="25px" style="margin-top:0px">
        </div>
    </fieldset>
</form>