<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    System.out.println("request.getContextPath:"+path);
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    System.out.println("basePath:"+basePath);
%>
<html>
<head>
    <title>管理员</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/layui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/loginCss.css">
    <script src="${pageContext.request.contextPath}/static/layui.all.js"></script>
    <style type="text/css">
        .formdiv{
            padding:120px 500px;
        }
        /*解决Chrome下表单自动填充后背景色为黄色*/
        input:-webkit-autofill {
            -webkit-box-shadow: 0 0 0px 1000px white inset;
        }
    </style>
</head>
<body>
<div class="formdiv">
    <form id="contact" action="<%=basePath%>administrators/adminLogin" method="post">
        <h3>管理员登录</h3>
        <h4 style="color:red;">${msg}</h4>
        <fieldset>
            <input placeholder="账号" type="text" name="username" id="userid" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="密码" type="password" name="userpass" tabindex="2" required>
        </fieldset>

        <fieldset>
            <input name="sub" type="button" onclick="tijiao()" id="contact-submit" value="登录" />
        </fieldset>
    </form>
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
    <script>
        $(function () {
            $("#contact-submit").click(function () {
                var testnum = /^\d{10}$/;//正则表达式表示输入10数字
                var id=$("#userid").val();
                var sex = $("#sex").val();
                if (testnum.test(id)) {
                    $("#contact").submit();
                }
                else {
                    $("#contact").submit();}
            })
        })
    </script>



</div>
</body>
</html>
