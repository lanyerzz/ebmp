

<g:hiddenField name="id" value="${database?.id}" />
<g:hiddenField name="version" value="${database?.version}" />


<span  class="fieldcontain  ">
    <label for="url${pageId}">
        URL
    </label>

    <input id="url${pageId}" name="url"  value="${database?.url}"  >
</span>

<span  class="fieldcontain  ">
    <label for="username${pageId}">
        用户名

    </label>

    <input id="username${pageId}" name="username"   value="${database?.username}" >
</span>
<span  class="fieldcontain  ">
    <label for="password${pageId}">
        密码
    </label>

    <input type="password" id="password${pageId}" name="password"  value="" >
</span>
<span  class="fieldcontain  ">
    <label for="driverClassName${pageId}">
        驱动
    </label>

    <input  id="driverClassName${pageId}" name="driverClassName"  value="${database?.driverClassName}" >
</span>
