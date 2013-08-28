<%@ page import="com.app.bd.currtype.BdCurrtype" %>
<!doctype html>

		<div id="create-bdCurrtype" class="content scaffold-create" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

			<form id="form${pageId}" action="save" >
                <g:hiddenField name="id" value="${bdCurrtypeInstance?.id}" />
                <g:hiddenField name="version" value="${bdCurrtypeInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>

			</form>
		</div>


