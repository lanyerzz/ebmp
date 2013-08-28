<%@ page import="com.app.sm.roles.SmRoles" %>

<script>

</script>

<g:hiddenField name="id" value="${smRolesInstance?.id}" />
<g:hiddenField name="version" value="${smRolesInstance?.version}" />


<div id="divroleCode${pageId}}" class="fieldcontain  required">
    <label for="roleCode" class="required">
        <g:message code="smRoles.roleCode.label" default="角色编码" required="true"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="roleCode" required="" value="${smRolesInstance?.roleCode?:'ROLE_'}"  class="easyui-validatebox" validType="startWith['ROLE_']"/>
    <div id="roleCode_message" hidden="" name="message" class="errors" role="status"></div>
</div>


<div id="divroleName${pageId}}" class="fieldcontain ">
    <label for="roleName" class="requiredr">
        <g:message code="smRoles.roleName.label" default="角色名称" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="roleName"  value="${smRolesInstance?.roleName}" class="easyui-validatebox" required="true"/>
</div>


<div id="divdescription${pageId}}" class="fieldcontain  ">
    <label for="description">
        <g:message code="smRoles.description.label" default="描述" />
        
    </label>
    <g:textField name="description" value="${smRolesInstance?.description}"/>
</div>





