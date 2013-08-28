<%@ page import="com.app.sm.user.SmUser" %>


<g:hiddenField name="id" value="${smUserInstance?.id}"/>
<g:hiddenField name="version" value="${smUserInstance?.version}"/>


<span id="divusername${pageId}}" class="fieldcontain  ">
    <label for="username">
        <g:message code="smUser.username.label" default="用户名"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="username" value="${smUserInstance?.username}" class="easyui-validatebox myui" required="true"/>

</span>
<span id="divuserRealName${pageId}}" class="fieldcontain  ">
    <label for="userRealName">
        <g:message code="smUser.userRealName.label" default="用户真实姓名"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="userRealName" value="${smUserInstance?.userRealName}" required="truex" class="myui"/>

</span>
<br>
<g:if test="${ac!='edit'}">
    <span id="divpassword${pageId}}" class="fieldcontain  ">
        <label for="password">
        <g:message code="smUser.password.label" default="密码"/>
        <span class="required-indicator">*</span>
        </label>
        <input id="password" name="password"  type="password" value="${smUserInstance?.password}" class="easyui-validatebox myui"
               required="true"/>


    </span>

    <span id="divrpassword${pageId}}" class="fieldcontain  ">
        <label for="rpassword">
        <g:message code="smUser.rpassword.label" default="确认密码"/>
        <span class="required-indicator">*</span>
        </label>
        <input id="rpassword"  type="password" value="${smUserInstance?.password}" class="easyui-validatebox myui"
               required="true" validtype="equals['#password']"/>
    </span>
</g:if>

</br>

<span id="divpasswordExpired${pageId}}" class="fieldcontain  ">
    <label for="passwordExpired">
        <g:message code="smUser.passwordExpired.label" default="密码失效"/>

    </label>
    <g:checkBox name="passwordExpired" value="${smUserInstance?.passwordExpired}" />
    <div id="passwordExpired_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divuserenabled${pageId}}" class="fieldcontain  ">
    <label for="userenabled">
        <g:message code="smUser.userenabled.label" default="账户启用"/>

    </label>
    <g:checkBox name="userenabled" value="${smUserInstance?.userenabled}"/>
    <div id="userenabled_message" hidden="" name="message" class="errors" role="status"></div>
</span>
<br>
<span id="divaccountExpired${pageId}}" class="fieldcontain  ">
    <label for="accountExpired">
        <g:message code="smUser.accountExpired.label" default="账户失效"/>

    </label>
    <g:checkBox name="accountExpired" value="${smUserInstance?.accountExpired}"/>
    <div id="accountExpired_message" hidden="" name="message" class="errors" role="status"></div>
</span>


<span id="divaccountLocked${pageId}}" class="fieldcontain  ">
    <label for="accountLocked">
        <g:message code="smUser.accountLocked.label" default="账户锁定"/>

    </label>
    <g:checkBox name="accountLocked" value="${smUserInstance?.accountLocked}"/>
    <div id="accountLocked_message" hidden="" name="message" class="errors" role="status"></div>
</span>

</br>



<span id="divaddress${pageId}}" class="fieldcontain  ">
    <label for="address">
        <g:message code="smUser.address.label" default="地址"/>

    </label>
    <g:textField name="address" value="${smUserInstance?.address}" class="myui"/>
    <div id="address_message" hidden="" name="message" class="errors" role="status"></div>
</span>


<span id="divemail${pageId}}" class="fieldcontain  ">
    <label for="email">
        <g:message code="smUser.email.label" default="电子邮箱"/>

    </label>
    <g:textField name="email" value="${smUserInstance?.email}" class="easyui-validatebox myui" validtype="email"/>
    <div id="email_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<br>
<span id="divlinkTel${pageId}}" class="fieldcontain  ">
    <label for="linkTel">
        <g:message code="smUser.linkTel.label" default="联系电话"/>

    </label>
    <g:textField name="linkTel" value="${smUserInstance?.linkTel}" class="myui"/>
    <div id="linkTel_message" hidden="" name="message" class="errors" role="status"></div>
</span>


<span id="divlinkTel1${pageId}}" class="fieldcontain  ">
    <label for="linkTel1">
        <g:message code="smUser.linkTel1.label" default="联系电话1"/>

    </label>
    <g:textField name="linkTel1" value="${smUserInstance?.linkTel1}" class="myui"/>
    <div id="linkTel1_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<br>
<span id="divlinkTel2${pageId}}" class="fieldcontain  ">
    <label for="linkTel2">
        <g:message code="smUser.linkTel2.label" default="联系电话2"/>

    </label>
    <g:textField name="linkTel2" value="${smUserInstance?.linkTel2}" class="myui"/>
    <div id="linkTel2_message" hidden="" name="message" class="errors" role="status"></div>
</span>

<span id="divpsndoc${pageId}" class="fieldcontain">
    <label for="psndoc">
        <g:message code="smuser.psndoc.label" default="人员档案"/>
    </label>
    <g:refTemplate code="refBdPsndoc" model="[id:'psndoc',name:'psndoc.id',value:smUserInstance?.psndoc?.id]"></g:refTemplate>
</span>








