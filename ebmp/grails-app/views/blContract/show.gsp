<%@ page import="com.app.ywms.contract.BaseContract" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'blContract.label', default: 'BlContract')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-blContract" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                 default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-blContract" class="content scaffold-show" role="main">
<h1><g:message code="default.show.label" args="[entityName]"/></h1>
<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
</g:if>
<ol class="property-list blContract">

<g:if test="${blContractInstance?.zgksrq}">
    <li class="fieldcontain">
        <span id="zgksrq-label" class="property-label"><g:message code="blContract.zgksrq.label"
                                                                  default="Zgksrq"/></span>

        <span class="property-value" aria-labelledby="zgksrq-label"><g:formatDate
                date="${blContractInstance?.zgksrq}"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.zgjsrq}">
    <li class="fieldcontain">
        <span id="zgjsrq-label" class="property-label"><g:message code="blContract.zgjsrq.label"
                                                                  default="Zgjsrq"/></span>

        <span class="property-value" aria-labelledby="zgjsrq-label"><g:formatDate
                date="${blContractInstance?.zgjsrq}"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.zdrq}">
    <li class="fieldcontain">
        <span id="zdrq-label" class="property-label"><g:message code="blContract.zdrq.label" default="Zdrq"/></span>

        <span class="property-value" aria-labelledby="zdrq-label"><g:formatDate
                date="${blContractInstance?.zdrq}"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.shrq}">
    <li class="fieldcontain">
        <span id="shrq-label" class="property-label"><g:message code="blContract.shrq.label" default="Shrq"/></span>

        <span class="property-value" aria-labelledby="shrq-label"><g:formatDate
                date="${blContractInstance?.shrq}"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.azqlj}">
    <li class="fieldcontain">
        <span id="azqlj-label" class="property-label"><g:message code="blContract.azqlj.label" default="Azqlj"/></span>

        <span class="property-value" aria-labelledby="azqlj-label"><g:formatBoolean
                boolean="${blContractInstance?.azqlj}"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.bdCumandoc}">
    <li class="fieldcontain">
        <span id="bdCumandoc-label" class="property-label"><g:message code="blContract.bdCumandoc.label"
                                                                      default="Bd Cumandoc"/></span>

        <span class="property-value" aria-labelledby="bdCumandoc-label"><g:link controller="bdCumandoc" action="show"
                                                                                id="${blContractInstance?.bdCumandoc?.id}">${blContractInstance?.bdCumandoc?.encodeAsHTML()}</g:link></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.bdInvmandoc}">
    <li class="fieldcontain">
        <span id="bdInvmandoc-label" class="property-label"><g:message code="blContract.bdInvmandoc.label"
                                                                       default="Bd Invmandoc"/></span>

        <span class="property-value" aria-labelledby="bdInvmandoc-label"><g:link controller="bdInvmandoc" action="show"
                                                                                 id="${blContractInstance?.bdInvmandoc?.id}">${blContractInstance?.bdInvmandoc?.encodeAsHTML()}</g:link></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.bdlgt}">
    <li class="fieldcontain">
        <span id="bdlgt-label" class="property-label"><g:message code="blContract.bdlgt.label" default="Bdlgt"/></span>

        <span class="property-value" aria-labelledby="bdlgt-label"><g:fieldValue bean="${blContractInstance}"
                                                                                 field="bdlgt"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.bgsh}">
    <li class="fieldcontain">
        <span id="bgsh-label" class="property-label"><g:message code="blContract.bgsh.label" default="Bgsh"/></span>

        <span class="property-value" aria-labelledby="bgsh-label"><g:fieldValue bean="${blContractInstance}"
                                                                                field="bgsh"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.bz}">
    <li class="fieldcontain">
        <span id="bz-label" class="property-label"><g:message code="blContract.bz.label" default="Bz"/></span>

        <span class="property-value" aria-labelledby="bz-label"><g:fieldValue bean="${blContractInstance}"
                                                                              field="bz"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.ccdj}">
    <li class="fieldcontain">
        <span id="ccdj-label" class="property-label"><g:message code="blContract.ccdj.label" default="Ccdj"/></span>

        <span class="property-value" aria-labelledby="ccdj-label"><g:fieldValue bean="${blContractInstance}"
                                                                                field="ccdj"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.ccfjsfs}">
    <li class="fieldcontain">
        <span id="ccfjsfs-label" class="property-label"><g:message code="blContract.ccfjsfs.label"
                                                                   default="Ccfjsfs"/></span>

        <span class="property-value" aria-labelledby="ccfjsfs-label"><g:fieldValue bean="${blContractInstance}"
                                                                                   field="ccfjsfs"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.ccfzq}">
    <li class="fieldcontain">
        <span id="ccfzq-label" class="property-label"><g:message code="blContract.ccfzq.label" default="Ccfzq"/></span>

        <span class="property-value" aria-labelledby="ccfzq-label"><g:fieldValue bean="${blContractInstance}"
                                                                                 field="ccfzq"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.cczq}">
    <li class="fieldcontain">
        <span id="cczq-label" class="property-label"><g:message code="blContract.cczq.label" default="Cczq"/></span>

        <span class="property-value" aria-labelledby="cczq-label"><g:fieldValue bean="${blContractInstance}"
                                                                                field="cczq"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.checkType}">
    <li class="fieldcontain">
        <span id="checkType-label" class="property-label"><g:message code="blContract.checkType.label"
                                                                     default="Check Type"/></span>

        <span class="property-value" aria-labelledby="checkType-label"><g:fieldValue bean="${blContractInstance}"
                                                                                     field="checkType"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.clhcqdj}">
    <li class="fieldcontain">
        <span id="clhcqdj-label" class="property-label"><g:message code="blContract.clhcqdj.label"
                                                                   default="Clhcqdj"/></span>

        <span class="property-value" aria-labelledby="clhcqdj-label"><g:fieldValue bean="${blContractInstance}"
                                                                                   field="clhcqdj"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.clhdj}">
    <li class="fieldcontain">
        <span id="clhdj-label" class="property-label"><g:message code="blContract.clhdj.label" default="Clhdj"/></span>

        <span class="property-value" aria-labelledby="clhdj-label"><g:fieldValue bean="${blContractInstance}"
                                                                                 field="clhdj"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.contractNo}">
    <li class="fieldcontain">
        <span id="contractNo-label" class="property-label"><g:message code="blContract.contractNo.label"
                                                                      default="Contract No"/></span>

        <span class="property-value" aria-labelledby="contractNo-label"><g:fieldValue bean="${blContractInstance}"
                                                                                      field="contractNo"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.contractescribe}">
    <li class="fieldcontain">
        <span id="contractescribe-label" class="property-label"><g:message code="blContract.contractescribe.label"
                                                                           default="Contractescribe"/></span>

        <span class="property-value" aria-labelledby="contractescribe-label"><g:fieldValue bean="${blContractInstance}"
                                                                                           field="contractescribe"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.contrantNo2}">
    <li class="fieldcontain">
        <span id="contrantNo2-label" class="property-label"><g:message code="blContract.contrantNo2.label"
                                                                       default="Contrant No2"/></span>

        <span class="property-value" aria-labelledby="contrantNo2-label"><g:fieldValue bean="${blContractInstance}"
                                                                                       field="contrantNo2"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.cqdj}">
    <li class="fieldcontain">
        <span id="cqdj-label" class="property-label"><g:message code="blContract.cqdj.label" default="Cqdj"/></span>

        <span class="property-value" aria-labelledby="cqdj-label"><g:fieldValue bean="${blContractInstance}"
                                                                                field="cqdj"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.cqhlj}">
    <li class="fieldcontain">
        <span id="cqhlj-label" class="property-label"><g:message code="blContract.cqhlj.label" default="Cqhlj"/></span>

        <span class="property-value" aria-labelledby="cqhlj-label"><g:fieldValue bean="${blContractInstance}"
                                                                                 field="cqhlj"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.cszq}">
    <li class="fieldcontain">
        <span id="cszq-label" class="property-label"><g:message code="blContract.cszq.label" default="Cszq"/></span>

        <span class="property-value" aria-labelledby="cszq-label"><g:fieldValue bean="${blContractInstance}"
                                                                                field="cszq"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.dateCreated}">
    <li class="fieldcontain">
        <span id="dateCreated-label" class="property-label"><g:message code="blContract.dateCreated.label"
                                                                       default="Date Created"/></span>

        <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate
                date="${blContractInstance?.dateCreated}"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.dffstdcz}">
    <li class="fieldcontain">
        <span id="dffstdcz-label" class="property-label"><g:message code="blContract.dffstdcz.label"
                                                                    default="Dffstdcz"/></span>

        <span class="property-value" aria-labelledby="dffstdcz-label"><g:fieldValue bean="${blContractInstance}"
                                                                                    field="dffstdcz"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.dffstdemail}">
    <li class="fieldcontain">
        <span id="dffstdemail-label" class="property-label"><g:message code="blContract.dffstdemail.label"
                                                                       default="Dffstdemail"/></span>

        <span class="property-value" aria-labelledby="dffstdemail-label"><g:fieldValue bean="${blContractInstance}"
                                                                                       field="dffstdemail"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.dflxdh}">
    <li class="fieldcontain">
        <span id="dflxdh-label" class="property-label"><g:message code="blContract.dflxdh.label"
                                                                  default="Dflxdh"/></span>

        <span class="property-value" aria-labelledby="dflxdh-label"><g:fieldValue bean="${blContractInstance}"
                                                                                  field="dflxdh"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.dflxr}">
    <li class="fieldcontain">
        <span id="dflxr-label" class="property-label"><g:message code="blContract.dflxr.label" default="Dflxr"/></span>

        <span class="property-value" aria-labelledby="dflxr-label"><g:fieldValue bean="${blContractInstance}"
                                                                                 field="dflxr"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.dlgt}">
    <li class="fieldcontain">
        <span id="dlgt-label" class="property-label"><g:message code="blContract.dlgt.label" default="Dlgt"/></span>

        <span class="property-value" aria-labelledby="dlgt-label"><g:fieldValue bean="${blContractInstance}"
                                                                                field="dlgt"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.fbzjts}">
    <li class="fieldcontain">
        <span id="fbzjts-label" class="property-label"><g:message code="blContract.fbzjts.label"
                                                                  default="Fbzjts"/></span>

        <span class="property-value" aria-labelledby="fbzjts-label"><g:fieldValue bean="${blContractInstance}"
                                                                                  field="fbzjts"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.fkr}">
    <li class="fieldcontain">
        <span id="fkr-label" class="property-label"><g:message code="blContract.fkr.label" default="Fkr"/></span>

        <span class="property-value" aria-labelledby="fkr-label"><g:fieldValue bean="${blContractInstance}"
                                                                               field="fkr"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.gh}">
    <li class="fieldcontain">
        <span id="gh-label" class="property-label"><g:message code="blContract.gh.label" default="Gh"/></span>

        <span class="property-value" aria-labelledby="gh-label"><g:fieldValue bean="${blContractInstance}"
                                                                              field="gh"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.htsl}">
    <li class="fieldcontain">
        <span id="htsl-label" class="property-label"><g:message code="blContract.htsl.label" default="Htsl"/></span>

        <span class="property-value" aria-labelledby="htsl-label"><g:fieldValue bean="${blContractInstance}"
                                                                                field="htsl"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.jjtk}">
    <li class="fieldcontain">
        <span id="jjtk-label" class="property-label"><g:message code="blContract.jjtk.label" default="Jjtk"/></span>

        <span class="property-value" aria-labelledby="jjtk-label"><g:fieldValue bean="${blContractInstance}"
                                                                                field="jjtk"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.lastUpdated}">
    <li class="fieldcontain">
        <span id="lastUpdated-label" class="property-label"><g:message code="blContract.lastUpdated.label"
                                                                       default="Last Updated"/></span>

        <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate
                date="${blContractInstance?.lastUpdated}"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.lybzj}">
    <li class="fieldcontain">
        <span id="lybzj-label" class="property-label"><g:message code="blContract.lybzj.label" default="Lybzj"/></span>

        <span class="property-value" aria-labelledby="lybzj-label"><g:fieldValue bean="${blContractInstance}"
                                                                                 field="lybzj"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.mcqfsl}">
    <li class="fieldcontain">
        <span id="mcqfsl-label" class="property-label"><g:message code="blContract.mcqfsl.label"
                                                                  default="Mcqfsl"/></span>

        <span class="property-value" aria-labelledby="mcqfsl-label"><g:fieldValue bean="${blContractInstance}"
                                                                                  field="mcqfsl"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.mcsts}">
    <li class="fieldcontain">
        <span id="mcsts-label" class="property-label"><g:message code="blContract.mcsts.label" default="Mcsts"/></span>

        <span class="property-value" aria-labelledby="mcsts-label"><g:fieldValue bean="${blContractInstance}"
                                                                                 field="mcsts"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.mtsyf}">
    <li class="fieldcontain">
        <span id="mtsyf-label" class="property-label"><g:message code="blContract.mtsyf.label" default="Mtsyf"/></span>

        <span class="property-value" aria-labelledby="mtsyf-label"><g:fieldValue bean="${blContractInstance}"
                                                                                 field="mtsyf"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.myfs}">
    <li class="fieldcontain">
        <span id="myfs-label" class="property-label"><g:message code="blContract.myfs.label" default="Myfs"/></span>

        <span class="property-value" aria-labelledby="myfs-label"><g:fieldValue bean="${blContractInstance}"
                                                                                field="myfs"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.rksx}">
    <li class="fieldcontain">
        <span id="rksx-label" class="property-label"><g:message code="blContract.rksx.label" default="Rksx"/></span>

        <span class="property-value" aria-labelledby="rksx-label"><g:fieldValue bean="${blContractInstance}"
                                                                                field="rksx"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.rkszddrjfcs}">
    <li class="fieldcontain">
        <span id="rkszddrjfcs-label" class="property-label"><g:message code="blContract.rkszddrjfcs.label"
                                                                       default="Rkszddrjfcs"/></span>

        <span class="property-value" aria-labelledby="rkszddrjfcs-label"><g:formatBoolean
                boolean="${blContractInstance?.rkszddrjfcs}"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.shr}">
    <li class="fieldcontain">
        <span id="shr-label" class="property-label"><g:message code="blContract.shr.label" default="Shr"/></span>

        <span class="property-value" aria-labelledby="shr-label"><g:link controller="smUser" action="show"
                                                                         id="${blContractInstance?.shr?.id}">${blContractInstance?.shr?.encodeAsHTML()}</g:link></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.signAddress}">
    <li class="fieldcontain">
        <span id="signAddress-label" class="property-label"><g:message code="blContract.signAddress.label"
                                                                       default="Sign Address"/></span>

        <span class="property-value" aria-labelledby="signAddress-label"><g:fieldValue bean="${blContractInstance}"
                                                                                       field="signAddress"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.signDate}">
    <li class="fieldcontain">
        <span id="signDate-label" class="property-label"><g:message code="blContract.signDate.label"
                                                                    default="Sign Date"/></span>

        <span class="property-value" aria-labelledby="signDate-label"><g:fieldValue bean="${blContractInstance}"
                                                                                    field="signDate"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.ssbaf}">
    <li class="fieldcontain">
        <span id="ssbaf-label" class="property-label"><g:message code="blContract.ssbaf.label" default="Ssbaf"/></span>

        <span class="property-value" aria-labelledby="ssbaf-label"><g:fieldValue bean="${blContractInstance}"
                                                                                 field="ssbaf"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.wfjsczh}">
    <li class="fieldcontain">
        <span id="wfjsczh-label" class="property-label"><g:message code="blContract.wfjsczh.label"
                                                                   default="Wfjsczh"/></span>

        <span class="property-value" aria-labelledby="wfjsczh-label"><g:fieldValue bean="${blContractInstance}"
                                                                                   field="wfjsczh"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.wfjsemail}">
    <li class="fieldcontain">
        <span id="wfjsemail-label" class="property-label"><g:message code="blContract.wfjsemail.label"
                                                                     default="Wfjsemail"/></span>

        <span class="property-value" aria-labelledby="wfjsemail-label"><g:fieldValue bean="${blContractInstance}"
                                                                                     field="wfjsemail"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.wflxdh}">
    <li class="fieldcontain">
        <span id="wflxdh-label" class="property-label"><g:message code="blContract.wflxdh.label"
                                                                  default="Wflxdh"/></span>

        <span class="property-value" aria-labelledby="wflxdh-label"><g:fieldValue bean="${blContractInstance}"
                                                                                  field="wflxdh"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.wflxr}">
    <li class="fieldcontain">
        <span id="wflxr-label" class="property-label"><g:message code="blContract.wflxr.label" default="Wflxr"/></span>

        <span class="property-value" aria-labelledby="wflxr-label"><g:fieldValue bean="${blContractInstance}"
                                                                                 field="wflxr"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.zdr}">
    <li class="fieldcontain">
        <span id="zdr-label" class="property-label"><g:message code="blContract.zdr.label" default="Zdr"/></span>

        <span class="property-value" aria-labelledby="zdr-label"><g:link controller="smUser" action="show"
                                                                         id="${blContractInstance?.zdr?.id}">${blContractInstance?.zdr?.encodeAsHTML()}</g:link></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.zgdj}">
    <li class="fieldcontain">
        <span id="zgdj-label" class="property-label"><g:message code="blContract.zgdj.label" default="Zgdj"/></span>

        <span class="property-value" aria-labelledby="zgdj-label"><g:fieldValue bean="${blContractInstance}"
                                                                                field="zgdj"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.zxdj}">
    <li class="fieldcontain">
        <span id="zxdj-label" class="property-label"><g:message code="blContract.zxdj.label" default="Zxdj"/></span>

        <span class="property-value" aria-labelledby="zxdj-label"><g:fieldValue bean="${blContractInstance}"
                                                                                field="zxdj"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.zxjl}">
    <li class="fieldcontain">
        <span id="zxjl-label" class="property-label"><g:message code="blContract.zxjl.label" default="Zxjl"/></span>

        <span class="property-value" aria-labelledby="zxjl-label"><g:fieldValue bean="${blContractInstance}"
                                                                                field="zxjl"/></span>

    </li>
</g:if>

<g:if test="${blContractInstance?.zxsh}">
    <li class="fieldcontain">
        <span id="zxsh-label" class="property-label"><g:message code="blContract.zxsh.label" default="Zxsh"/></span>

        <span class="property-value" aria-labelledby="zxsh-label"><g:fieldValue bean="${blContractInstance}"
                                                                                field="zxsh"/></span>

    </li>
</g:if>

</ol>
<g:form>
    <fieldset class="buttons">
        <g:hiddenField name="id" value="${blContractInstance?.id}"/>
        <g:link class="edit" action="edit" id="${blContractInstance?.id}"><g:message code="default.button.edit.label"
                                                                                     default="Edit"/></g:link>
        <g:actionSubmit class="delete" action="delete"
                        value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                        onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
    </fieldset>
</g:form>
</div>
</body>
</html>
