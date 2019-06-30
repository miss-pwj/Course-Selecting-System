<%--
  Created by IntelliJ IDEA.
  User: 追忆
  Date: 2019/6/26
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    System.out.println("request.getContextPath:" + path);
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    System.out.println("basePath:" + basePath);
%>
<html>
<head>
    <script type="text/javascript" src="../static/js/jquery-3.3.1.js" >
    </script>
    <script type="text/javascript" >

        function reloadCheckImg()
        {
            document.getElementsByTagName("img").src="<%=basePath%>img.jsp?"+Math.random();
            $("img").attr("src","<%=basePath%>img.jsp?t="+(new Date().getTime()));  //<img src="...">
        }
        $(document).ready(function(){
            $("#checkcodeId").blur(function(){

                var $checkcode = $("#checkcodeId").val();
                //校验   :文本框中输入的值 发送到服务端。
                //服务端： 获取文本框输入的值 ，和真实验证码图片中的值对比 ，并返回验证结果
                $.post(
                    "CheckCode",//服务端地址
                    "checkcode="+$checkcode ,
                    function(result){//图片地址（imgs/right.jpg   imgs/wrong.jpg）
                        //result:  imgs/right.jpg
                        var resultHtml =  $("<img src='"+result+"' height='15' width='15px'   />") ;
                        alert(resultHtml+"zheli")
                        $("#tip").html(resultHtml);
                    }
                );
            });
        });
    </script>
    <title>验证码</title>
</head>
<body>


<form id="contact" action="<%=basePath%>check" method="post">
    学生id:<input type="text" name="stuId"/><br>
    学生姓名：<input type="text" name="stuName"/><br>
    <input type="submit" value="submit"><br>
</form>
    <input type="text" name="checkcode" id="checkcodeId" size="4"  />
    <!-- 验证码-->
        <a href="javascript:reloadCheckImg();"><img src="<%=basePath%>img.jsp"/></a>
 <span id="tip"></span>

</body>
</html>
