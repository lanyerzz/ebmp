<html xmlns="http://www.w3.org/1999/html">

<head>

		<title><g:message code="springSecurity.login.title"/></title>
    <link rel="stylesheet" type="text/css" href="${resource(dir:'css',file: 'my.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir:'themes',file: 'default/easyui.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir:'themes',file: 'icon.css')}">

    <jq:resources/>
    <script type="text/javascript" src="${resource(dir:'js',file: 'jquery.easyui.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js',file: 'locale/easyui-lang-zh_CN.js')}" charset="utf-8"></script>
    <script type="text/javascript" src="${resource(dir:'js',file: 'my.js')}" charset="utf-8"></script>

	<style type='text/css' media='screen'>

	#login {
		margin: 15px 0px;
		padding: 0px;
		text-align: center;
	}

	#login .inner {
		width: 340px;
		padding-bottom: 6px;
		margin: 60px auto;
		text-align: left;



	}

	#login .inner .fheader {
		padding: 18px 26px 14px 26px;
		background-color: #f7f7ff;
		margin: 0px 0 14px 0;
		color: #2e3741;
		font-size: 18px;
		font-weight: bold;
	}

	#login .inner .cssform p {
		clear: left;
		margin: 0;
		padding: 4px 0 3px 0;
		padding-left: 105px;
		margin-bottom: 20px;
		height: 1%;
	}

	#login .inner .cssform input[type='text'] {
		width: 200px;
	}

	#login .inner .cssform label {
		font-weight: bold;
		float: left;
		text-align: right;
		margin-left: -105px;
		width: 110px;
		padding-top: 3px;
		padding-right: 10px;
	}

	#login #remember_me_holder {
		padding-left: 120px;
	}

	#login #submit {
		margin-left: 15px;
	}

	#login #remember_me_holder label {
		float: none;
		margin-left: 0;
		text-align: left;
		width: 200px
	}

	#login .inner .login_message {
		padding: 6px 25px 20px 25px;
		color: #c33;
	}

	#login .inner .text_ {
		width: 200px;

	}
    input{
        display:inline-block;
        white-space:nowrap;
        font-size:16px;
        margin:0;
        padding:0;
        border:1px solid #A4BED4;
        background:#fff;
    }

	</style>
    <script>

//        function test(value,name){
//         //   $('#corpname').click(function(){alert('click');});
//
//         var v=  $('[name=test]');
//
//
//            var data=$.data(this,"searchbox");
//            var opts=data.options;
////            opts.value=$(this).val();
//            opts.value='xxxxxxxxx';
//            $(v).val(opts.value);
//
//            $(v).removeClass("searchbox-prompt");
//            $(v).attr("disabled",true);;
//        }

    </script>
</head>

<body style="background-image:url(${resource(dir: 'images',file: 'top.jpg')});background-repeat:repeat-x">

<img src="${resource(dir: 'images',file: 'log.jpg')}" style="padding-top: 100px;" width="550" height="70" />
<div id='login'>
	<div class='inner'>

		<g:if test='${flash.message}'>
			<div class='login_message'>${flash.message}</div>
		</g:if>

		<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
            %{--<input  type="hidden" name="loginCorp.id" id="corpid" value="00000000000000000000000000000009"/>--}%

            <p>
                <label for='corp'>${message(code: "springSecurity.login.loginCorp.label")}:</label>

            <g:refTemplate code="refBdCorp" model="[id:'corp',name:'loginCorp.id']"/>

            </p>
			<p>
				<label for='username'><g:message code="springSecurity.login.username.label"/>:</label>
				<input type='text'  name='j_username' id='username' value="admin" />
			</p>

			<p>
				<label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
				<input type='password' class='text_' name='j_password' id='password' value="123"/>
			</p>


            <p>
                <label for='validateCode'><g:message code="springSecurity.login.validateCode.label"/>:</label>
                <input type='text' class='text_' name='validateCode' id='validateCode' style="width: 118px;margin-top: 0px;vertical-align: middle" />
                <img style="vertical-align: middle;cursor:pointer" src="${createLink(controller:'captcha' )}" onclick="this.src='${createLink(controller: 'captcha')}?'+Math.random();" height="25px" style="margin-top:0px">
            </p>



          %{--  <p id="remember_me_holder">
                <input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                <label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
            </p>--}%

			<p>
				<input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}' style="width: 150px;height: 30px;margin-top: 30px"/>
			</p>
		</form>
	</div>
</div>



<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>
</body>
</html>
