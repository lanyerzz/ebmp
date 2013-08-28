<%=packageName%>
<% import grails.persistence.Event %>
<g:hiddenField name="id" value="\${${propertyName}?.id}" />
<g:hiddenField name="version" value="\${${propertyName}?.version}" />
<g:hiddenField name="businessType.id" value="\${${propertyName}?.businessType?.id}"/>
<g:hiddenField name="billTypeCode" value="\${${propertyName}?.billTypeCode}" ></g:hiddenField>
<g:hiddenField name="billtype.id" value="\${${propertyName}?.billtype?.id}" ></g:hiddenField>
<g:hiddenField name="sourceBillType.id" value="\${${propertyName}?.sourceBillType?.id}" ></g:hiddenField>
<g:hiddenField name="bdCorp.id" value="\${${propertyName}?.bdCorp?.id}"></g:hiddenField>




<%  excludedProps = Event.allEvents.toList() << 'version' << 'dateCreated' << 'lastUpdated'
persistentPropNames = domainClass.persistentProperties*.name
boolean hasHibernate = pluginManager?.hasGrailsPlugin('hibernate')
if (hasHibernate && org.codehaus.groovy.grails.orm.hibernate.cfg.GrailsDomainBinder.getMapping(domainClass)?.identity?.generator == 'assigned') {
    persistentPropNames << domainClass.identifier.name
}
props = domainClass.properties.findAll { persistentPropNames.contains(it.name) && !excludedProps.contains(it.name) }
Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
for (p in props) {
    if (p.embedded) {
        def embeddedPropNames = p.component.persistentProperties*.name
        def embeddedProps = p.component.properties.findAll { embeddedPropNames.contains(it.name) && !excludedProps.contains(it.name) }
        Collections.sort(embeddedProps, comparator.constructors[0].newInstance([p.component] as Object[]))
%><fieldset class="embedded"><legend><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></legend><%
        for (ep in p.component.properties) {
            renderFieldForProperty(ep, p.component, "${p.name}.")
        }
%></fieldset><%
        } else {
            renderFieldForProperty(p, domainClass)
        }
    }

    private renderFieldForProperty(p, owningClass, prefix = "") {
        boolean hasHibernate = pluginManager?.hasGrailsPlugin('hibernate')
        boolean display = true
        boolean required = false
        if (hasHibernate) {
            cp = owningClass.constrainedProperties[p.name]
            display = (cp ? cp.display : true)
            required = (cp ? !(cp.propertyType in [boolean, Boolean]) && !cp.nullable && (cp.propertyType != String || !cp.blank) : false)
        }
        if (display) { %>


<span  class="fieldcontain  ${required ? 'required' : ''}">
    <label for="${prefix}${p.name}\${pageId}" <% if (required) { %>class="required"<% } %> >
        <g:message code="${domainClass.propertyName}.${prefix}${p.name}.label" default="${p.naturalName}" />
        <% if (required) { %><span class="required-indicator">*</span><% } %>
    </label>

    <%if(p.name=='bdCorp'){%>
    <input id="bdCorp\${pageId}" name="bdCorp" value="\${${propertyName}?.bdCorp?.unitName}" disabled="true"   canSave="false">
    <%}else if(p.name=='maker'){%>
    <g:hiddenField name="maker.id" value="\${${propertyName}?.maker?.id}"></g:hiddenField>
    <input id="maker\${pageId}" name="maker" value="\${${propertyName}?.maker?.userRealName}" disabled="true"   canSave="false">
    <%}else if(p.name=='checker'){%>
    <input id="checker\${pageId}" name="checker" value="\${${propertyName}?.checker?.userRealName}" disabled="true"   canSave="false">
    <%}else if(p.name=='makeDate'){%>
    <g:hiddenField name="makeDate" value="\${${propertyName}?.makeDate?.getTime()}"></g:hiddenField>
    <input id="makeDate\${pageId}" name="makeDate" value="\${${propertyName}?.makeDate?.getTime()}" disabled="true" date  >
    <%}else if(p.name=='checkDate'){%>
    <g:hiddenField name="checkDate" value="\${${propertyName}?.checkDate?.getTime()}"></g:hiddenField>
    <input id="checkDate\${pageId}" name="checkDate" value="\${${propertyName}?.checkDate?.getTime()}" disabled="true" date  >
    <%}else if(p.name=='billno'){%>
    <input id="billno\${pageId}" name="billno"  value="" disabled="true"   >
    <%}else if(p.name=='businessType'){%>
    <input id="businessType\${pageId}" name="businessType"  value="\${${propertyName}?.businessType?.name}" disabled="true"   >
    <%}else if(p.type=='int'){%>
    <input id="${p.name}\${pageId}" name="${p.name}"  value="\${${propertyName}?.${p.name}}" class="easyui-numberbox" >
    <%}else if(p.type==Date){%>
    <input id="${p.name}\${pageId}" name="${p.name}"   value="\${${propertyName}?.${p.name}?.getTime()}" class="easyui-datebox" date validType="dateValidate" >
    <%}else if(p.type==Boolean){%>
    <g:checkBox id="${p.name}\${pageId}" name="${p.name}" value="\${${propertyName}?.${p.name}"></g:checkBox>
    <%}else if(p.type==BigDecimal){%>
    <input id="${p.name}\${pageId}" name="${p.name}"  value="\${${propertyName}?.${p.name}}" class="easyui-numberbox" data-options="precision:2">

    <%}else if(p.oneToOne){%>


    <g:refTemplate code="ref${p.type.simpleName}" model="[id:'${p.name}',name:'${p.name}.id',value:${propertyName}?.${p.name}?.id]"></g:refTemplate>

    <%}else{%>
    <input id="${p.name}\${pageId}" name="${p.name}"  value="\${${propertyName}?.${p.name}}">
    <%}%>
</span>
<%  }   } %>
