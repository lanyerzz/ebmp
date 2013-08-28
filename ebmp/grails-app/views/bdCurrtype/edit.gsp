<%@ page import="com.app.bd.currtype.BdCurrtype" %>
<!doctype html>



			<form id="form${pageId}" method="post" >
				<g:hiddenField name="id" value="${bdCurrtypeInstance?.id}" />
				<g:hiddenField name="version" value="${bdCurrtypeInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>

			</form>


