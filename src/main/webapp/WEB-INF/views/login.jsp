<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
//    System.out.println("request.getContextPath:"+path);
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
//    System.out.println("basePath:"+basePath);
%>
<html>
<head>
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
<div class="formdiv">
    <form id="contact" action="<%=basePath%>check" method="post">
        <h3>选课系统</h3>
        <h4>第一次登陆后请尽快更改初始密码</h4>
        <h4 style="color:red;">${msg}</h4>
        <fieldset>
            <input placeholder="学号" type="text" name="userid" id="userid" tabindex="1" required autofocus>
        </fieldset>
        <fieldset>
            <input placeholder="密码" type="password" name="userpass" tabindex="2" required>
        </fieldset>
        <fieldset>
          <input placeholder="学生" type="radio" name="sex" value="1" checked required>学生<%--设置默认选择学生--%>
            <input placeholder="老师" type="radio" name="sex" value="2" required>老师
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
                    alert("请输入正确学号");}
            })
        })
    </script>

  <%--  <form action="<%=basePath%>register" method="post">
        <input type="submit" value="注册">
    </form>--%>
        <a href="<%=basePath%>admin">管理员</a>

</div>
</body>
</html>
