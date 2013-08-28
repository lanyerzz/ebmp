<%@ page import="com.app.sm.user.SmUser" %>
<g:set var="ac" value="editPwd"></g:set>
<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
<div id="remoteErrors" class="errors" role="status" hidden=""></div>
<form id="editPwdform${pageId}" method="post" >
    <fieldset class="form">
        <g:hiddenField name="id" value="${smUserInstance?.id}"/>
        <g:hiddenField name="version" value="${smUserInstance?.version}"/>

        <div id="divpassword${pageId}}" class="fieldcontain  ">
            <label for="password">
                <g:message code="smUser.password.label" default="密码"/>

            </label>
            <input id="password" name="password"  type="password" value="" class="easyui-validatebox"
                   required="true"/>

            <div id="password_message" hidden="" name="message" class="errors" role="status"></div>
        </div>

        <div id="divrpassword${pageId}}" class="fieldcontain  ">
            <label for="rpassword">
                <g:message code="smUser.rpassword.label" default="确认密码"/>

            </label>
            <input id="rpassword"  type="password" value="" class="easyui-validatebox"
                   required="true" validtype="equals['#password']"/>
        </div>
    </fieldset>
</form>



