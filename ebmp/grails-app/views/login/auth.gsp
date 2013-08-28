
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <title>EBMP 登录</title>

    <link rel="stylesheet" type="text/css" href="${resource(dir:'css',file: 'my.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir:'themes',file: 'default/easyui.css')}">
    <link rel="stylesheet" type="text/css" href="${resource(dir:'themes',file: 'icon.css')}">

    <script type="text/javascript" src="${resource(dir:'js',file: 'jquery-2.0.0.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js',file: 'jquery.easyui.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir:'js',file: 'locale/easyui-lang-zh_CN.js')}" charset="utf-8"></script>
    <script type="text/javascript" src="${resource(dir:'js',file: 'my.js')}" charset="utf-8"></script>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/><link rel="stylesheet" type="text/css" href="${resource(file: 'login.css',dir: 'css')}"/>
</head>
<body id="j_id2" style="margin-top: 0px;margin: 0px">
<div id="j_id4" style="width:100%;height:100%;">
    <div id="j_id5" style="width:100%;height:100%;">

        <div class="header">
            <div class="title_font">EBMP 液态仓储管理系统</div>
        </div></div>
    <div id="center" style="width:100%;" class="content">

        <div id="contentWrapper"><table id="j_id6">
            <tbody>
            <tr><td class="login_left_desc" colspan="1" rowspan="1"><table id="j_id8">
                <tbody>
                <tr><td><table id="j_id9">
                    <tbody>
                    <tr><td colspan="2" rowspan="1">
                        <span style="color: #1C3A70; font-size: 18px; font-weight: bold;">EBMP 系统</span></td>
                    </tr>
                    <tr><td colspan="1" rowspan="1">
                        <img src="${resource(dir:'images',file: 'logging_icon1.gif')}"/></td>
                        <td colspan="1" rowspan="1">
                            <span>
                                <b style="display: block; margin-top: 20px">简介</b>
                            EBMP系统以企业内部业务流程作为设计模型，能够更简单效率的帮助企业内部管理日常业务。</span></td>
                    </tr>
                    <tr><td colspan="1" rowspan="1">
                        <img src="${resource(dir:'images',file: 'logging_icon2.gif')}"  style="margin-top: 40px;"/></td>
                        <td colspan="1" rowspan="1">
                            <span>
                                <b style="display: block; margin-top: 40px;">功能模块</b> 基础信息管理、合同、采购、入库、出库 等等。</span></td>
                    </tr>
                    </tbody>
                </table>
                </td>
                    <td colspan="1" rowspan="1">
                        <img src="${resource(dir: 'images',file: 'logging_middle.gif')}"  style="margin: 0px 20px 0px 20px;"/></td>
                </tr>
                </tbody>
            </table>
            </td>
                <td class="rightForm" colspan="1" rowspan="1">
                    <form id="loginForm"  method="post" action="${postUrl}"  class="loginForm" autocomplete='off' >

                    <div class="formBorder" align="left">
                        <img src="${resource(dir:'images',file: 'userlogin.gif')}"  style="margin: 0px 0px 10px 10px;"/>
                        <br/><table id="loginForm:j_id17" style="margin-left:40px" class="loginLeftTable">
                        <tbody>
                        <tr>
                            <td>${message(code: "springSecurity.login.loginCorp.label")}:</td>
                            <td> <g:refTemplate code="refBdCorp" model="[id:'corp',name:'loginCorp.id']"/></td>
                        </tr>
                        <tr>
                            <td></td><td class="vbErrorDiv" colspan="1" rowspan="1" style="height: 18px;">公司帐套，登陆不同的公司账。</td>
                        </tr>
                        <tr><td class="formLabel" colspan="1" rowspan="1">
                            用户名：</td>
                            <td class="inputTD" colspan="1" rowspan="1">
                                <input  type="text" name='j_username' id='username' value="" class="inputfield"/></td>
                            </td>
                        </tr>

                        <tr><td colspan="1" rowspan="1"></td>
                            <td class="vbErrorDiv" colspan="1" rowspan="1" style="height: 18px;">用户名必须在1位以上，且不包括中文等特殊字符。</td>
                        </tr>
                        <tr><td class="formLabel" colspan="1" rowspan="1">
                            密码：</td>
                            <td class="inputTD" colspan="1" rowspan="1"> <input type='password'  name='j_password' id='password' value="" class="inputfield"/>
                            </td>
                        </tr>
                        <tr><td colspan="1" rowspan="1"></td>
                            <td class="vbErrorDiv" colspan="1" rowspan="1" style="height: 18px;">密码必须在1位以上，且不包括中文等特殊字符。</td>
                        </tr>
                        <tr><td class="formLabel" colspan="1" rowspan="1">
                            验证码：</td>
                            <td class="inputTD" colspan="1" rowspan="1"><table id="loginForm:j_id28" class="validateTable">
                                <tbody>
                                <tr><td class="validateInputTD" colspan="1" rowspan="1"><input id="validateCode" name="validateCode" type="text" style="" class="validateInput"/>
                                </td>
                                    <td class="validateImg" colspan="1" rowspan="1"><img id='captach' style="vertical-align: middle;cursor:pointer;" src="${createLink(controller:'captcha' )}" onclick="this.src='${createLink(controller: 'captcha')}?'+Math.random();" height="25px" style="margin-top:0px">
                                      </td>
                                </tr>
                                </tbody>
                            </table>
                            </td>
                        </tr>
                        <tr><td colspan="1" rowspan="1"></td>
                            <td class="vbErrorDiv" colspan="1" rowspan="1" style="height: 18px;">请输入验证码(刷新验证码，请点击图片)。</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><g:if test='${flash.message}'>
                                <div class='login_message' style="color: #cc0000;">${flash.message}</div>
                            </g:if></td>
                        </tr>
                        <tr><td colspan="1" rowspan="1"></td>
                            <td colspan="1" rowspan="1">
                                <input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}' style="width: 150px;height: 30px;"/>
                             </td>
                        </tr>
                        </tbody>
                    </table>

                    </div>
                    </form>
                    </td>
            </tr>
            </tbody>
        </table>

        </div></div>

</div>
</body></html>
