<%--
  Created by IntelliJ IDEA.
  User: lcl
  Date: 2019/6/27
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <title>登录</title>
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
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div class="formdiv">
    <form id="contact" action="<%=basePath%>administrators/addstudent" method="post">
        <h4>增加学生</h4>
        <h4 style="color:red;">${msg}</h4>
        <fieldset>
            <input placeholder="学号" type="text" name="userid" id="userid" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="姓名" type="text" name="username" tabindex="2" required>
        </fieldset>
        <fieldset>
            <input placeholder="密码" type="password" name="userpass" tabindex="2" required>
        </fieldset>
        <fieldset>
            <select name="insid"placeholder="学院">
                <option value ="1001">信息科学技术学院</option>
                <option value ="1002">医学院</option>
                <option value="1004">管理学院</option>
                <option value="1005">经济学院</option>
            </select>
        </fieldset>
        <fieldset>
            <input name="sub" type="button" onclick="tijiao()" id="contact-submit" value="登录" />
        </fieldset>
    </form>
</div>
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
                    alert("请输入正确学号");}
            })
        })
    </script>
</body>
</html>
